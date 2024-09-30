// Fitxer de definició de cada resposta dels pacients a les preguntes dels test d'avaluació.
// createdAt: 24/09/27 dv. JIQ

package domain

import (
	tools "sabina/base/domain/tools"
	dt "time"
)

// Definició de cada resposta dels pacients a les preguntes dels test d'avaluació.
type ResAnswer struct {
	Entity BaseEntity
	GoProto
	GoSQL
	patient_test ResPatientTest `gorm:"foreignkey:patient_test"`
	question     TstQuestion
	answer       *string
	option_entry *LstOptionEntry
	Emotion      *EmoEmotion
	Mood         *EmoMood
	completed_at *dt.Time
	evaluated_by *UsrUser
	evaluated_at *dt.Time
	evaluation   *string
}

const AnswerTableName = "ANSWER"

var _ = (*ResAnswer).version(nil)

func (*ResAnswer) version() *tools.Version {
	return tools.NewVersion(0, 7, 2)
}
