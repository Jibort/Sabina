package domain

import (
	"database/sql"
	proto "sabina/proto"
)

// Estructura TEXT_KEY ----------------
type LocTextKey struct {
	GoEntity
	GoProto
	GoSQL
	TextKey   string
	Auxiliar  *string
	isNew     bool
	isUpdated bool
	isDeleted bool
}

const textKeyTableName = "TEXT_KEY"

// CONSTRUCTORS -----------------------
func (*LocTextKey) New(
	pTKey string,
	pAux *string,
) *LocTextKey {
	return &LocTextKey{
		TextKey:  pTKey,
		Auxiliar: pAux,
	}
}
func (*LocTextKey) Empty() *LocTextKey {
	return (*LocTextKey).New(nil, "", nil)
}

func (cTKey *LocTextKey) ByProto(pLoc *proto.LocTextKey, pLang any) (rErr error) {
	cTKey.TextKey = pLoc.TextKey
	cTKey.Auxiliar = pLoc.Auxiliar
	return
}

// INTERFÍCIE GoEntity -----------------
func (cTKey *LocTextKey) SrvId() *uint32       { return nil }
func (cTKey *LocTextKey) TableName() string    { return textKeyTableName }
func (cTKey *LocTextKey) IsNew() bool          { return cTKey.isNew }
func (cTKey *LocTextKey) IsUpdated() bool      { return cTKey.isUpdated }
func (cTKey *LocTextKey) IsDeleted() bool      { return cTKey.isDeleted }
func (cTKey *LocTextKey) SetNew(pNew bool)     { cTKey.isNew = pNew }
func (cTKey *LocTextKey) SetUpdated(pUpt bool) { cTKey.isUpdated = pUpt }
func (cTKey *LocTextKey) SetDeleted(pDel bool) { cTKey.isDeleted = pDel }

// LD_PROTO INTERFÍCIE -----------------
func (cTKey *LocTextKey) ToProto(pLang any) (rTKey *proto.LocTextKey, rErr error) {
	rTKey = &proto.LocTextKey{
		TextKey:  cTKey.TextKey,
		Auxiliar: cTKey.Auxiliar,
	}
	return
}

// LD_SQL INTERFÍCIE -------------------
func (*LocTextKey) SqlSelect(pLang string, pId any, pId2 ...any) (rSQL string, rArgs []any) {
	rSQL = `
	SELECT TEXT_KEY, AUXILIAR
	FROM TEXT_KEY
	WHERE TEXT_KEY = ?`

	rArgs = []any{pId}

	return
}

func (cTKey LocTextKey) SqlInsert(pLang string) (rSQL string, rArgs []any) {
	rSQL = `
	INSERT INTO TEXT_KEY (TEXT_KEY, AUXILIAR
	) VALUES (?, ?)`

	rArgs = []any{cTKey.TextKey, cTKey.Auxiliar}
	return
}

func (cTKey LocTextKey) SqlUpdate(pLang string) (rSQL string, rArgs []any) {
	rSQL = `
	UPDATE TEXT_KEY SET
	AUXILIAR = ?
	WHERE TEXT_KEY = ?`
	rArgs = []any{cTKey.Auxiliar, cTKey.TextKey}
	return
}

func (cTKey LocTextKey) SqlDelete(pLang string) (rSQL string, rArgs []any) {
	rSQL = "DELETE FROM TEXT_KEY WHERE TEXT_KEY = ?"
	rArgs = []any{cTKey.TextKey}
	return
}

func (*LocTextKey) FromSqlRow(pRows *sql.Rows, pTKey string, pMandatory bool, pLang any) (rTKey *LocTextKey, rErr error) {
	if pRows.Next() {
		rTKey = (*LocTextKey).Empty(nil)
		rErr = pRows.Scan(&rTKey.TextKey, &rTKey.Auxiliar)
	} else {
		if pMandatory {
			rErr = ErrorInstanceForIdNotFound("LocTextKey.FromSqlRow()", pTKey, rErr)
		}
	}
	return
}

func (*LocTextKey) InstById(pTKey string, pLang any) LocTextKey {
	var tkey, _ = (*LocTextKey).ById(nil, pTKey, true, pLang)
	return *tkey
}

func (*LocTextKey) ById(pTKey string, pMandatory bool, pLang any) (rTKey *LocTextKey, rErr error) {
	var db MariaDBService = *App.DbServ()
	var rows *sql.Rows
	var tmp GoEntity

	rErr = nil
	if db.cache.Exists(translationTableName, pLang, pTKey) {
		tmp = db.cache.Get(translationTableName, pLang, pTKey)
		rTKey = tmp.(*LocTextKey)
	} else {
		ssql, _ := (*LocTextKey).SqlSelect(nil, *AnyToString(pLang), pTKey)
		if rows, rErr = db.SelectStr(ssql, pTKey); rErr != nil {
			rTKey = nil
			return
		}

		if rTKey, rErr = (*LocTextKey).FromSqlRow(nil, rows, pTKey, pMandatory, pLang); rErr != nil {
			rTKey = (*LocTextKey).Empty(nil)
			// JIQ Cal entendre què haurem de fer en aquest cas!
		} else {
			db.cache.Add(rTKey)
		}
		rows.Close()
	}

	return
}
