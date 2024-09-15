package base

import (
	"fmt"
	proto "sabina/proto"
	dt "time"
)

// GOLANG ENTITY ==============================================================
type GoEntity interface {
	SrvId() *uint32
	TableName() string
	IsNew() bool
	IsUpdated() bool
	IsDeleted() bool
	SetNew(pNew bool)
	SetUpdated(pUpt bool)
	SetDeleted(pDel bool)
}

// PROTO TO/FROM MODEL ========================================================
type GoProto interface {
	ByProto(pProto any, pLang any) *GoProto
	ToProto(pLang *string)
	Version() (rVersion Version)
}

// DB SQL FROM/TO =============================================================
type GoSQL interface {
	SqlSelect(pLang string, pId any, pId2 ...any) (rSQL string, rArgs []any)
	SqlInsert(pLang string) (rSQL string, rArgs []any)
	SqlUpdate(pLang string) (rSQL string, rArgs []any)
	SqlDelete(pLang string) (rSQL string, rArgs []any)
}

// ESTRUCTURA EMOMOD ------------------
type GoBaseEntity struct {
	GoEntity
	LocalId       *uint32
	ServerId      *uint32
	CreatedBy     uint32
	CreatedAt     dt.Time
	UpdatedBy     *uint32
	UpdatedAt     *dt.Time
	InstIsNew     bool
	InstIsUpdated bool
	InstIsDeleted bool
}

// GOLANG ENTITY ----------------------
func (cEnt *GoBaseEntity) SrvId() uint32        { return *cEnt.ServerId }
func (cEnt *GoBaseEntity) TableName() string    { return "???" }
func (cEnt *GoBaseEntity) IsNew() bool          { return cEnt.InstIsNew }
func (cEnt *GoBaseEntity) IsUpdated() bool      { return cEnt.InstIsUpdated }
func (cEnt *GoBaseEntity) IsDeleted() bool      { return cEnt.InstIsDeleted }
func (cEnt *GoBaseEntity) SetNew(pNew bool)     { cEnt.InstIsNew = pNew }
func (cEnt *GoBaseEntity) SetUpdated(pUpt bool) { cEnt.InstIsUpdated = pUpt }
func (cEnt *GoBaseEntity) SetDeleted(pDel bool) { cEnt.InstIsDeleted = pDel }

// CONSTRUCTORS ---------------------------
func (*GoBaseEntity) New(pLocalId *uint32, pServerId *uint32, pCreatedBy uint32, pCreatedAt dt.Time, pUpdatedBy *uint32, pUpdatedAt *dt.Time) *GoBaseEntity {
	return &GoBaseEntity{
		LocalId:       pLocalId,
		ServerId:      pServerId,
		CreatedBy:     pCreatedBy,
		CreatedAt:     pCreatedAt,
		UpdatedBy:     pUpdatedBy,
		UpdatedAt:     pUpdatedAt,
		InstIsNew:     true,
		InstIsUpdated: false,
		InstIsDeleted: false,
	}
}

func (*GoBaseEntity) Empty() *GoBaseEntity {
	var zero uint32 = 0

	return (*GoBaseEntity).New(
		nil,
		&zero, &zero,
		zero, bigBang,
		&zero, &bigBang,
	)
}

func (*GoBaseEntity) ByProto(pProto *proto.PrtBaseEntity, pLang any) (rEnt *GoBaseEntity, rErr error) {
	var lang *string
	var lkey, skey *uint32

	rEnt = (*GoBaseEntity).Empty(nil)

	if lang = GetStringKey(pLang); lang == nil {
		lang = &defLang
	}

	if lkey, rErr = str2Uint(pProto.LocalKey); rErr != nil {
		return
	}

	if skey, rErr = str2Uint(pProto.ServerKey); rErr != nil {
		return
	}

	rEnt.LocalId = lkey
	rEnt.ServerId = skey
	rEnt.CreatedBy = pProto.CreatedBy
	rEnt.CreatedAt = *TimeStampToDateTime(pProto.CreatedAt)
	rEnt.UpdatedBy = pProto.UpdatedBy
	rEnt.UpdatedAt = TimeStampToDateTime(pProto.UpdatedAt)
	return
}

// REFERENCES -------------------------
func (sEnt *GoBaseEntity) IdRef() *uint32         { return sEnt.LocalId }
func (sEnt *GoBaseEntity) CreatedByRef() *uint32  { return &sEnt.CreatedBy }
func (sEnt *GoBaseEntity) CreatedAtRef() *dt.Time { return &sEnt.CreatedAt }
func (sEnt *GoBaseEntity) UpdatedByRef() *uint32  { return sEnt.UpdatedBy }
func (sEnt *GoBaseEntity) UpdatedAtRef() *dt.Time { return sEnt.UpdatedAt }

// CONVERSIONS ------------------------
func (cModel *GoBaseEntity) ToProto(pLang any) (rProto *proto.PrtBaseEntity, rErr error) {
	cat, err := DateTimeToTimeStamp(&cModel.CreatedAt)
	if err == nil {
		uat, err := DateTimeToTimeStamp(cModel.UpdatedAt)
		if err == nil {
			var localKey = fmt.Sprintf("%d", *cModel.LocalId)
			var srvKey = fmt.Sprintf("%d", *cModel.ServerId)
			pEnt := proto.PrtBaseEntity{
				LocalKey:  &localKey,
				ServerKey: &srvKey,
				CreatedBy: cModel.CreatedBy,
				CreatedAt: cat,
				UpdatedBy: cModel.UpdatedBy,
				UpdatedAt: uat,
			}
			rProto = &pEnt
		}
	}
	rErr = err
	return
}

// GoSQL INTERFÍCIE --------------------
func (cModel *GoBaseEntity) SqlSelect(pId uint32) (rSQL string, rArgs []any) { return "", []any{} }
func (cModel *GoBaseEntity) SqlInsert() (rSQL string, rArgs []any)           { return "", []any{} }
func (cModel *GoBaseEntity) SqlUpdate() (rSQL string, rArgs []any)           { return "", []any{} }
func (cModel *GoBaseEntity) SqlDelete() (rSQL string, rArgs []any)           { return "", []any{} }

// AUXILIARS --------------------------
var _ = (*GoBaseEntity).version(nil)

func (*GoBaseEntity) version() *Version {
	return NewVersion(0, 7, 0)
}
