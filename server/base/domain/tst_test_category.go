// Fitxer de definició proto de les categories dels tests.
// createdAt: 24/09/26 dj. JIQ

package domain

import (
	tools "sabina/base/domain/tools"
)

type TstTestCategory struct {
	Entity BaseEntity
	GoProto
	GoSQL
	title_key string
	desc_key  *string
	parent    *TstTestCategory
}

const testCategoryTableName = "TEST_CATEGORY"

var _ = (*UsrDevice).version(nil)

func (*UsrDevice) version() *tools.Version {
	return tools.NewVersion(0, 7, 0)
}
