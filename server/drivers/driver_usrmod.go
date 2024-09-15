package drivers

import (
	proto "sabina/proto"
)

type UsrmodServiceDriver struct {
	proto.UnimplementedUsrServiceServer
	closeFn func()
}

func NewUsrServiceDriver(pCloseFn func()) *UsrmodServiceDriver {
	return &UsrmodServiceDriver{
		closeFn: pCloseFn,
	}
}

// func (sUsrD UsrmodServiceDriver) FnExecuteCommand(pCtx context.Context, pReq *proto.GbReqtCommandExecution) (rRes *proto.MwRespAcknoledge, rErr error) {
// 	// var cmd = strings.ToUpper(pReq.GetCmd().Command)
// 	// err := proto.GbError{}
// 	// err.Reset()
// 	// err.Code = proto.GB_ERROR_CODE_UNKNOWN
// 	// tmp := proto.MwRespAcknoledge{
// 	// 	Error: &err,
// 	// }
// 	// rRes = &tmp
// 	// rRes.Reset()
// 	// rRes.Error = &err
// 	// switch cmd {
// 	// case "STOP_SERVER":
// 	// 	rRes.Error.Code = proto.GB_ERROR_CODE_SUCCESS
// 	// 	defer sAsd.closeFn()
// 	// default:
// 	// 	rRes.Error.Code = proto.GbEnumErrorCode_UNKNOWN
// 	// 	rErr = fmt.Errorf("no es reconeix la comanda '%s'", cmd)
// 	// 	err := rErr.Error()
// 	// 	rRes.Error.Message = &err
// 	// }
// 	return
// }
