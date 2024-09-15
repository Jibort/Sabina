package base

import (
	"fmt"
	"log"
	"net"

	"google.golang.org/grpc"
)

var gRPCVersion = NewVersion(0, 1, 0)

type GRPCService struct {
	LdService
	state   ServiceState        // Estat en que es troba la instància del servei.
	admChan chan (LdServiceCom) // Canal de comunicació d'events del servei.
	port    int                 // Port on dóna servei la instància.
	listen  net.Listener        // Listener del servei.
	server  grpc.Server         // Servidor grpc del servei.
	drivers []ServiceDriver     // Drivers soportats pel servidor gRPC.
}

// Builders ===========================
func NewGRPCService(pChan chan (LdServiceCom), pRPCPort int, pDrivers []ServiceDriver) *GRPCService {
	service := &GRPCService{
		state:   ServiceUnknown,
		admChan: pChan,
		port:    pRPCPort,
		drivers: pDrivers,
	}

	pChan <- NewServiceCom(service, ServiceComInstantiated, nil)
	return service
}

// Interfície 'LdService' ==============
func (sGRPC *GRPCService) ServiceName() string        { return "Servei gRPC" }
func (sGRPC *GRPCService) ServiceState() ServiceState { return sGRPC.state }
func (sGRPC *GRPCService) ServiceVersion() Version    { return *gRPCVersion }

func (sGRPC *GRPCService) InitService() (rErr error) {
	sGRPC.listen, rErr = net.Listen("tcp", fmt.Sprintf(":%d", sGRPC.port))
	if rErr != nil {
		log.Fatalf("error obrint el port gPRC %d (%s)\n", sGRPC.port, rErr.Error())
		return
	}

	sGRPC.server = *grpc.NewServer()
	for _, sdr := range sGRPC.drivers {
		sGRPC.server.RegisterService(sdr.Desc(), sdr.Driver())
	}

	go func() {
		sGRPC.state = ServiceStarted
		sGRPC.admChan <- NewServiceCom(sGRPC, ServiceComInitialized, nil)
		log.Printf("Escoltant connexions gRPC al port del servidor (%s)...\n", sGRPC.listen.Addr().String())
		if err := sGRPC.server.Serve(sGRPC.listen); err != nil {
			sGRPC.state = ServiceError
			sGRPC.admChan <- NewServiceCom(sGRPC, ServiceComError, err)
		}
	}()
	return
}

func (sGRPC *GRPCService) StopService() error {
	log.Println("Aturant servei de gRPC...")
	sGRPC.server.Stop()
	sGRPC.state = ServiceStopped
	sGRPC.admChan <- NewServiceCom(sGRPC, ServiceComStopped, nil)
	return nil
}
