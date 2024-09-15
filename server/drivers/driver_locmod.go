package drivers

import (
	proto "sabina/proto"
)

type LocmodServiceDriver struct {
	proto.UnimplementedUsrServiceServer
	closeFn func()
}

func NewLocServiceDriver(pCloseFn func()) *LocmodServiceDriver {
	return &LocmodServiceDriver{
		closeFn: pCloseFn,
	}
}
