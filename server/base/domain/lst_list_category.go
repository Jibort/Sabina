// Fitxer de definició proto per l'entitat LstListCategory.
// createdAt: 24/09/23 dl. JIQ

package domain

import (
	tools "sabina/base/domain/tools"
)

type LstListCategory struct {
	Entity         BaseEntity       `gorm:"-"`
	NameKey        LocTextKey       `gorm:"not null;foreignKey:ID"`
	DescriptionKey *LocTextKey      `gorm:"foreignKey:ID"`
	Parent         *LstListCategory `gorm:"foreignKey:ID"`
}

var _ = (*LstListCategory).version(nil)

func (*LstListCategory) version() *tools.Version {
	return tools.NewVersion(0, 7, 0)
}
