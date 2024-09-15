package base

import (
	"context"
	"database/sql"
	"fmt"
	proto "sabina/proto"
	"strings"
	"time"
)

// Estructura EMO_MOD -----------------
type EmoMood struct {
	Entity      GoBaseEntity
	Name        LocTranslation
	Description *LocTranslation
	Value       int32
}

var moodTableName = "MOOD"

// CONSTRUCTORS ---------------------------
func (*EmoMood) New(pBase *GoBaseEntity, pName *LocTranslation, pDesc *LocTranslation, pValue int32) *EmoMood {
	return &EmoMood{
		Entity:      *pBase,
		Name:        *pName,
		Description: pDesc,
		Value:       pValue,
	}
}

func (*EmoMood) Empty() *EmoMood {
	return (*EmoMood).New(
		nil,
		(*GoBaseEntity).Empty(nil),
		(*LocTranslation).Empty(nil),
		(*LocTranslation).Empty(nil), 0)
}

func (*EmoMood) ByProto(pMood *proto.EmoMood, pLang any) (rEnt *EmoMood, rErr error) {
	rEnt = nil
	var tname *LocTranslation
	var tdesc *LocTranslation

	if tname, rErr = (*LocTranslation).ById(nil, pMood.NameKey, true, pLang); rErr != nil {
		return
	}

	if tdesc, rErr = (*LocTranslation).ById(nil, pMood.DescKey, false, pLang); rErr != nil {
		return
	}

	var base *GoBaseEntity
	if base, rErr = (*GoBaseEntity).ByProto(nil, pMood.BaseEntity, pLang); rErr != nil {
		return
	}

	rEnt = (*EmoMood).New(nil, base, tname, tdesc, pMood.Value)
	return
}

// INTERFÍCIE GoEntity -----------------
func (cEnt *EmoMood) SrvId() *uint32       { return nil }
func (cEnt *EmoMood) TableName() string    { return moodTableName }
func (cEnt *EmoMood) IsNew() bool          { return cEnt.Entity.InstIsNew }
func (cEnt *EmoMood) IsUpdated() bool      { return cEnt.Entity.InstIsUpdated }
func (cEnt *EmoMood) IsDeleted() bool      { return cEnt.Entity.InstIsDeleted }
func (cEnt *EmoMood) SetNew(pNew bool)     { cEnt.Entity.SetNew(pNew) }
func (cEnt *EmoMood) SetUpdated(pUpt bool) { cEnt.Entity.SetUpdated(pUpt) }
func (cEnt *EmoMood) SetDeleted(pDel bool) { cEnt.Entity.SetDeleted(pDel) }

// INTERFÍCIE GoProto ------------------
func (cMood *EmoMood) ToProto(pLang any) (rEmo *proto.EmoMood, rErr error) {
	if cMood.Entity.ServerId == nil {
		rErr = ErrorNullId("EmoMood.ToProto()")

	} else {
		var ent *proto.PrtBaseEntity
		ent, rErr = cMood.Entity.ToProto(pLang)
		if rErr == nil {
			var dkey *string = nil
			if cMood.Description != nil {
				dkey = &cMood.Description.TextKey.TextKey
			}

			rEmo = &proto.EmoMood{
				BaseEntity: ent,
				NameKey:    cMood.Name.TextKey.TextKey,
				DescKey:    dkey,
				Value:      cMood.Value,
			}
		}
	}

	return
}

var _ = (*EmoMood).version(nil)

func (*EmoMood) version() *Version {
	return NewVersion(0, 7, 0)
}

// INTERFÍCIE GoSQL -------------------
func (*EmoMood) SqlSelect(pLang any, pId any, pId2 ...any) (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(SeltBE + `,
		NAME_KEY, DESCRIPTION_KEY, VALUE
		FROM MOOD 
		WHERE ID = ?`,
	)

	rArgs = []any{
		pId.(uint32),
	}

	return
}

func (cMood *EmoMood) SqlInsert() (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
		INSERT INTO MOOD
		(NAME_KEY, DESCRIPTION_KEY, VALUE, 
		CREATED_BY, CREATED_AT, UPDATED_BY, UPDATED_AT)
		VALUES(?, ?, ?, ?, ?, ?, ?)`,
	)

	rArgs = []any{
		cMood.Name,
		cMood.Description,
		cMood.Value,
		cMood.Entity.CreatedBy,
		cMood.Entity.CreatedAt,
		cMood.Entity.UpdatedBy,
		cMood.Entity.UpdatedAt,
	}
	return
}

func (cMood *EmoMood) SqlUpdate() (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
		UPDATE MOOD SET
		NAME_KEY = ?,
		DESCRIPTION_KEY = ?,
		VALUE = ?,
		CREATED_BY = ?,
		CREATED_AT = ?,
		UPDATED_BY = ?,
		UPDATED_AT = ?
		WHERE ID = ?`,
	)

	rArgs = []any{
		cMood.Name,
		cMood.Description,
		cMood.Value,
		cMood.Entity.CreatedBy,
		cMood.Entity.CreatedAt,
		cMood.Entity.UpdatedBy,
		cMood.Entity.UpdatedAt,
		cMood.SrvId(),
	}

	return
}

func (cMood *EmoMood) SqlDelete() (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
		DELETE 
		FROM MOOD 
		WHERE ID = ?`,
	)

	rArgs = []any{
		cMood.SrvId(),
	}

	return
}

// BY_ID ------------------------------
func (*EmoMood) FromSqlRow(pRows *sql.Rows, pId uint32, pMandatory bool, pLang any) (rMood *EmoMood, rErr error) {
	var nameKey string
	var descKey *string
	var cAt, uAt *string

	if pRows.Next() {
		rMood = (*EmoMood).Empty(nil)
		if rErr = pRows.Scan(
			rMood.Entity.ServerId,
			&rMood.Entity.CreatedBy, &cAt,
			&rMood.Entity.UpdatedBy, &uAt,
			&nameKey, &descKey, &rMood.Value,
		); rErr != nil {
			rMood = nil
			if pMandatory {
				rMood = nil
				rErr = ErrorInstanceForIdNotFound("EmoMood.FromSqlRow()", pId, rErr)
			}
			return
		}

		var time *time.Time
		time, rErr = StringToDateTime(cAt)
		if rErr != nil {
			return
		}
		rMood.Entity.CreatedAt = *time

		time, rErr = StringToDateTime(uAt)
		if rErr != nil {
			return
		}
		rMood.Entity.UpdatedAt = time

		var nkey *LocTranslation
		if nkey, rErr = (*LocTranslation).ById(nil, nameKey, true, pLang); rErr != nil {
			rMood = nil
			return
		}
		rMood.Name = *nkey

		if descKey != nil {
			if nkey, rErr = (*LocTranslation).ById(nil, *descKey, false, pLang); rErr != nil {
				rMood = nil
				return
			}
			rMood.Description = nkey
		}
	}

	return
}

func (*EmoMood) ById(pId uint32, pMandatory bool, pLang any) (rMood *EmoMood, rErr error) {
	var db MariaDBService = *App.DbServ()
	var rows *sql.Rows
	var tmp GoEntity

	rErr = nil
	if db.cache.Exists(moodTableName, pLang, pId) {
		tmp = db.cache.Get(moodTableName, pLang, pId)
		rMood = tmp.(*EmoMood)
	} else {
		ssql, _ := (*EmoMood).SqlSelect(nil, pLang, pId)
		if rows, rErr = db.SelectInt(ssql, pId); rErr != nil {
			if rows != nil {
				rows.Close()
			}
			rMood = nil
			return
		}

		if rMood, rErr = (*EmoMood).FromSqlRow(nil, rows, pId, pMandatory, pLang); rErr != nil {
			rMood = (*EmoMood).Empty(nil)
			// JIQ Cal entendre què haurem de fer en aquest cas!
		} else {
			db.cache.Add(rMood)
		}
		rows.Close()
	}

	return
}

func (*EmoMood) BySureId(pId uint32, pLang any) (rEmo EmoMood) {
	var loc, _ = (*EmoMood).ById(nil, pId, true, pLang)
	return *loc
}

// SINCRONITZACIÓ ---------------------
func (*EmoMood) FindSyncs(pCtx context.Context, pLastId int32, pUpdatedAt *time.Time, pLang any) (rMoods *proto.EmoMoods) {
	var db MariaDBService = *App.DbServ()
	var id uint32
	var rows *sql.Rows
	var rErr error
	var serr string

	rMoods = &proto.EmoMoods{}
	rMoods.Error = nil
	rMoods.Moods = make([]*proto.EmoMood, 0)

	fmt.Println("\nMood.FindSyncs(pLastId, pUpdatedAt)")
	if pUpdatedAt != nil {
		sql := "SELECT Id FROM MOOD WHERE Id > ? OR TIMESTAMPDIFF(MICROSECOND, FROM_UNIXTIME(UPDATED_AT), FROM_UNIXTIME(?)) > 0"
		fmt.Printf("SELECT Id FROM MOOD Id > %d AND UPDATE_AT > '%s'\n", pLastId, pUpdatedAt.String())
		rows, rErr = db.DbConn.Query(sql, pLastId, pUpdatedAt)
	} else {
		sql := "SELECT Id FROM MOOD WHERE Id > ?"
		fmt.Printf("SELECT Id FROM MOOD Id > %d\n", pLastId)
		rows, rErr = db.DbConn.Query(sql, pLastId)
	}

	if rErr != nil {
		if pUpdatedAt != nil {
			serr = fmt.Sprintf("Mood(pLastId=%d, pUpdatedAt='%s')", pLastId, pUpdatedAt.Format(FmtDateTimeT))
		} else {
			serr = fmt.Sprintf("Mood(pLastId=%d, pUpdatedAt=NULL)", pLastId)
		}
		rMoods.Error = &proto.GbError{Code: proto.GbErrorCode_GB_ERROR_CODE_SQL_ERROR, Message: &serr}

	} else {
		var idx int = 0
		rMoods.Moods = make([]*proto.EmoMood, 0)
		for rows.Next() {
			idx += 1
			rErr = rows.Scan(&id)
			if rErr != nil {
				if pUpdatedAt != nil {
					serr = fmt.Sprintf("Mood(pLastId=%d, pUpdatedAt='%s')", pLastId, pUpdatedAt.Format(FmtDateTimeT))
				} else {
					serr = fmt.Sprintf("Mood(pLastId=%d, pUpdatedAt=NULL)", pLastId)
				}
				fmt.Printf("Error: %s", serr)
				rMoods.Error = &proto.GbError{Code: proto.GbErrorCode_GB_ERROR_CODE_SQL_ERROR, Message: &serr}
				break
			}
			var mood *EmoMood
			mood, rErr = (*EmoMood).ById(nil, id, true, pLang)
			if rErr != nil {
				fmt.Printf("EmoMood.FindSyncs: %s\n", rErr.Error())
				continue
			}
			var pm, _ = mood.ToProto(pLang)
			rMoods.Moods = append(rMoods.Moods, pm)
		}
		fmt.Printf("Número d'Estats d'Ànim: %d\n", idx)
		rows.Close()
	}
	return
}
