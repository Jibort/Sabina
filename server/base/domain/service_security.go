package domain

import (
	"crypto/tls"
	"crypto/x509"
	tools "sabina/base/domain/tools"
)

var securityServiceVersion = tools.NewVersion(0, 1, 0)

type SecurityService struct {
	LdService
	admChan      chan (LdServiceCom) // Canal de comunicació d'events del servei.
	state        ServiceState        // Estat en que es troba el servei.
	rootCertPool *x509.CertPool      // Conjunt de certificats root de confiança.
	clientCerts  []tls.Certificate   // Certificats de clients.
}

// Builders ===========================
func NewSecurityService(pChan chan (LdServiceCom)) *SecurityService {
	service := &SecurityService{
		state:        ServiceUnknown,
		admChan:      pChan,
		rootCertPool: x509.NewCertPool(),
		clientCerts:  make([]tls.Certificate, 0, 1),
	}

	service.admChan <- NewServiceCom(service, ServiceComInstantiated, nil)
	return service
}

// Getters ============================

// Interfície 'LdService' =============
func (sSec SecurityService) ServiceName() string        { return "Servei Security" }
func (sSec SecurityService) ServiceState() ServiceState { return sSec.state }
func (sSec SecurityService) ServiceVersion() Version    { return *securityServiceVersion }

func (sSec *SecurityService) InitService() error {
	sSec.state = ServiceStarted
	sSec.admChan <- NewServiceCom(sSec, ServiceComInitialized, nil)
	return nil
}

func (sSec *SecurityService) StopService() error {
	sSec.state = ServiceStopped
	sSec.admChan <- NewServiceCom(sSec, ServiceComStopped, nil)
	return nil
}
