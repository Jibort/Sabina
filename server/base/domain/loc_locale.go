package domain

import (
	"database/sql"
	proto "sabina/proto"
)

// LOCALE =====================================================================
type LocLocale struct {
	GoEntity
	GoProto
	GoSQL
	Id        string
	Auxiliar  *string
	IsDefault bool
	isNew     bool
	isUpdated bool
	isDeleted bool
}

const localeTableName = "LOCALE"

// CONSTRUCTORS -----------------------------
func (*LocLocale) New(
	pId string,
	pAux *string,
	pIsDef bool,
	pIsNew bool,
	pIsUpdated bool,
	pIsDeleted bool,
) *LocLocale {
	return &LocLocale{
		Id:        pId,
		Auxiliar:  pAux,
		IsDefault: pIsDef,
		isNew:     pIsNew,
		isUpdated: pIsUpdated,
		isDeleted: pIsDeleted,
	}
}

func (*LocLocale) Empty() *LocLocale {
	return (*LocLocale).New(
		nil,
		"es",
		nil,
		false,
		true,
		false,
		false,
	)
}

func (cLoc LocLocale) ByProto(pLoc *proto.LocLocale, pLang any) (rLoc *LocLocale, rErr error) {
	rLoc = (*LocLocale).New(
		nil,
		pLoc.LocaleKey,
		pLoc.Auxiliar,
		pLoc.DefLang,
		pLoc.IsNew,
		pLoc.IsUpdated,
		pLoc.IsDeleted,
	)

	return
}

// INTERFÍCIE GoEntity -----------------
func (cLoc *LocLocale) SrvId() *uint32       { return nil }
func (cLoc *LocLocale) TableName() string    { return localeTableName }
func (cLoc *LocLocale) IsNew() bool          { return cLoc.isNew }
func (cLoc *LocLocale) IsUpdated() bool      { return cLoc.isUpdated }
func (cLoc *LocLocale) IsDeleted() bool      { return cLoc.isDeleted }
func (cLoc *LocLocale) SetNew(pNew bool)     { cLoc.isNew = pNew }
func (cLoc *LocLocale) SetUpdated(pUpt bool) { cLoc.isUpdated = pUpt }
func (cLoc *LocLocale) SetDeleted(pDel bool) { cLoc.isDeleted = pDel }

// INTERFÍCIE GoProto ------------------
func (cLoc LocLocale) ToProto(pLang any) (rLoc *proto.LocLocale, rErr error) {
	rLoc = &proto.LocLocale{
		LocaleKey: cLoc.Id,
		Auxiliar:  cLoc.Auxiliar,
		DefLang:   cLoc.IsDefault,
		IsNew:     cLoc.isNew,
		IsUpdated: cLoc.isUpdated,
		IsDeleted: cLoc.isDeleted,
	}
	return
}

// LD_SQL INTERFÍCIE -------------------
func (*LocLocale) SqlSelect(pLang string, pId any, pId2 ...any) (rSQL string, rArgs []any) {
	rSQL = `
	SELECT LOCALE_KEY, AUXILIAR, IS_DEFAULT
	FROM LOCALE
	WHERE LOCALE_KEY = ?`

	rArgs = []any{pId}
	return
}

func (cLoc LocLocale) SqlInsert(pLang string) (rSQL string, rArgs []any) {
	rSQL = `
	INSERT INTO LOCALE
	(LOCALE_KEY, AUXILIAR, IS_DEFAULT)
	VALUES (?, ?, ?)`

	rArgs = []any{cLoc.Id, cLoc.Auxiliar, cLoc.IsDefault}
	return
}

func (cLoc LocLocale) SqlUpdate(pLang string) (rSQL string, rArgs []any) {
	rSQL = `
	UPDATE LOCALE
	SET AUXILIAR = ?,
	IS_DEFAULT = ?,
	WHERE LOCALE_KEY = ?`
	rArgs = []any{cLoc.Auxiliar, cLoc.IsDefault, cLoc.Id}
	return
}

func (cLoc LocLocale) SqlDelete(pLang string) (rSQL string, rArgs []any) {
	rSQL = "DELETE FROM LOCALE WHERE LOCALE_KEY = ?"
	rArgs = []any{cLoc.Id}
	return
}

// BY IDs -----------------------------
func (*LocLocale) FromSqlRow(pRows *sql.Rows, pId string, pMandatory bool, pLang any) (rLoc *LocLocale, rErr error) {
	if pRows.Next() {
		rLoc = (*LocLocale).Empty(nil)
		if rErr = pRows.Scan(&rLoc.Id, &rLoc.Auxiliar, &rLoc.IsDefault); rErr != nil {
			rLoc = nil
			if pMandatory {
				rErr = ErrorInstanceForIdNotFound("LocLocale.FromSqlRow()", pId, rErr)
			}
		}
	}
	return
}

func (*LocLocale) InstById(pId string, pLang any) (rLoc LocLocale) {
	var loc, _ = (*LocLocale).ById(nil, pId, true, pLang)
	return *loc
}

func (*LocLocale) ById(pId string, pMandatory bool, pLang any) (rLoc *LocLocale, rErr error) {
	var db MariaDBService = *App.DbServ()
	var rows *sql.Rows
	var tmp GoEntity

	rErr = nil
	if db.cache.Exists(localeTableName, pId, nil) {
		tmp = db.cache.Get(localeTableName, pId, nil)
		rLoc = tmp.(*LocLocale)

	} else {
		ssql, _ := (*LocLocale).SqlSelect(nil, pId, nil)
		if rows, rErr = db.SelectStr(ssql, pId); rErr != nil {
			if rows != nil {
				rows.Close()
			}
			rLoc = nil
			return
		}
		if rLoc, rErr = (*LocLocale).FromSqlRow(nil, rows, pId, pMandatory, pLang); rErr != nil {
			if rows != nil {
				rows.Close()
			}
			rLoc = (*LocLocale).Empty(nil)
			// JIQ Cal entendre què haurem de fer en aquest cas!
		} else {
			rows.Close()
			db.cache.Add(rLoc)
		}
	}

	return
}
