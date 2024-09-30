// Fitxer de definició de la resposta dels pacients als test d'avaluació.
// createdAt: 24/09/26 dj. JIQ

package domain

import (
	tools "sabina/base/domain/tools"
	dt "time"
)

// Definició de la resposta dels pacients als test d'avaluació.
type ResPatientTest struct {
	Entity BaseEntity
	GoProto
	GoSQL
	test         TstTest
	therapist    UsrUser
	patient      UsrUser
	assigned_at  dt.Time
	completed_at *dt.Time
	evaluated_by *UsrUser
	evaluated_at *dt.Time
	evaluation   *string
}

const PatientTestTableName = "PATIENT_TEST"

var _ = (*ResPatientTest).version(nil)

func (*ResPatientTest) version() *tools.Version {
	return tools.NewVersion(0, 7, 2)
}
