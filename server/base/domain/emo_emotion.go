package domain

import (
	"context"
	"database/sql"
	"fmt"
	tools "sabina/base/domain/tools"
	proto "sabina/proto/global"
	"strings"

	"time"
)

// Estructura EMOTION -----------------
type EmoEmotion struct {
	Entity      BaseEntity
	Name        LocTranslation
	Description *LocTranslation
	Parent      *EmoEmotion
	Value       int32
}

const emotionTableName = "EMOTION"

// CONSTRUCTORS ---------------------------
func (*EmoEmotion) New(pBase *BaseEntity, pName *LocTranslation, pDesc *LocTranslation, pParent *EmoEmotion, pValue int32) *EmoEmotion {
	return &EmoEmotion{
		Entity:      *pBase,
		Name:        *pName,
		Description: pDesc,
		Parent:      pParent,
		Value:       pValue,
	}
}

func (*EmoEmotion) Empty() *EmoEmotion {
	return (*EmoEmotion).New(
		nil,
		(*BaseEntity).Empty(nil),
		(*LocTranslation).Empty(nil),
		(*LocTranslation).Empty(nil),
		nil, 0)
}

func (*EmoEmotion) ByProto(pEmotion *proto.EmoEmotion, pLang string) (rEnt *EmoEmotion, rErr error) {
	rEnt = nil
	var tname, tdesc *LocTranslation
	var base *BaseEntity
	var parent *EmoEmotion

	if tname, rErr = (*LocTranslation).ById(nil, pEmotion.NameKey, true, pLang); rErr != nil {
		return
	}

	if tdesc, rErr = (*LocTranslation).ById(nil, pEmotion.DescKey, false, pLang); rErr != nil {
		return
	}

	if base, rErr = (*BaseEntity).ByProto(nil, pEmotion.BaseEntity, pLang); rErr != nil {
		return
	}

	if pEmotion.Parent != nil {
		if parent, rErr = (*EmoEmotion).Empty(nil).ByProto(pEmotion.Parent, pLang); rErr != nil {
			return
		}
	}

	rEnt = (*EmoEmotion).New(nil, base, tname, tdesc, parent, pEmotion.Value)
	return
}

// INTERFÍCIE GoEntity -----------------
func (cEnt *EmoEmotion) SrvId() *uint32       { return cEnt.Entity.ServerId }
func (cEnt *EmoEmotion) TableName() string    { return emotionTableName }
func (cEnt *EmoEmotion) IsNew() bool          { return cEnt.isNew }
func (cEnt *EmoEmotion) IsUpdated() bool      { return cEnt.isUpdated }
func (cEnt *EmoEmotion) IsDeleted() bool      { return cEnt.isDeleted }
func (cEnt *EmoEmotion) SetNew(pNew bool)     { cEnt.isNew = pNew }
func (cEnt *EmoEmotion) SetUpdated(pUpt bool) { cEnt.isUpdated = pUpt }
func (cEnt *EmoEmotion) SetDeleted(pDel bool) { cEnt.isDeleted = pDel }

// INTERFÍCIE GoProto ------------------
func (cEmo *EmoEmotion) ToProto(pLang any) (rEmo *proto.EmoEmotion, rErr error) {
	if cEmo.Entity.ServerId == nil {
		rErr = tools.ErrorNullId("EmoEmotion.ToProto()")
	} else {
		var ent *proto.PrtBaseEntity
		ent, rErr = cEmo.Entity.ToProto(pLang)

		if rErr == nil {
			var name *proto.LocTranslation
			name, rErr = cEmo.Name.ToProto(pLang)

			if rErr == nil {
				var desc *proto.LocTranslation
				desc, rErr = cEmo.Description.ToProto(pLang)

				if rErr == nil {
					var prt *proto.EmoEmotion = nil
					if cEmo.Parent != nil {
						if prt, rErr = cEmo.Parent.ToProto(pLang); rErr != nil {
							rEmo = nil
							return
						}
					}
					rEmo = &proto.EmoEmotion{
						BaseEntity: ent,
						NameKey:    name.TextKey.TextKey,
						DescKey:    &desc.TextKey.TextKey,
						Parent:     prt,
						Value:      cEmo.Value,
					}
				}
			}
		}
	}
	return
}

var _ = (*EmoEmotion).version(nil)

func (*EmoEmotion) version() *tools.Version {
	return tools.NewVersion(0, 7, 0)
}

// INTERFÍCIE GoSQL --------------------
func (cEmo *EmoEmotion) SqlSelect(pLang any, pId any, pId2 ...any) (rSQL string, rArgs []any) {
	rSQL = tools.SeltBE + `,
	NAME_KEY, DESCRIPTION_KEY, PARENT_ID, VALUE
	FROM EMOTION 
	WHERE ID = ?`

	rArgs = []any{
		pId.(uint32),
	}
	return
}

func (cEmo *EmoEmotion) SqlInsert() (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
	INSERT 
	INTO EMOTION
	(NAME_KEY, DESCRIPTION_KEY, PARENT_ID, VALUE, 
	CREATED_BY, CREATED_AT, UPDATED_BY, UPDATED_AT)
	VALUES(?, ?, ?, ?, ?, ?, ?)`,
	)

	rArgs = []any{
		cEmo.Name,
		cEmo.Description,
		cEmo.Parent,
		cEmo.Value,
		cEmo.Entity.CreatedBy,
		cEmo.Entity.CreatedAt,
		cEmo.Entity.UpdatedBy,
		cEmo.Entity.UpdatedAt,
	}
	return
	// return fmt.Sprintf(strings.TrimSpace(sql),
	// AsSQL(cEmo.Name),
	// AsSQL(cEmo.Description),
	// AsSQL(cEmo.Parent),
	// cEmo.Value,
	// cEmo.Entity.CreatedBy,
	// AsSQL(&cEmo.Entity.CreatedAt),
	// AsSQL(cEmo.Entity.UpdatedBy),
	// AsSQL(cEmo.Entity.UpdatedAt),
	// )
}

func (cEmo *EmoEmotion) SqlUpdate() (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
	UPDATE EMOTION
	SET
		NAME_KEY = ?,
		DESCRIPTION_KEY = ?,
		PARENT_ID = ?,
		VALUE = ?,
		CREATED_BY = ?,
		CREATED_AT = ?,
		UPDATED_BY = ?,
		UPDATED_AT = ?
		WHERE ID = ?`,
	)

	rArgs = []any{
		cEmo.Name.TextKey,
		cEmo.Description,
		cEmo.Parent,
		cEmo.Value,
		cEmo.Entity.CreatedBy,
		&cEmo.Entity.CreatedAt,
		cEmo.Entity.UpdatedBy,
		&cEmo.Entity.UpdatedAt,
		cEmo.SrvId(),
	}
	return
	// return fmt.Sprintf(strings.TrimSpace(sql),
	// 	AsSQL(cEmo.Name.TextKey),
	// 	AsSQL(cEmo.Description),
	// 	AsSQL(cEmo.Parent),
	// 	cEmo.Value,
	// 	AsSQL(cEmo.Entity.CreatedBy),
	// 	AsSQL(&cEmo.Entity.CreatedAt),
	// 	AsSQL(cEmo.Entity.UpdatedBy),
	// 	AsSQL(&cEmo.Entity.UpdatedAt),
	// 	cEmo.SrvId(),
	// )
}

func (cEmo *EmoEmotion) SqlDelete() (rSQL string, rArgs []any) {
	rSQL = strings.TrimSpace(`
		DELETE
		FROM EMOTION
		WHERE ID = ?`,
	)

	rArgs = []any{
		cEmo.SrvId(),
	}

	return
}

// BY_ID ------------------------------
func (*EmoEmotion) FromSqlRow(pRows *sql.Rows, pId uint32, pMandatory bool, pLang any) (rEmo *EmoEmotion, rErr error) {
	var nameKey string
	var descKey *string
	var prtId *uint32
	var cAt, uAt *string

	if pRows.Next() {
		rEmo = (*EmoEmotion).Empty(nil)
		if rErr = pRows.Scan(
			&rEmo.Entity.ServerId,
			&rEmo.Entity.CreatedBy, &cAt,
			&rEmo.Entity.UpdatedBy, &uAt,
			&nameKey, &descKey, &prtId, &rEmo.Value); rErr != nil {
			rEmo = nil
			if pMandatory {
				rErr = tools.ErrorInstanceForIdNotFound("EmoEmotion.FromSqlRow()", pId, rErr)
			}
			return
		}

		var time *time.Time
		time, rErr = tools.StringToDateTime(cAt)
		if rErr != nil {
			return
		}
		rEmo.Entity.CreatedAt = *time

		time, rErr = tools.StringToDateTime(uAt)
		if rErr != nil {
			return
		}
		rEmo.Entity.UpdatedAt = time

		var nkey *LocTranslation
		if nkey, rErr = (*LocTranslation).ById(nil, nameKey, true, pLang); rErr != nil {
			rEmo = nil
			return
		}
		rEmo.Name = *nkey

		if descKey != nil {
			if nkey, rErr = (*LocTranslation).ById(nil, *descKey, false, pLang); rErr != nil {
				rEmo = nil
				return
			}
			rEmo.Description = nkey
		}

		rEmo.Parent = nil
		if prtId != nil {
			if rEmo.Parent, rErr = (*EmoEmotion).ById(nil, *prtId, false, pLang); rErr != nil {
				rEmo = nil
				return
			}
		}
	}

	return
}

func (*EmoEmotion) ById(pId uint32, pMandatory bool, pLang any) (rEmo *EmoEmotion, rErr error) {
	var db MariaDBService = *App.DbServ()
	var rows *sql.Rows
	var tmp GoEntity

	if db.cache.Exists(emotionTableName, pLang, pId) {
		tmp = db.cache.Get(emotionTableName, pLang, pId)
		rEmo = tmp.(*EmoEmotion)
	} else {
		ssql, _ := (*EmoEmotion).SqlSelect(nil, pLang, pId)
		if rows, rErr = db.SelectInt(ssql, pId); rErr != nil {
			if rows != nil {
				rows.Close()
			}
			rEmo = nil
			return
		}
		if rEmo, rErr = (*EmoEmotion).FromSqlRow(nil, rows, pId, pMandatory, pLang); rErr != nil {
			rEmo = (*EmoEmotion).Empty(nil)
			// JIQ Cal entendre què haurem de fer en aquest cas!
		} else {
			db.cache.Add(rEmo)
		}
		rows.Close()
	}

	return
}

func (*EmoEmotion) BySureId(pId uint32, pLang any) (rEmo EmoEmotion) {
	var loc, _ = (*EmoEmotion).ById(nil, pId, true, pLang)
	return *loc
}

// SINCRONITZACIÓ ---------------------
func (*EmoEmotion) FindSyncs(pCtx context.Context, pLastId int32, pUpdatedAt *time.Time, pLang any) (rEmos *proto.EmoEmotions) {
	rEmos = &proto.EmoEmotions{}
	rEmos.Error = nil
	rEmos.Emotions = make([]*proto.EmoEmotion, 0)
	var db MariaDBService = *App.DbServ()
	var id uint32
	var rows *sql.Rows
	var rErr error
	var serr string

	fmt.Println("\nEmotion.FindSyncs(pLastId, pUpdatedAt)")
	if pUpdatedAt != nil {
		sql := "SELECT Id FROM EMOTION WHERE Id > ? OR TIMESTAMPDIFF(MICROSECOND, FROM_UNIXTIME(UPDATED_AT), FROM_UNIXTIME(?)) > 0"
		fmt.Printf("SELECT Id FROM EMOTION Id > %d AND UPDATE_AT > '%s'\n", pLastId, pUpdatedAt.String())
		rows, rErr = db.DbConn.Query(sql, pLastId, pUpdatedAt)
	} else {
		sql := "SELECT Id FROM EMOTION WHERE Id > ?"
		fmt.Printf("SELECT Id FROM EMOTION Id > %d\n", pLastId)
		rows, rErr = db.DbConn.Query(sql, pLastId)
	}

	if rErr != nil {
		if pUpdatedAt != nil {
			serr = fmt.Sprintf("Emotion(pLastId=%d, pUpdatedAt='%s')", pLastId, pUpdatedAt.Format(FmtDateTimeT))
		} else {
			serr = fmt.Sprintf("Emotion(pLastId=%d, pUpdatedAt=NULL)", pLastId)
		}
		rEmos.Error = &proto.GbError{Code: proto.GbErrorCode_GB_ERROR_CODE_SQL_ERROR, Message: &serr}

	} else {
		var idx int = 0
		rEmos.Emotions = make([]*proto.EmoEmotion, 0)
		for rows.Next() {
			idx += 1
			rErr = rows.Scan(&id)
			if rErr != nil {
				if pUpdatedAt != nil {
					serr = fmt.Sprintf("Emotion(pLastId=%d, pUpdatedAt='%s')", pLastId, pUpdatedAt.Format(FmtDateTimeT))
				} else {
					serr = fmt.Sprintf("Emotion(pLastId=%d, pUpdatedAt=NULL)", pLastId)
				}
				fmt.Printf("Error: %s", serr)
				rEmos.Error = &proto.GbError{Code: proto.GbErrorCode_GB_ERROR_CODE_SQL_ERROR, Message: &serr}
				break
			}
			var emotion *EmoEmotion
			emotion, rErr = (*EmoEmotion).ById(nil, id, true, pLang)
			if rErr != nil {
				break
			}
			var pro, _ = emotion.ToProto(pLang)
			rEmos.Emotions = append(rEmos.Emotions, pro)
		}
		fmt.Printf("Número d'Emocions: %d\n", idx)
		rows.Close()
	}

	return
}
