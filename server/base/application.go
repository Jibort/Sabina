package base

import (
	"log"
	drivers "sabina/drivers"
	proto "sabina/proto"
	"sync"
)

type Application struct {
	Services []LdService
	SrvsChan chan (LdServiceCom)
	Waitg    sync.WaitGroup
}

// Variables globals ------------------
var App *Application

func (sApp *Application) SecurityServ() *SecurityService {
	return sApp.Services[secServ].(*SecurityService)
}

func (sApp *Application) DbServ() *MariaDBService {
	return sApp.Services[dbServ].(*MariaDBService)
}

func (sApp *Application) GrpcServ() *GRPCService {
	return sApp.Services[dbServ].(*GRPCService)
}

// Builders ---------------------------
func NewApp(
	pRPCPort int, pAddressIP string, pAddressPort int,
	pDbName, pUser, pPass string) (rApp *Application, rErr error) {
	var setySrv *SecurityService
	var dbServ *MariaDBService
	var gRPCServ *GRPCService

	rApp = &Application{
		Services: make([]LdService, 0),
		SrvsChan: make(chan (LdServiceCom), 1),
	}

	rApp.listenChan()

	setySrv = NewSecurityService(rApp.SrvsChan)
	rApp.Services = append(rApp.Services, setySrv)

	dbServ = NewMariaDBService(rApp.SrvsChan, pAddressIP, pAddressPort, pDbName, pUser, pPass)
	rApp.Services = append(rApp.Services, dbServ)

	gRPCServ = NewGRPCService(rApp.SrvsChan, pRPCPort, []ServiceDriver{
		*NewServiceDriver(
			drivers.NewUsrServiceDriver(func() { rApp.CloseApp() }),
			&proto.UsrService_ServiceDesc),
		*NewServiceDriver(
			NewSyncServiceDriver(func() { rApp.CloseApp() }),
			&proto.SyncService_ServiceDesc),
	})
	rApp.Services = append(rApp.Services, gRPCServ)

	return
}

func (sApp *Application) InitServices() (rErr error) {
	for _, srv := range sApp.Services {
		sApp.Waitg.Add(1)
		rErr = srv.InitService()
		if rErr != nil {
			log.Printf("error inicialitzant servei '%s'", srv.ServiceName())
			log.Printf("ERROR %s", rErr.Error())
			return
		}
	}

	return
}

func (sApp *Application) Run() {
	sApp.Waitg.Wait()
	// sApp.CloseApplication() -> Es crida des de closeFn.
}

func (sApp *Application) CloseApp() (rErr error) {
	log.Println("Tancant el servidor Sabina....")
	for _, srv := range sApp.Services {
		rErr = srv.StopService()
		if rErr != nil {
			log.Printf("error tancant el servei '%s'", srv.ServiceName())
			return
		}
	}

	return
}

func (sApp *Application) listenChan() {
	go func() {
		var done = false
		for !done {
			msg, ok := <-sApp.SrvsChan
			if !ok {
				break
			}
			var mtype = msg.Message()
			switch mtype {

			case ServiceComError:
				log.Printf("ERROR in '%s':  '%d' - '%s'!", msg.Service().ServiceName(), msg.Message(), msg.Error())

			case ServiceComInstantiated:
				log.Printf("Service '%s': Instanciated", msg.Service().ServiceName())

			case ServiceComInitialized:
				log.Printf("Service '%s': Initialized", msg.Service().ServiceName())

			case ServiceComStopped:
				log.Printf("Service '%s': Stopped", msg.Service().ServiceName())
				sApp.Waitg.Done()

			default:
				log.Printf("ERROR: Tipus de missatge de servei desconegut: '%d'!", mtype)
			}
		}
		close(sApp.SrvsChan)
	}()
}
