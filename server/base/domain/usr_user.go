// Representació d'un usuari de l'aplicació.
// createdAt: 24/09/10 dm. JIQ

package domain

import (
	x509 "crypto/x509"
	"database/sql"
	srvs "sabina/base/domain/services"
	tools "sabina/base/domain/tools"
	proto "sabina/proto"
	"strings"
	dt "time"
)

// Tipus d'usuari.
type UserType int

const (
	User_type_unspecified UserType = 0
	User_type_root        UserType = 1
	User_type_admin       UserType = 2
	User_type_patient     UserType = 3
	User_type_therapist   UserType = 4
)

// Estats d'usuari.
type UserState int

const (
	User_state_unspecified UserState = 0
	User_state_building    UserState = 1
	User_state_active      UserState = 2
	User_state_locked      UserState = 3
)

// Estructura USR_USER ----------------
type UsrUser struct {
	Entity BaseEntity
	GoProto
	GoSQL
	UserType      UserType
	UserState     UserState
	Permissions   uint64
	Alias         string
	Certificate   *x509.Certificate
	BirthDate     *dt.Time
	FirstConnPKey *uint64
	FirstConnAt   *dt.Time
	Locale        string
	TherapistId   *uint32
	Device        *UsrDevice
}

var userTableName = "USER"

// CONSTRUCTORS ---------------------------
func (*UsrUser) New(
	pBase *BaseEntity,
	pUType UserType,
	pState UserState,
	pPerms uint64,
	pAlias string,
	pCert *x509.Certificate,
	pBirthDate *dt.Time,
	pFirstConnPKey *uint64,
	pFirstConnAt *dt.Time,
	pLocale string,
	pTherapistId *uint32,
	pLastDevice *UsrDevice,
) *UsrUser {
	return &UsrUser{
		Entity:        *pBase,
		UserType:      pUType,
		UserState:     pState,
		Permissions:   pPerms,
		Alias:         pAlias,
		Certificate:   pCert,
		BirthDate:     pBirthDate,
		FirstConnPKey: pFirstConnPKey,
		FirstConnAt:   pFirstConnAt,
		Locale:        pLocale,
		TherapistId:   pTherapistId,
		Device:        pLastDevice,
	}
}

func (*UsrUser) Empty() *UsrUser {
	return (*UsrUser).New(
		nil,
		(*BaseEntity).Empty(nil),
		User_type_unspecified,
		User_state_unspecified,
		uint64(0),
		"",
		nil,
		nil,
		nil,
		nil,
		"es",
		nil,
		nil,
	)
}

func (*UsrUser) ByProto(pProto *proto.UsrUser, pLang any) (rUsr *UsrUser, rErr error) {
	rUsr = nil
	var bCert *x509.Certificate

	if bCert, rErr = x509.ParseCertificate(pProto.Certificate); rErr == nil {
		var base *BaseEntity
		if base, rErr = (*BaseEntity).ByProto(nil, pProto.BaseEntity, pLang); rErr != nil {
			return
		}

		var dent *UsrDevice
		if dent, rErr = (*UsrDevice).ByProto(nil, pProto.Device, pLang); rErr == nil {
			rUsr = (*UsrUser).New(
				nil,
				base,
				UserType(pProto.UserType),
				UserState(pProto.State),
				pProto.Permissions,
				pProto.Alias,
				bCert,
				tools.TimeStampToDateTime(pProto.BirthDate),
				pProto.FirstConnPkey,
				tools.TimeStampToDateTime(pProto.FirstConnAt),
				pProto.Locale,
				pProto.TherapistId,
				dent,
			)
		}
	}
	return
}

// INTERFÍCIE GoEntity -----------------
func (cUsr *UsrUser) SrvId() *uint32       { return cUsr.Entity.ServerId }
func (cUsr *UsrUser) TableName() string    { return userTableName }
func (cUsr *UsrUser) IsNew() bool          { return cUsr.Entity.InstIsNew }
func (cUsr *UsrUser) IsUpdated() bool      { return cUsr.Entity.InstIsUpdated }
func (cUsr *UsrUser) IsDeleted() bool      { return cUsr.Entity.InstIsDeleted }
func (cUsr *UsrUser) SetNew(pNew bool)     { cUsr.Entity.InstIsNew = pNew }
func (cUsr *UsrUser) SetUpdated(pUpt bool) { cUsr.Entity.InstIsUpdated = pUpt }
func (cUsr *UsrUser) SetDeleted(pDel bool) { cUsr.Entity.InstIsDeleted = pDel }

// GoSQL INTERFÍCIE --------------------
func (*UsrUser) SqlSelect(pLang any, pId any, pId2 ...any) (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(tools.SeltBE + `, 
		USER_TYPE, USER_STATE, PERMISSIONS, ALIAS,
		CERTIFICATE, BIRTH_DATE,
		FIRST_KEY, FIRST_CONN_AT, LOCALE_CODE,
		THERAPIST_ID, LAST_DEVICE_ID
		FROM USER 
		WHERE ID = ?`,
	)

	rArgs = []any{pId}
	return
}

func (cUsr *UsrUser) SqlInsert(pLang string) (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
		INSERT INTO USER 
		(CREATED_BY, CREATED_AT, USER_TYPE, USER_STATE, 
		PERMISSIONS, ALIAS, CERTIFICATE, BIRTH_DATE, 
		FIRST_KEY, FIRST_CONN_AT, LOCALE_CODE, THERAPIST_ID,
		LAST_DEVICE_ID)
		VALUES (?,?,?,?,   ?,?,?,?,   ?,?,?,?)`,
	)

	if cUsr.Certificate != nil {
		rArgs = []any{
			cUsr.Entity.CreatedBy, cUsr.Entity.CreatedAt,
			cUsr.UserType, cUsr.UserState,
			cUsr.Permissions, cUsr.Alias,
			cUsr.Certificate.Raw, cUsr.BirthDate,
			cUsr.FirstConnPKey, cUsr.FirstConnAt,
			cUsr.Locale, cUsr.TherapistId, cUsr.Device,
		}
	} else {
		rArgs = []any{
			cUsr.Entity.CreatedBy, cUsr.Entity.CreatedAt,
			cUsr.UserType, cUsr.Permissions, cUsr.Alias,
			nil, cUsr.UserState,
			cUsr.BirthDate, cUsr.FirstConnPKey,
			cUsr.FirstConnAt, cUsr.Locale,
			cUsr.TherapistId, cUsr.Device,
		}
	}

	return
}

func (cUsr *UsrUser) SqlUpdate(pLang string) (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
		UPDATE USER 
		SET
			UPDATED_BY = ?, UPDATED_AT = ?,
			USER_TYPE = ?, PERMISSIONS = ?,
			ALIAS = ?, CERTIFICATE = ?,
			STATE = ?, THERAPIST_ID = ?, BIRTH_DATE = ?,
			FIRST_KEY = ?, FIRST_CONN = ?,
			THERAPIST_ID = ?, LOCALE = ?, DEVICE = ?
		WHERE ID = ?`,
	)

	if cUsr.Certificate != nil {
		rArgs = []any{
			cUsr.Entity.UpdatedBy, cUsr.Entity.UpdatedAt,
			cUsr.UserType, cUsr.Permissions, cUsr.Alias,
			cUsr.Certificate.Raw, cUsr.UserState,
			cUsr.TherapistId, cUsr.BirthDate,
			cUsr.FirstConnPKey, cUsr.FirstConnAt,
			cUsr.TherapistId, cUsr.Locale.Id, cUsr.Device,
			cUsr.SrvId(),
		}
	} else {
		rArgs = []any{
			cUsr.Entity.UpdatedBy, cUsr.Entity.UpdatedAt,
			cUsr.UserType, cUsr.Permissions, cUsr.Alias,
			nil, cUsr.UserState,
			cUsr.TherapistId, cUsr.BirthDate,
			cUsr.FirstConnPKey, cUsr.FirstConnAt,
			cUsr.TherapistId, cUsr.Locale.Id,
			cUsr.Device, cUsr.SrvId(),
		}
	}
	return
}

func (cUsr *UsrUser) SqlDelete(pLang string) (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
 		DELETE 
		FROM USER 
		WHERE ID = ?`,
	)
	rArgs = []any{cUsr.SrvId()}
	return
}

// INTERFÍCIE GoProto ------------------
func (cUsr UsrUser) ToProto(pLang any) (rProto *proto.UsrUser, rErr error) {
	var bConn *proto.Timestamp
	var bDev *proto.UsrDevice
	var bDate *proto.Timestamp
	var bModel *proto.PrtBaseEntity

	if bDate, rErr = tools.DateTimeToTimeStamp(cUsr.BirthDate); rErr == nil {
		if bConn, rErr = tools.DateTimeToTimeStamp(cUsr.FirstConnAt); rErr == nil {
			bDev, rErr = cUsr.Device.ToProto(pLang)
		}
	}

	if rErr == nil {
		if bModel, rErr = cUsr.Entity.ToProto(pLang); rErr == nil {
			rProto = &proto.UsrUser{
				BaseEntity:    bModel,
				UserType:      proto.UsrUserType(cUsr.UserType),
				State:         proto.UsrUserState(cUsr.UserState),
				Permissions:   cUsr.Permissions,
				Alias:         cUsr.Alias,
				Certificate:   cUsr.Certificate.Raw,
				BirthDate:     bDate,
				FirstConnPkey: cUsr.FirstConnPKey,
				FirstConnAt:   bConn,
				Device:        bDev,
			}
		}
	}

	return
}

var _ = (*UsrUser).version(nil)

func (*UsrUser) version() *tools.Version {
	return tools.NewVersion(0, 7, 2)
}

// BY_ID ------------------------------
func (*UsrUser) FromSqlRow(pRow *sql.Rows, pId uint32, pMandatory bool, pLang any) (rUser *UsrUser, rErr error) {
	if pRow.Next() {
		var localeId string
		var deviceId *uint32
		rUser = (*UsrUser).Empty(nil)
		if rErr = pRow.Scan(
			rUser.Entity.IdRef,
			rUser.Entity.CreatedBy, rUser.Entity.CreatedAt,
			rUser.Entity.UpdatedBy, rUser.Entity.UpdatedAt,
			&rUser.UserType, &rUser.UserState, &rUser.Permissions, &rUser.Alias,
			&rUser.Certificate, &rUser.BirthDate,
			&rUser.FirstConnPKey, &rUser.FirstConnAt,
			&deviceId, &rUser.TherapistId,
			&localeId,
		); rErr == nil {
			var loc *LocLocale
			if loc, rErr = (*LocLocale).ById(nil, localeId, pMandatory, pLang); rErr == nil {
				rUser.Locale = *loc
				if deviceId != nil {
					var dev *UsrDevice
					if dev, rErr = (*UsrDevice).ById(nil, *deviceId, false, pLang); rErr == nil {
						rUser.Device = dev
					}
				}
			}
		}
	} else {
		if pMandatory {
			rErr = tools.ErrorInstanceForIdNotFound("UsrDevice.FromSqlRow()", pId, rErr)
		}
	}
	return
}

func (*UsrUser) ById(pId uint32, pMandatory bool, pLang any) (rUser *UsrUser, rErr error) {
	var db *srvs.MariaDBService = App.DbServ()
	var sql = tools.SeltBE +
		", USER_TYPE, USER_STATE, PERMISSIONS, ALIAS, CERTIFICATE, THERAPIST_ID, BIRTH_DATE, " +
		"FIRST_KEY, FIRST_CONN FROM USER WHERE ID = ?"

	rows, rErr := db.DbConn.Query(sql, pId)
	if rErr == nil && rows.Next() {
		rUser, rErr = (*UsrUser).FromSqlRow(nil, rows, pId, pMandatory, pLang)
	}
	return
}

func (*UsrUser) BySureId(pId uint32, pLang any) (rUser UsrUser) {
	var usr *UsrUser
	usr, _ = (*UsrUser).ById(nil, pId, true, pLang)
	rUser = *usr

	return
}
