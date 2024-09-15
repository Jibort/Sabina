package base

type LstOptionList struct {
	Entity         GoBaseEntity    `gorm:"-"`
	NameKey        LocTextKey      `gorm:"not null;foreignKey:ID"`
	DescriptionKey *LocTextKey     `gorm:"foreignKey:ID"`
	Category       LstListCategory `gorm:"foreignKey:ID"`
	IsAlpha        bool            `gorm:"not null;default:false"`
}

var _ = (*LstOptionList).version(nil)

func (*LstOptionList) version() *Version {
	return NewVersion(0, 7, 0)
}
