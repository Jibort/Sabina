package base

type LstListCategory struct {
	Entity         GoBaseEntity     `gorm:"-"`
	NameKey        LocTextKey       `gorm:"not null;foreignKey:ID"`
	DescriptionKey *LocTextKey      `gorm:"foreignKey:ID"`
	Parent         *LstListCategory `gorm:"foreignKey:ID"`
}

var _ = (*LstListCategory).version(nil)

func (*LstListCategory) version() *Version {
	return NewVersion(0, 7, 0)
}
