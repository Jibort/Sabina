package base

type LdUseCase[D LdEntity] interface {
	UseCaseName() string
	UseCaseVersion() Version
	UseCaseDomain() *D
}
