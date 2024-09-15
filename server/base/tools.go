package base

import (
	"fmt"
	proto "sabina/proto"
	"strconv"
	dt "time"
)

const EntityNullId int32 = 0

const ConnPK uint64 = 0

var bigBang dt.Time = dt.Time{}
var defLang string = "es"

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
		rStr = "'" + TimeStampToDateTime(pDTime).Format(FmtDateTimeHMS) + "'"
	}
	return
}

const SeltBE = "SELECT ID, CREATED_BY, CREATED_AT, UPDATED_BY, UPDATED_AT"

func StringToDateTime(pStr *string) (rDTime *dt.Time, rErr error) {
	if pStr != nil {
		var tm, rErr = dt.Parse(FmtDateTimeHMS, *pStr)
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

func AnyToString(pAny any) (rStr *string) {
	rStr = nil
	if pAny != nil {
		switch inst := pAny.(type) {
		case LocLocale:
			rStr = &inst.Id
		case LocTextKey:
			rStr = &inst.TextKey
		case string:
			rStr = &inst
		default:
			panic("tools.AnyToString: Tipus no reconegut de paràmetre!")
		}
	}
	return
}

func AsSQL(pVal any) (rSql string) {
	rSql = "NULL"
	if pVal != nil {
		switch val := pVal.(type) {
		case bool:
			if val {
				rSql = "1"
			} else {
				rSql = "0"
			}
		case *uint32, *int, *uint, *uint64, *int32, *int64:
			rSql = fmt.Sprintf("%d", val)
		case uint32, int, uint, uint64, int32, int64:
			rSql = fmt.Sprintf("%d", val)
		case *string:
			rSql = "'" + *val + "'"
			// rSql = "QUOTE('" + *val + "')"
		case string:
			rSql = "'" + val + "'"
			// rSql = "QUOTE('" + val + "')"
		case dt.Time:
			rSql = "'" + val.Format(FmtTimeStampFull) + "'"
		case proto.Timestamp:
			rSql = "'" + TimeStampToString(&val) + "'"
		case LocLocale:
			rSql = fmt.Sprintf("QUOTE(\"%s\")", val.Id)
		case LocTextKey:
			rSql = "QUOTE(\"" + val.TextKey + "\")"
		case LocTranslation:
			rSql = "QUOTE(\"" + val.TextKey.TextKey + "\")"
		case GoEntity:
			rSql = fmt.Sprintf("%d", val.SrvId())
		default:
			panic(fmt.Errorf("AsSQL amb un tipus rar '%v'", val))
		}
	}
	return
}

func AsNqSQL(pVal any) (rSql string) {
	rSql = "NULL"
	if pVal != nil {
		switch val := pVal.(type) {
		case bool:
			if val {
				rSql = "1"
			} else {
				rSql = "0"
			}
		case *uint32, *int, *uint, *uint64, *int32, *int64:
			rSql = fmt.Sprintf("%d", val)
		case uint32, int, uint, uint64, int32, int64:
			rSql = fmt.Sprintf("%d", val)
		case *string:
			rSql = "\"" + *val + "\""
		case string:
			rSql = "\"" + val + "\""
		case dt.Time:
			rSql = "'" + val.Format(FmtTimeStampFull) + "'"
		case proto.Timestamp:
			rSql = "'" + TimeStampToString(&val) + "'"
		case LocLocale:
			rSql = fmt.Sprintf("QUOTE(\"%s\")", val.Id)
		case LocTextKey:
			rSql = "QUOTE(\"" + val.TextKey + "\")"
		case LocTranslation:
			rSql = "QUOTE(\"" + val.TextKey.TextKey + "\")"
		case GoEntity:
			rSql = fmt.Sprintf("%d", val.SrvId())
		default:
			panic(fmt.Errorf("AsSQL amb un tipus rar '%v'", val))
		}
	}
	return
}

func SqlDelete(pTable string, pId uint32) string {
	return fmt.Sprintf("DELETE FROM %s WHERE Id = %s", pTable, AsSQL(pId))
}

func GetStringKey(pKey any) (rKey *string) {
	switch v := pKey.(type) {
	case nil:
		rKey = nil
	case LocTranslation:
		rKey = &v.Locale.Id
	case LocTextKey:
		rKey = &v.TextKey
	case string:
		rKey = &v
	default:
		rKey = nil
	}
	return rKey
}

func GetDoubleKey(pLoc any, pTKey any) (rLoc *string, rTKey *string) {
	rLoc = GetStringKey(pLoc)
	rTKey = GetStringKey(pTKey)
	return
}

func str2Uint(pStr *string) (rNum *uint32, rErr error) {
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
