// Fitxer de definició d'un test d'avaluació.
// createdAt: 24/09/26 dj. JIQ

package domain

import (
	tools "sabina/base/domain/tools"
)

type TstTest struct {
	Entity BaseEntity
	GoProto
	GoSQL
	category  TstTestCategory
	name_key  string
	desc_key  *string
	instr_key string
	vers      uint32
	root      *TstTest
	therapist UsrUser
}

const testTableName = "TEST"

var _ = (*TstTest).version(nil)

func (*TstTest) version() *tools.Version {
	return tools.NewVersion(0, 7, 2)
}
