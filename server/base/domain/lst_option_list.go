package domain

import (
	tools "sabina/base/domain/tools"
)

type LstOptionList struct {
	Entity         BaseEntity
	NameKey        LocTextKey
	DescriptionKey *LocTextKey
	Category       LstListCategory
	IsAlpha        bool
}

var _ = (*LstOptionList).version(nil)

func (*LstOptionList) version() *tools.Version {
	return tools.NewVersion(0, 7, 0)
}
