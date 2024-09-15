package base

import (
	"database/sql"
	proto "sabina/proto"
	"strings"
)

// ESTRUCTURES TYPE I STATE -----------
type DeviceType int

const (
	device_type_unspecified   DeviceType = 0
	device_type_mobileAndroid DeviceType = 1
	device_type_mobileIOS     DeviceType = 2
	device_type_tabledAndroid DeviceType = 3
	device_type_tabletIOS     DeviceType = 4
	device_type_windows       DeviceType = 5
	device_type_macos         DeviceType = 6
	device_type_linux         DeviceType = 7
)

type DeviceState int

const (
	device_state_unspecified DeviceState = 0
	device_state_enabled     DeviceState = 1
	device_state_disabled    DeviceState = 2
)

// Estructura USR_DEVICE --------------
type UsrDevice struct {
	Entity GoBaseEntity
	GoProto
	GoSQL
	DType    DeviceType
	State    DeviceState
	FcmToken *string
	Owner    uint32
}

const deviceTableName = "DEVICE"

// CONSTRUCTORS ---------------------------
func (*UsrDevice) New(
	pBase *GoBaseEntity,
	pDType DeviceType,
	pState DeviceState,
	pFcm *string,
	pOwner uint32,
) *UsrDevice {
	return &UsrDevice{
		Entity:   *pBase,
		DType:    pDType,
		State:    pState,
		FcmToken: pFcm,
		Owner:    pOwner,
	}
}

func (*UsrDevice) Empty() *UsrDevice {
	return (*UsrDevice).New(
		nil,
		(*GoBaseEntity).Empty(nil),
		device_type_unspecified,
		device_state_unspecified,
		nil,
		0,
	)
}

func (*UsrDevice) ByProto(pDev *proto.UsrDevice, pLang any) (rDev *UsrDevice, rErr error) {
	var bent *GoBaseEntity

	if bent, rErr = (*GoBaseEntity).ByProto(nil, pDev.BaseEntity, pLang); rErr != nil {
		rDev = nil
		return
	}

	rDev = (*UsrDevice).New(
		nil,
		bent,
		DeviceType(pDev.Type),
		DeviceState(pDev.State),
		pDev.Token,
		pDev.Owner,
	)
	return
}

// INTERFÍCIE GoEntity -----------------
func (cDev *UsrDevice) SrvId() *uint32       { return cDev.Entity.ServerId }
func (cDev *UsrDevice) TableName() string    { return deviceTableName }
func (cDev *UsrDevice) IsNew() bool          { return cDev.Entity.InstIsNew }
func (cDev *UsrDevice) IsUpdated() bool      { return cDev.Entity.InstIsUpdated }
func (cDev *UsrDevice) IsDeleted() bool      { return cDev.Entity.InstIsDeleted }
func (cDev *UsrDevice) SetNew(pNew bool)     { cDev.Entity.InstIsNew = pNew }
func (cDev *UsrDevice) SetUpdated(pUpt bool) { cDev.Entity.InstIsUpdated = pUpt }
func (cDev *UsrDevice) SetDeleted(pDel bool) { cDev.Entity.InstIsDeleted = pDel }

// INTERFÍCIE GoProto ------------------
func (cDev *UsrDevice) ToProto(pLang any) (rProto *proto.UsrDevice, rErr error) {
	bEnt, err := cDev.Entity.ToProto(pLang)
	if err == nil {
		pEnt := proto.UsrDevice{
			BaseEntity: bEnt,
			Type:       proto.UsrDeviceType(cDev.DType),
			State:      proto.UsrDeviceState(cDev.State),
			Token:      cDev.FcmToken,
			Owner:      cDev.Owner,
		}
		rProto = &pEnt
	}

	rErr = err
	return
}

var _ = (*UsrDevice).version(nil)

func (*UsrDevice) version() *Version {
	return NewVersion(0, 7, 0)
}

// INTERFÍCIE GoSQL -------------------
func (*UsrDevice) SqlSelect(pLang string, pId any, pId2 ...any) (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(SeltBE + `,
		DEVICE_TYPE, DEVICE_STATE, FCM_TOKEN, OWNER_ID
		FROM DEVICE
		WHERE ID = ?`,
	)

	rArgs = []any{pId}
	return
}

func (cDev *UsrDevice) SqlInsert(pLang string) (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
		INSERT INTO DEVICE (
		CREATED_BY, CREATED_AT, 
		DEVICE_TYPE, DEVICE_STATE,
		FCM_TOKEN, OWNER_ID)
		VALUES (?, ?, ?, ?, ?, ?)`,
	)

	rArgs = []any{
		cDev.Entity.CreatedBy, cDev.Entity.CreatedAt,
		cDev.DType, cDev.State,
		cDev.FcmToken, cDev.Owner,
	}

	return
}

func (cDev *UsrDevice) SqlUpdate(pLang string) (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
		UPDATE DEVICE 
		SET 
			UPDATED_BY = ?, UPDATED_AT = ?,
			DEVICE_TYPE = ?, DEVICE_STATE = ?, 
			FCM_TOKEN = ?, OWNER_ID = ? 
		WHERE ID = ?`,
	)

	rArgs = []any{
		cDev.Entity.UpdatedBy, cDev.Entity.UpdatedAt,
		cDev.DType, cDev.State,
		cDev.FcmToken, cDev.Owner,
		cDev.SrvId(),
	}

	return
}

func (cDev *UsrDevice) SqlDelete(pLang string) (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
 		DELETE 
		FROM USER 
		WHERE ID = ?`,
	)
	rArgs = []any{cDev.SrvId()}
	return
}

// BY_ID ------------------------------
func (*UsrDevice) FromSqlRow(pRows *sql.Rows, pId uint32, pMandatory bool) (rDev *UsrDevice, rErr error) {
	if pRows.Next() {
		rDev = (*UsrDevice).Empty(nil)
		rErr = pRows.Scan(
			rDev.Entity.IdRef,
			rDev.Entity.CreatedBy, rDev.Entity.CreatedAt,
			rDev.Entity.UpdatedBy, rDev.Entity.UpdatedAt,
			&rDev.DType, &rDev.State, &rDev.FcmToken, &rDev.Owner,
		)
	} else {
		if pMandatory {
			rErr = ErrorInstanceForIdNotFound("UsrDevice.FromSqlRow()", pId, rErr)
		}
	}
	return
}

func (*UsrDevice) ById(pId uint32, pMandatory bool, pLang any) (rDevice *UsrDevice, rErr error) {
	var db MariaDBService = *App.DbServ()
	var sql = SeltBE +
		", DEVICE_TYPE, DEVICE_STATE, FCM_TOKEN, OWNER_ID FROM DEVICE WHERE ID = ?"

	rows, rErr := db.DbConn.Query(sql, pId)
	if rErr == nil && rows.Next() {
		rDevice, rErr = (*UsrDevice).FromSqlRow(nil, rows, pId, pMandatory)
	}
	rows.Close()
	return
}

func (*UsrDevice) BySureId(pId uint32, pLang any) (rDev UsrDevice) {
	var dev, _ = (*UsrDevice).ById(nil, pId, true, pLang)
	return *dev
}
