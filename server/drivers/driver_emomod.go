package drivers

import (
	proto "sabina/proto"
)

type EmomodServiceDriver struct {
	proto.UnimplementedUsrServiceServer
	closeFn func()
}

func NewLocmodServiceDriver(pCloseFn func()) *EmomodServiceDriver {
	return &EmomodServiceDriver{
		closeFn: pCloseFn,
	}
}
