package base

type LdDomainState int

const (
	DomainNull LdDomainState = iota
	DomainError
)

type LdDomain interface {
}
