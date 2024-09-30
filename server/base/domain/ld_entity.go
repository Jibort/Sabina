package domain

import (
	sql "database/sql"
	tools "sabina/base/domain/tools"
)

type LdEntityState int

const (
	EntityNull LdEntityState = iota
	EntityNew
	EntityToUpdate
	EntityToDelete
	EntityUpdated
	EntityDeleted
	EntityError
)

type LdEntity interface {
	byProto(pProto any) error
	ToProto() (any, error)
	EntityState() LdEntityState
	SetEntityState(pState LdEntityState)
	EntityVersion() tools.Version
	Scan(pRows *sql.Rows) error
	CreateSQL() (string, []any)
	UpdateSQL() (string, []any)
	DeleteSQL() (string, []any)
	FindSQL(pId int32) (string, []any)
}
