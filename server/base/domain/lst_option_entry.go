package domain

import (
	tools "sabina/base/domain/tools"
)

type LstOptionEntry struct {
	Entity    BaseEntity
	List      LstOptionList
	Index     uint
	OptionKey string
	DescKey   *string
}

var _ = (*LstOptionEntry).version(nil)

func (*LstOptionEntry) version() *tools.Version {
	return tools.NewVersion(0, 7, 0)
}
