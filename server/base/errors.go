package base

import "fmt"

// mariadb_service.go -----------------
func ErrorUnkwnowDbConnError() error {
	return fmt.Errorf("estat de connexió a base de dades desconegut")
}

func ErrorInterfaceMethodNotCallable(pMeth string) error {
	return fmt.Errorf("no es pot cridar a aquest mètode: %s", pMeth)
}

func ErrorUpdateDeleteInstWithoutId(pTable string) error {
	return fmt.Errorf("no es pot nodificar/eliminar un registre de %s sense Id", pTable)
}

func ErrorNullRow(pMethod string) error {
	return fmt.Errorf("el row SQL dins '%s' es nul", pMethod)
}

func ErrorNullId(pMethod string) error {
	return fmt.Errorf("null Id en '%s'", pMethod)
}

func ErrorInstanceForIdNotFound(pMethod string, pId any, pErr error) error {
	if pErr == nil {
		return fmt.Errorf("%s: no s'ha pogut trobar la instància amb id '%v'", pMethod, pId)
	} else {
		return fmt.Errorf("%s: no s'ha pogut trobar la instància amb id '%v'\n%s", pMethod, pId, pErr)

	}
}
