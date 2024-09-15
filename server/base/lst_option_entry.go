package base

type LstOptionEntry struct {
	Entity  GoBaseEntity
	List    LstOptionList
	Index   uint
	Option  LocTextKey
	DescKey *LocTextKey
}

var _ = (*LstOptionEntry).version(nil)

func (*LstOptionEntry) version() *Version {
	return NewVersion(0, 7, 0)
}
