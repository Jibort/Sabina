package domain

import (
	"database/sql"
	tools "sabina/base/domain/tools"
	proto "sabina/proto"
	"strings"
	dt "time"
)

// Estructura USR_FCM_HISTORY ---------
type UsrFcmHistory struct {
	Entity BaseEntity
	GoProto
	GoSQL
	FcmToken *string
	Device   UsrDevice
	Since    *dt.Time
	LastOne  bool
}

const fcmHistoryTableName = "FCM_HISTORY"

// CONSTRUCTORS ---------------------------
func (*UsrFcmHistory) New(
	pBase *BaseEntity, pFcm *string,
	pSince *dt.Time, pIsCurrent bool, pOwner *UsrUser) *UsrFcmHistory {
	return &UsrFcmHistory{
		Entity:   *pBase,
		FcmToken: pFcm,
		Since:    pSince,
		LastOne:  pIsCurrent,
	}
}

func (*UsrFcmHistory) Empty() *UsrFcmHistory {
	return (*UsrFcmHistory).New(
		nil,
		(*BaseEntity).Empty(nil),
		nil,
		nil,
		false,
		nil,
	)
}

func (*UsrFcmHistory) ByProto(pProto *proto.UsrFcmHistory, pLang any) (rEnt *UsrFcmHistory, rErr error) {
	rEnt = nil

	var base *BaseEntity = nil
	if base, rErr = (*BaseEntity).ByProto(nil, pProto.BaseEntity, pLang); rErr != nil {
		return
	}

	var owner *UsrUser = nil
	if owner, rErr = (*UsrUser).ByProto(nil, pProto.Owner, pLang); rErr != nil {
		return
	}

	rEnt = (*UsrFcmHistory).New(
		nil,
		base,
		&pProto.Token,
		tools.TimeStampToDateTime(pProto.Since),
		pProto.IsCurrent,
		owner,
	)
	return
}

// INTERFÍCIE GoEntity -----------------
func (cFcm *UsrFcmHistory) SrvId() *uint32       { return cFcm.Entity.ServerId }
func (cFcm *UsrFcmHistory) TableName() string    { return fcmHistoryTableName }
func (cFcm *UsrFcmHistory) IsNew() bool          { return cFcm.Entity.InstIsNew }
func (cFcm *UsrFcmHistory) IsUpdated() bool      { return cFcm.Entity.InstIsUpdated }
func (cFcm *UsrFcmHistory) IsDeleted() bool      { return cFcm.Entity.InstIsDeleted }
func (cFcm *UsrFcmHistory) SetNew(pNew bool)     { cFcm.Entity.InstIsNew = pNew }
func (cFcm *UsrFcmHistory) SetUpdated(pUpt bool) { cFcm.Entity.InstIsUpdated = pUpt }
func (cFcm *UsrFcmHistory) SetDeleted(pDel bool) { cFcm.Entity.InstIsDeleted = pDel }

// INTERFÍCIE GoEntity -----------------
func (cFHist *UsrFcmHistory) ToProto(pLang any) (rProto *proto.UsrFcmHistory, rErr error) {
	var bEnt *proto.PrtBaseEntity
	if bEnt, rErr = cFHist.Entity.ToProto(pLang); rErr == nil {
		var since *proto.Timestamp
		if since, rErr = tools.DateTimeToTimeStamp(cFHist.Since); rErr == nil {
			pEnt := proto.UsrFcmHistory{
				BaseEntity: bEnt,
				Token:      *cFHist.FcmToken,
				Since:      since,
				LastOne:    cFHist.LastOne,
			}
			rProto = &pEnt
		}
	}
	return
}

var _ = (*UsrFcmHistory).version(nil)

func (*UsrFcmHistory) version() *tools.Version {
	return tools.NewVersion(0, 7, 2)
}

// GoSQL INTERFÍCIE --------------------
func (*UsrFcmHistory) SqlSelect(pLang string, pId any, pId2 ...any) (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(tools.SeltBE + `,
		FCM_TOKEN, DEVICE_ID, SINCE, LAST_ONE
		FROM FCM_HISTORY
		WHERE ID = ?`,
	)

	rArgs = []any{pId}
	return
}

func (cFHist *UsrFcmHistory) SqlInsert() (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
		INSERT INTO FCM_HISTORY (
			CREATED_BY, CREATED_AT, 
			FCM_TOKEN, DEVICE_ID, SINCE, LAST_ONE
		) VALUES (?,?,  ?,?,?,?)`,
	)

	rArgs = []any{
		cFHist.Entity.CreatedBy, cFHist.Entity.CreatedAt,
		cFHist.FcmToken, cFHist.Device.SrvId(), cFHist.Since,
		cFHist.LastOne,
	}

	return
}

func (cFHist *UsrFcmHistory) SqlUpdate() (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
		UPDATE FCM_HISTORY SET
		UPDATED_BY = ?, UPDATED_AT = ?,
		FCM_TOKEN = ?, DEVICE_ID = ?, 
		SINCE = ?, IS_CURRENT = ?
		WHERE ID = ?`,
	)

	rArgs = []any{
		cFHist.Entity.UpdatedBy, cFHist.Entity.UpdatedAt,
		cFHist.FcmToken, cFHist.Device.SrvId(),
		cFHist.Since, cFHist.LastOne,
		cFHist.SrvId(),
	}

	return
}

func (cFHist *UsrFcmHistory) SqlDelete() (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
		DELETE 
		FROM FCM_HISTORY 
		WHERE ID = ?`,
	)
	rArgs = []any{cFHist.SrvId()}
	return
}

// BY_ID ------------------------------
func (*UsrFcmHistory) FromSqlRow(pRow *sql.Rows, pId uint32, pMandatory bool, pLang any) (rFHist *UsrFcmHistory, rErr error) {
	var deviceId uint32

	if pRow.Next() {
		rFHist = (*UsrFcmHistory).Empty(nil)
		rErr = pRow.Scan(
			rFHist.Entity.IdRef,
			rFHist.Entity.CreatedBy, rFHist.Entity.CreatedAt,
			rFHist.Entity.UpdatedBy, rFHist.Entity.UpdatedAt,
			&rFHist.FcmToken, &deviceId, &rFHist.Since, &rFHist.LastOne,
		)
		if rErr == nil {
			var dev *UsrDevice
			dev, rErr = (*UsrDevice).ById(nil, deviceId, true, pLang)
			if rErr == nil {
				rFHist.Device = *dev
			}
		}
	} else {
		if pMandatory {
			rErr = tools.ErrorInstanceForIdNotFound("UsrFcmHistory.FromSqlRow()", pId, rErr)
		}
	}
	return
}

func (*UsrFcmHistory) ById(pId uint32, pMandatory bool, pLang any) (rFcm *UsrFcmHistory, rErr error) {
	var db MariaDBService = *App.DbServ()
	var sql = tools.SeltBE + `,
		FCM_TOKEN, DEVICE_ID, SINCE, IS_CURRENT
		FROM FCM_HISTORY WHERE ID = ?`

	rows, rErr := db.DbConn.Query(sql, pId)
	if rErr == nil && rows.Next() {
		rFcm, rErr = (*UsrFcmHistory).FromSqlRow(nil, rows, pId, pMandatory, pLang)
	}
	return
}
