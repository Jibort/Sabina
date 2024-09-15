package base

import (
	"fmt"
	"strconv"
	"strings"
)

type DbCache struct {
	bin map[string]GoEntity
}

var cache DbCache = *(*DbCache).Create(nil)

// CONSTRUCTORS ---------------------------
func (*DbCache) Create() *DbCache {
	return &DbCache{
		bin: make(map[string]GoEntity),
	}
}

// TO_SYNC ----------------------------
func (*DbCache) ToSync() []*GoEntity {
	var lst = make([]*GoEntity, 0)

	for _, pinst := range cache.bin {
		if pinst.IsUpdated() || pinst.IsDeleted() {
			lst = append(lst, &pinst)
		}
	}

	return lst
}

// KEYs -------------------------------
func (*DbCache) BuildIntKey(pTable string, pId any) string {
	var id uint32
	switch i := pId.(type) {
	case int:
		id = uint32(pId.(int))
	case uint:
		id = uint32(pId.(uint))
	case int32:
		id = uint32(pId.(int32))
	case uint32:
		id = pId.(uint32)
	case int64:
		id = uint32(pId.(int64))
	case uint64:
		id = uint32(pId.(uint64))
	case string:
		tmp, err := strconv.ParseUint(i, 10, 32)
		if err != nil {
			tmp = 0
		}
		id = uint32(tmp)
	case *string:
		tmp, err := strconv.ParseUint(*i, 10, 32)
		if err != nil {
			tmp = 0
		}
		id = uint32(tmp)
	default:
		id = 0
	}
	return fmt.Sprintf("%s:%d:", pTable, id)
}

func (*DbCache) Build1StrKey(pTable string, pId string) string {
	var id string
	id = strings.TrimSpace(pId)
	if len(id) == 0 {
		id = "0"
	}
	return fmt.Sprintf("%s:%s:", pTable, id)
}

func (*DbCache) Build2StrKey(pTable string, pId, pId2 string) string {
	var id, id2 string
	id = strings.TrimSpace(pId)
	id2 = strings.TrimSpace(pId2)
	if len(id) == 0 {
		id = "0"
	}
	if len(id2) == 0 {
		id2 = "0"
	}

	return fmt.Sprintf("%s:%s|%s:", pTable, id, id2)
}

func (*DbCache) BuildStringKey(pTable string, pId, pId2 any) string {
	var key string

	switch pTable {
	case (*LocLocale).TableName(nil):
		key = (*DbCache).BuildIntKey(nil, pTable, pId)
	case (*LocTextKey).TableName(nil):
		key = (*DbCache).BuildIntKey(nil, pTable, pId)
	case (*LocTranslation).TableName(nil):
		key = (*DbCache).Build2StrKey(nil, pTable, pId.(string), pId2.(string))
	default:
		key = (*DbCache).BuildIntKey(nil, pTable, pId)
	}

	return key
}

func (*DbCache) BuildKey(pEnt *GoEntity) string {
	var ent = *pEnt
	var table = ent.TableName()
	var key string

	switch table {
	case (*LocLocale).TableName(nil):
		var id = ent.(*LocLocale).Id
		key = (*DbCache).Build1StrKey(nil, table, id)
	case (*LocTextKey).TableName(nil):
		var id = ent.(*LocTextKey).TextKey
		key = (*DbCache).Build1StrKey(nil, table, id)
	case (*LocTranslation).TableName(nil):
		id := ent.(*LocTranslation).TextKey.TextKey
		id2 := ent.(*LocTranslation).Locale.Id
		key = (*DbCache).Build2StrKey(nil, table, id, id2)
	default:
		key = (*DbCache).BuildIntKey(nil, table, ent.SrvId())
	}
	return key
}

// CRUD -------------------------------
func (*DbCache) Get(pTable string, pId any, pId2 any) (rInst GoEntity) {
	var exs bool
	key := (*DbCache).BuildStringKey(nil, pTable, pId, pId2)
	rInst, exs = cache.bin[key]

	if exs {
		return rInst
	} else {
		return nil
	}
}

func (*DbCache) Exists(pTable string, pId any, pId2 any) (rExists bool) {
	key := (*DbCache).BuildStringKey(nil, pTable, pId, pId2)
	_, exs := cache.bin[key]

	return exs
}

func (*DbCache) ExistsInstance(pEnt GoEntity) (rKey *string) {
	pkey := (*DbCache).BuildKey(nil, &pEnt)
	if _, exs := cache.bin[pkey]; exs {
		rKey = &pkey
	} else {
		rKey = nil
	}
	return
}

func (cChe *DbCache) Add(pEnt GoEntity) bool {
	var key *string
	if key = (*DbCache).ExistsInstance(nil, pEnt); key != nil {
		return false
	}

	cChe.bin[cChe.BuildKey(&pEnt)] = pEnt
	return true
}

func (*DbCache) Remove(pEnt GoEntity) bool {
	var res bool

	if (*DbCache).ExistsInstance(nil, pEnt) == nil {
		return false
	}

	res = cache.Remove(pEnt)
	return res
}

func (*DbCache) update(pEnt GoEntity) bool {
	var res bool = true
	if (*DbCache).ExistsInstance(nil, pEnt) != nil {
		res = false
		(*DbCache).Remove(nil, pEnt)
	}
	(*DbCache).Add(nil, pEnt)
	return res
}
