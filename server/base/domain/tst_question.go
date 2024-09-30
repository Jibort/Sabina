// Fitxer de definició d'una pregunta de test d'avaluació.
// createdAt: 24/09/26 dj. JIQ

package domain

import (
	tools "sabina/base/domain/tools"
)

type TstQuestionType int

const (
	test_question_type_unspecified TstQuestionType = 0
	test_question_type_plain_text  TstQuestionType = 1
	test_question_type_boolean     TstQuestionType = 2
	test_question_type_option_list TstQuestionType = 3
	test_question_type_emotion     TstQuestionType = 4
	test_question_type_mood        TstQuestionType = 5
	test_question_type_date        TstQuestionType = 6
	test_question_type_date_time   TstQuestionType = 7
)

type TstQuestion struct {
	Entity BaseEntity
	GoProto
	GoSQL
	test          TstTest
	question_type TstQuestionType
	block         *TstQuestion
	question_key  string
	help_key      *string
	mandatory     bool
	customized    bool
}

const testQuestionTableName = "QUESTION"

var _ = (*TstQuestion).version(nil)

func (*TstQuestion) version() *tools.Version {
	return tools.NewVersion(0, 7, 2)
}
