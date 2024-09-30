package domain

import (
	sql "database/sql"
	"fmt"
	"log"
	defs "sabina/base/domain/defs"
	srvs "sabina/base/domain/services"
	tools "sabina/base/domain/tools"
	"time"

	_ "github.com/go-sql-driver/mysql"
)

var mariaDBServiceVersion = tools.NewVersion(0, 1, 0)

type MariaDBService struct {
	srvs.LdService
	admChan     chan (srvs.LdServiceCom) // Canal de comunicació d'events del servei.
	cache       DbCache
	state       srvs.ServiceState // Estat en que es troba la instància del servei.
	addressIP   string            // Adreça IP del servidor de base de dades.
	addressPort int               // Port d'accés al servidor de base de dades.
	dbName      string            // Nom de la base de dades.
	username    string            // Usuari del gestor de la base de dades.
	password    string            // Clau de pass de l'usuari (versió de desenvolupament).
	DbConn      *sql.DB           // Connexió a la base de dades.
}

// Builders ===========================
func NewMariaDBService(pChan chan (srvs.LdServiceCom), pAddressIP string, pAddressPort int, pDbName, pUser, pPass string) *MariaDBService {
	service := &MariaDBService{
		state:       srvs.ServiceUnknown,
		cache:       *(*DbCache).Create(nil),
		admChan:     pChan,
		addressIP:   pAddressIP,
		addressPort: pAddressPort,
		dbName:      pDbName,
		username:    pUser,
		password:    pPass,
		DbConn:      nil,
	}

	pChan <- srvs.NewServiceCom(service, srvs.ServiceComInstantiated, nil)
	return service
}

// Getters ============================
func (sDB MariaDBService) AddressIP() string { return sDB.addressIP }
func (sDB MariaDBService) AddressPort() int  { return sDB.addressPort }
func (sDB MariaDBService) DbName() string    { return sDB.dbName }
func (sDB MariaDBService) UserName() string  { return sDB.username }

// Interfície 'LdService' ==============
func (sDB MariaDBService) ServiceName() string             { return "Servei MariaDB" }
func (sDB MariaDBService) ServiceState() srvs.ServiceState { return sDB.state }
func (sDB MariaDBService) ServiceVersion() tools.Version   { return *mariaDBServiceVersion }

func (sDB *MariaDBService) InitService() (rErr error) {
	// DSN: username:password@tcp(ip:port)/dbname?param=value
	sDB.DbConn, rErr = sql.Open("mysql", fmt.Sprintf("%s:%s@tcp(%s:%d)/%s", sDB.username, sDB.password, sDB.addressIP, sDB.addressPort, sDB.dbName))
	if rErr != nil {
		sDB.state = srvs.ServiceError
		sDB.admChan <- srvs.NewServiceCom(sDB, srvs.ServiceComError, rErr)

	} else {
		sDB.DbConn.SetMaxIdleConns(100)
		sDB.DbConn.SetMaxOpenConns(1000)
		sDB.DbConn.SetConnMaxLifetime(time.Second * 10)
		sDB.state = srvs.ServiceStarted
		sDB.admChan <- srvs.NewServiceCom(sDB, srvs.ServiceComInitialized, nil)
	}

	return
}

func (sDB *MariaDBService) StopService() (rErr error) {
	log.Println("Sincronitzant la base de dades amb la catxé...")
	var toSync = cache.ToSync()
	for _, pinst := range toSync {
		var inst = *pinst
		_ = inst
		// if inst.IsNew() {
		// 	sDB.Insert(pinst, )
		// } else if inst.IsUpdated() {
		// 	sDB.Update()
		// } else if inst.IsDeleted() {
		// 	sDB.Delete()
		// }
	}

	log.Println("Aturant la connexió a la base de dades...")
	sDB.state = srvs.ServiceStopped
	if rErr = sDB.DbConn.Close(); rErr != nil {
		sDB.state = srvs.ServiceError
		sDB.admChan <- srvs.NewServiceCom(sDB, srvs.ServiceComError, rErr)

	} else {
		sDB.state = srvs.ServiceStopped
		sDB.admChan <- srvs.NewServiceCom(sDB, srvs.ServiceComStopped, nil)
	}

	return
}

// CRUD -------------------------------
func (sDB *MariaDBService) SelectInt(pQuery string, pId uint32) (rRows *sql.Rows, rErr error) {
	rRows, rErr = sDB.DbConn.Query(pQuery, pId)
	return
}

func (sDB *MariaDBService) SelectStr(pQuery string, pIds ...string) (rRows *sql.Rows, rErr error) {
	switch len(pIds) {
	case 0:
		rRows, rErr = sDB.DbConn.Query(pQuery)
	case 1:
		rRows, rErr = sDB.DbConn.Query(pQuery, pIds[0])
	case 2:
		rRows, rErr = sDB.DbConn.Query(pQuery, pIds[0], pIds[1])
	default:
		panic("MariaDBService.SelectStr(): Més arguments dels esperats!")
	}

	return
}

func (sDB *MariaDBService) Insert(pInst *defs.GoSQL, pLang string) bool {
	if pInst == nil {
		return false
	}

	var err error
	var gsql = *pInst
	var gent = gsql.(defs.GoEntity)
	ssql, args := gsql.SqlInsert(pLang)

	var res sql.Result
	if res, err = sDB.DbConn.Exec(ssql, args); err != nil {
		return false
	}
	size, err := res.RowsAffected()
	if err != nil || size != 1 {
		return false
	}

	gent.SetNew(false)
	gent.SetUpdated(false)
	gent.SetDeleted(false)
	cache.Add(gent)

	return true
}

func (sDB *MariaDBService) Update(pInst *defs.GoSQL, pLang string) bool {
	if pInst == nil {
		return false
	}

	var err error
	var gsql = *pInst
	var gent = gsql.(defs.GoEntity)
	ssql, args := gsql.SqlUpdate(pLang)

	var res sql.Result
	if res, err = sDB.DbConn.Exec(ssql, args); err != nil {
		return false
	}
	size, err := res.RowsAffected()
	if err != nil || size != 1 {
		return false
	}

	gent.SetNew(false)
	gent.SetUpdated(false)
	gent.SetDeleted(false)
	cache.update(gent)
	return true
}

func (sDB *MariaDBService) Delete(pInst *GoSQL, pLang string) bool {
	if pInst == nil {
		return false
	}

	var err error
	var gsql = *pInst
	var gent = gsql.(GoEntity)
	ssql, args := gsql.SqlDelete(pLang)

	var res sql.Result
	if res, err = sDB.DbConn.Exec(ssql, args); err != nil {
		return false
	}
	size, err := res.RowsAffected()
	if err != nil || size != 1 {
		return false
	}

	gent.SetNew(false)
	gent.SetUpdated(false)
	gent.SetDeleted(true)
	cache.Remove(gent)

	return true
}
