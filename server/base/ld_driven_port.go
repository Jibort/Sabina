package base

type LdDomainDrivenPort[D LdEntity] interface {
	CreateDomainInst(pInst *D) error
	UpdateDomainInst(pInst *D) error
	DeleteDomainInst(pInst *D) error
	FindDomainInstById(pId int32) (*D, error)
	QueryDomainInsts(pQuery string, pArgs ...any) ([]D, error)
}
