package domain

import (
	tools "sabina/base/domain/tools"

	"google.golang.org/grpc"
)

// SERVICE_DRIVER =====================
type ServiceDriver struct {
	driver interface{}
	desc   *grpc.ServiceDesc
}

// Builders ---------------------------
func NewServiceDriver(pDriver interface{}, pDesc *grpc.ServiceDesc) *ServiceDriver {
	return &ServiceDriver{
		driver: pDriver,
		desc:   pDesc,
	}
}

// Getters ----------------------------
func (sDrv ServiceDriver) Driver() interface{}     { return sDrv.driver }
func (sDrv ServiceDriver) Desc() *grpc.ServiceDesc { return sDrv.desc }

// ESTATS DELS SERVEIS ================
type ServiceState int

const (
	ServiceUnknown ServiceState = iota
	ServiceStarted
	ServicePaused
	ServiceStopped
	ServiceError
)

// INTERFÍCIE LD_SERVICE ==============
type LdService interface {
	ServiceName() string
	ServiceState() ServiceState
	ServiceVersion() tools.Version
	InitService() error
	StopService() error
}

// COMUNICACIÓ DES DELS SERVEIS =======
type LdServiceComMessage int

const (
	ServiceComError LdServiceComMessage = iota
	ServiceComInstantiated
	ServiceComInitialized
	ServiceComStopped
)

type LdServiceCom struct {
	service LdService
	message LdServiceComMessage
	err     error
}

// Builders 'LdServiceCom' ------------
func NewServiceCom(pService LdService, pMsg LdServiceComMessage, pErr error) LdServiceCom {
	return LdServiceCom{
		service: pService,
		message: pMsg,
		err:     pErr,
	}
}

// Getters ----------------------------
func (sCom LdServiceCom) Service() LdService           { return sCom.service }
func (sCom LdServiceCom) Message() LdServiceComMessage { return sCom.message }
func (sCom LdServiceCom) Error() error                 { return sCom.err }
