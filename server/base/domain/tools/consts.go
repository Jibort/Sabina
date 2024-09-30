package tools

import (
	"fmt"
	tools "sabina/base/domain/tools"
	proto "sabina/proto"
	"strconv"
	dt "time"
)

const EntityNullId int32 = 0

const ConnPK uint64 = 0

var PtTrue bool = true
var PtFalse bool = false

var BigBang dt.Time = dt.Time{}
var DefLang string = "es"

func TimeStampToDateTime(pTStamp *proto.Timestamp) (rTime *dt.Time) {
	rTime = nil
	if pTStamp != nil && pTStamp.Seconds != 0 {
		var aux = dt.UnixMilli(int64(pTStamp.Seconds*1_000) + int64(pTStamp.Nanos/1_000_000))
		rTime = &aux
	}
	return
}

func DateTimeToTimeStamp(pDTime *dt.Time) (rTStamp *proto.Timestamp, rErr error) {
	if pDTime == nil {
		rTStamp = nil
	} else {
		rTStamp = &proto.Timestamp{Seconds: int64(pDTime.Unix()), Nanos: int32(pDTime.Nanosecond())}
	}

	// fmt.Printf("datetime: '%s'\n", TimeStampToDateTime(rTStamp))
	return
}

func TimeStampToString(pDTime *proto.Timestamp) (rStr string) {
	rStr = "NULL"
	if pDTime != nil {
		rStr = "'" + TimeStampToDateTime(pDTime).Format(tools.FmtDateTimeHMS) + "'"
	}
	return
}

const SeltBE = "SELECT ID, CREATED_BY, CREATED_AT, UPDATED_BY, UPDATED_AT"

func StringToDateTime(pStr *string) (rDTime *dt.Time, rErr error) {
	if pStr != nil {
		var tm, rErr = dt.Parse(tools.FmtDateTimeHMS, *pStr)
		if rErr == nil {
			rDTime = &tm
		}
	}
	return
}

func DateAsSQL(pDate *dt.Time) string {
	if pDate == nil {
		return "NULL"
	}
	return "'" + pDate.Format(FmtTimeStampFull) + "'"
}

func StrAsSQL(pVal *string) (rSql string) {
	rSql = "NULL"
	if pVal != nil {
		rSql = fmt.Sprintf("'%s'", *pVal)
	}
	return
}

func UInt32AsSQL(pVal *uint32) (rSql string) {
	rSql = "NULL"
	if pVal != nil {
		rSql = fmt.Sprintf("%d", *pVal)
	}
	return
}

func Str2Uint(pStr *string) (rNum *uint32, rErr error) {
	var num64 uint64
	var res32 uint32

	num64, rErr = strconv.ParseUint(*pStr, 10, 32)
	if rErr == nil {
		res32 = uint32(num64)
		rNum = &res32
	} else {
		rNum = nil
	}
	return

}
