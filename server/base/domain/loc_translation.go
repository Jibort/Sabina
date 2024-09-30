package domain

import (
	"database/sql"
	tools "sabina/base/domain/tools"
	proto "sabina/proto"
	"strings"
)

// ESTRUCTURA LOC_TRANSLATION ---------
type LocTranslation struct {
	GoEntity
	GoProto
	GoSQL
	ServerId  *uint32
	TextKey   string
	Locale    string
	Literal   string
	Iteration int32
	isNew     bool
	isUpdated bool
	isDeleted bool
}

const translationTableName = "TRANSLATION"

// CONSTRUCTORS ---------------------------
func (*LocTranslation) New(pLocale *string, pTKey *string, pLiteral *string, pIteration *int32, pNew *bool, pUpd *bool, pDel *bool) *LocTranslation {
	var lit = ""
	if pLiteral != nil {
		lit = *pLiteral
	}
	*pNew = (pNew != nil && *pNew == true)
	*pUpd = (pUpd != nil && *pUpd == true)
	*pDel = (pNew != nil && *pDel == true)

	var iter int32 = 0
	if pIteration != nil {
		iter = *pIteration
	}

	return &LocTranslation{
		Locale:    *pLocale,
		TextKey:   *pTKey,
		Literal:   lit,
		Iteration: iter,
		isNew:     *pNew,
		isUpdated: *pUpd,
		isDeleted: *pDel,
	}
}

func (*LocTranslation) Empty() *LocTranslation {
	return (*LocTranslation).New(
		nil,
		nil,
		nil,
		nil,
		nil,
		&tools.PtTrue,
		&tools.PtFalse,
		&tools.PtFalse,
	)
}

func (cTx *LocTranslation) ByProto(pTx *proto.LocTranslation) (rErr error) {
	cTx.Locale = pTx.Locale
	cTx.TextKey = pTx.TextKey
	cTx.Literal = pTx.Literal
	cTx.Iteration = pTx.Iteration
	cTx.isNew = pTx.IsNew
	cTx.isUpdated = pTx.IsUpdated
	cTx.isDeleted = pTx.IsDeleted
	return
}

// INTERFÍCIE GoEntity -----------------
func (cTx *LocTranslation) SrvId() *uint32       { return nil }
func (cTx *LocTranslation) TableName() string    { return translationTableName }
func (cTx *LocTranslation) IsNew() bool          { return cTx.isNew }
func (cTx *LocTranslation) IsUpdated() bool      { return cTx.isUpdated }
func (cTx *LocTranslation) IsDeleted() bool      { return cTx.isDeleted }
func (cTx *LocTranslation) SetNew(pNew bool)     { cTx.isNew = pNew }
func (cTx *LocTranslation) SetUpdated(pUpt bool) { cTx.isUpdated = pUpt }
func (cTx *LocTranslation) SetDeleted(pDel bool) { cTx.isDeleted = pDel }

// INTERFÍCIE GoProto ------------------
func (cTx *LocTranslation) ToProto() (rTx *proto.LocTranslation, rErr error) {
	*rTx.Locale = cTx.Locale
	*rTx.TextKey = cTx.TextKey
	*rTx.Literal = cTx.Literal
	*rTx.Iteration = cTx.Iteration
	*rTx.IsNew = cTx.isNew
	*rTx.IsUpdated = cTx.isUpdated
	*rTx.IsDeleted = cTx.isDeleted
	return
}

var _ = (*LocTranslation).version(nil)

func (*LocTranslation) version() *tools.Version { return tools.NewVersion(0, 7, 0) }

// GoSQL INTERFÍCIE --------------------
func (*LocTranslation) SqlSelect(pLang any, pId any, pId2 ...any) (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
		SELECT TEXT_KEY, LOCALE_CODE, LITERAL, MAX(ITERATION)
		FROM TRANSLATION 
		WHERE LOCALE_KEY = ? AND TEXT_KEY = ?
		GROUP BY LOCALE_KEY, TEXT_KEY`,
	)

	var slang, stkey *string
	slang = AnyToString(pId)

	if len(pId2) != 1 {
		panic("LocTranslation.SqlSelect: Falta l'identificador pTKey!!")
	}
	stkey = AnyToString(pId2[0])

	rArgs = []any{
		slang,
		stkey,
	}

	return
}

func (cTx *LocTranslation) SqlInsert() (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
		INSERT INTO TRANSLATE
		(LOCALE_KEY, TEXT_KEY, LITERAL)
		VALUES (?, ?, ?)`,
	)

	rArgs = []any{
		cTx.Locale.Id,
		cTx.TextKey.TextKey,
		cTx.Literal,
	}

	return
}

func (cTx *LocTranslation) SqlUpdate() (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
		UPDATE TRANSLATE 
		SET LITERAL = ?
		WHERE LOCALE_KEY = ? AND TEXT_KEY = ?`,
	)

	rArgs = []any{
		cTx.Literal,
		cTx.Locale.Id,
		cTx.TextKey.TextKey,
	}

	return
}

func (cTx *LocTranslation) SqlDelete() (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
		DELETE 
		FROM TRANSLATE 
		WHERE LOCALE_KEY = ? AND TEXT_KEY = ?`,
	)

	rArgs = []any{
		cTx.Locale.Id,
		cTx.TextKey.TextKey}

	return
}

// BY_ID ------------------------------
func (*LocTranslation) FromSqlRow(pRows *sql.Rows, pMandatory bool, pLang any) (rTx *LocTranslation, rErr error) {
	var loc32, tkey32, literal string
	rTx = nil

	if pRows.Next() {
		if rErr = pRows.Scan(&loc32, &tkey32, &literal); rErr != nil {
			if pMandatory {
				rErr = ErrorInstanceForIdNotFound("LocTranslation.FromSqlRow() Sense traducció", " Row buïda!", rErr)
			}
			return
		}

		var lainst *LocLocale
		if lainst, rErr = (*LocLocale).ById(nil, loc32, true, pLang); rErr != nil {
			return
		}

		var tkinst *LocTextKey
		if tkinst, rErr = (*LocTextKey).ById(nil, tkey32, true, pLang); rErr != nil {
			return
		}

		rTx = (*LocTranslation).New(nil, lainst, tkinst, &literal, false, false)
	}

	return
}

func (*LocTranslation) InstById(pTKey LocTextKey, pLang any) (rTx LocTranslation) {
	var tx, _ = (*LocTranslation).ById(nil, pTKey, true, pLang)
	return *tx
}

func (*LocTranslation) ById(pTKey any, pMandatory bool, pLang any) (rTx *LocTranslation, rErr error) {
	var db MariaDBService = *App.DbServ()
	var rows *sql.Rows
	var tmp GoEntity

	rErr = nil
	if db.cache.Exists(translationTableName, pLang, pTKey) {
		tmp = db.cache.Get(translationTableName, pLang, pTKey)
		rTx = tmp.(*LocTranslation)
	} else {
		var slang, stkey *string
		slang = AnyToString(pLang)
		stkey = AnyToString(pTKey)
		ssql, _ := (*LocTranslation).SqlSelect(nil, pLang, pLang, pTKey)
		if rows, rErr = db.SelectStr(ssql, *slang, *stkey); rErr != nil {
			rTx = nil
			return
		}

		if rTx, rErr = (*LocTranslation).FromSqlRow(nil, rows, pMandatory, pLang); rErr != nil {
			rTx = (*LocTranslation).Empty(nil)
			// JIQ Cal entendre què haurem de fer en aquest cas!
		} else {
			db.cache.Add(rTx)
		}
		rows.Close()
	}
	return
}
