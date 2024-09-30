package domain

import (
	fmt "fmt"
	tools "sabina/base/domain/tools"
	proto "sabina/proto/global"
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
	Version() (rVersion tools.Version)
}

// DB SQL FROM/TO =============================================================
type GoSQL interface {
	SqlSelect(pLang string, pId any, pId2 ...any) (rSQL string, rArgs []any)
	SqlInsert(pLang string) (rSQL string, rArgs []any)
	SqlUpdate(pLang string) (rSQL string, rArgs []any)
	SqlDelete(pLang string) (rSQL string, rArgs []any)
}

// TIPUS BaseEntity -------------------
type BaseEntity struct {
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
func (cEnt *BaseEntity) SrvId() uint32        { return *cEnt.ServerId }
func (cEnt *BaseEntity) TableName() string    { return "???" }
func (cEnt *BaseEntity) IsNew() bool          { return cEnt.InstIsNew }
func (cEnt *BaseEntity) IsUpdated() bool      { return cEnt.InstIsUpdated }
func (cEnt *BaseEntity) IsDeleted() bool      { return cEnt.InstIsDeleted }
func (cEnt *BaseEntity) SetNew(pNew bool)     { cEnt.InstIsNew = pNew }
func (cEnt *BaseEntity) SetUpdated(pUpt bool) { cEnt.InstIsUpdated = pUpt }
func (cEnt *BaseEntity) SetDeleted(pDel bool) { cEnt.InstIsDeleted = pDel }

// CONSTRUCTORS ---------------------------
func (*BaseEntity) New(pLocalId *uint32, pServerId *uint32, pCreatedBy uint32, pCreatedAt dt.Time, pUpdatedBy *uint32, pUpdatedAt *dt.Time) *BaseEntity {
	return &BaseEntity{
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

func (*BaseEntity) Empty() *BaseEntity {
	var zero uint32 = 0

	return (*BaseEntity).New(
		nil,
		&zero, &zero,
		zero, tools.BigBang,
		&zero, &tools.BigBang,
	)
}

func (*BaseEntity) ByProto(pProto *proto.PrtBaseEntity, pLang any) (rEnt *BaseEntity, rErr error) {
	var lang *string
	var lkey, skey *uint32

	rEnt = (*BaseEntity).Empty(nil)

	if lang = tools.GetStringKey(pLang); lang == nil {
		lang = &tools.DefLang
	}

	if lkey, rErr = tools.Str2Uint(pProto.LocalKey); rErr != nil {
		return
	}

	if skey, rErr = tools.Str2Uint(pProto.ServerKey); rErr != nil {
		return
	}

	rEnt.LocalId = lkey
	rEnt.ServerId = skey
	rEnt.CreatedBy = pProto.CreatedBy
	rEnt.CreatedAt = *tools.TimeStampToDateTime(pProto.CreatedAt)
	rEnt.UpdatedBy = pProto.UpdatedBy
	rEnt.UpdatedAt = tools.TimeStampToDateTime(pProto.UpdatedAt)
	return
}

// REFERENCES -------------------------
func (sEnt *BaseEntity) IdRef() *uint32         { return sEnt.LocalId }
func (sEnt *BaseEntity) CreatedByRef() *uint32  { return &sEnt.CreatedBy }
func (sEnt *BaseEntity) CreatedAtRef() *dt.Time { return &sEnt.CreatedAt }
func (sEnt *BaseEntity) UpdatedByRef() *uint32  { return sEnt.UpdatedBy }
func (sEnt *BaseEntity) UpdatedAtRef() *dt.Time { return sEnt.UpdatedAt }

// CONVERSIONS ------------------------
func (cModel *BaseEntity) ToProto(pLang any) (rProto *proto.PrtBaseEntity, rErr error) {
	cat, err := tools.DateTimeToTimeStamp(&cModel.CreatedAt)
	if err == nil {
		uat, err := tools.DateTimeToTimeStamp(cModel.UpdatedAt)
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
func (cModel *BaseEntity) SqlSelect(pId uint32) (rSQL string, rArgs []any) { return "", []any{} }
func (cModel *BaseEntity) SqlInsert() (rSQL string, rArgs []any)           { return "", []any{} }
func (cModel *BaseEntity) SqlUpdate() (rSQL string, rArgs []any)           { return "", []any{} }
func (cModel *BaseEntity) SqlDelete() (rSQL string, rArgs []any)           { return "", []any{} }

// AUXILIARS --------------------------
var _ = (*BaseEntity).version(nil)

func (*BaseEntity) version() *tools.Version {
	return tools.NewVersion(0, 7, 0)
}
