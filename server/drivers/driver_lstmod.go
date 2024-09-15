package drivers

import (
	proto "sabina/proto"
)

type LstmodServiceDriver struct {
	proto.UnimplementedUsrServiceServer
	closeFn func()
}

func NewLstServiceDriver(pCloseFn func()) *LstmodServiceDriver {
	return &LstmodServiceDriver{
		closeFn: pCloseFn,
	}
}
