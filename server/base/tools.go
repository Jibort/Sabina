package base

import (
	"fmt"
	dom "sabina/base/domain"
	tools "sabina/base/domain/tools"
	proto "sabina/proto"
	dt "time"
)

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
			rSql = "'" + val.Format(tools.FmtTimeStampFull) + "'"
		case proto.Timestamp:
			rSql = "'" + tools.TimeStampToString(&val) + "'"
		case dom.LocLocale:
			rSql = fmt.Sprintf("QUOTE(\"%s\")", val.Id)
		case LocTextKey:
			rSql = "QUOTE(\"" + val.TextKey + "\")"
		case LocTranslation:
			rSql = "QUOTE(\"" + val.TextKey.TextKey + "\")"
		case tools.GoEntity:
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
