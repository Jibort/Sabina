//
//  Generated code. Do not modify.
//  source: tstmod/tst_question.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Tipus de pregunta de tests d'avaluació.
class TstTestQuestionType extends $pb.ProtobufEnum {
  static const TstTestQuestionType TST_TEST_QUESTION_TYPE_UNSPECIFIED = TstTestQuestionType._(0, _omitEnumNames ? '' : 'TST_TEST_QUESTION_TYPE_UNSPECIFIED');
  static const TstTestQuestionType TST_TEST_QUESTION_TYPE_PLAIN_TEXT = TstTestQuestionType._(1, _omitEnumNames ? '' : 'TST_TEST_QUESTION_TYPE_PLAIN_TEXT');
  static const TstTestQuestionType TST_TEST_QUESTION_TYPE_BOOLEAN = TstTestQuestionType._(2, _omitEnumNames ? '' : 'TST_TEST_QUESTION_TYPE_BOOLEAN');
  static const TstTestQuestionType TST_TEST_QUESTION_TYPE_OPTION_LIST = TstTestQuestionType._(4, _omitEnumNames ? '' : 'TST_TEST_QUESTION_TYPE_OPTION_LIST');
  static const TstTestQuestionType TST_TEST_QUESTION_TYPE_EMOTION = TstTestQuestionType._(5, _omitEnumNames ? '' : 'TST_TEST_QUESTION_TYPE_EMOTION');
  static const TstTestQuestionType TST_TEST_QUESTION_TYPE_MOOD = TstTestQuestionType._(6, _omitEnumNames ? '' : 'TST_TEST_QUESTION_TYPE_MOOD');
  static const TstTestQuestionType TST_TEST_QUESTION_TYPE_DATE = TstTestQuestionType._(7, _omitEnumNames ? '' : 'TST_TEST_QUESTION_TYPE_DATE');
  static const TstTestQuestionType TST_TEST_QUESTION_TYPE_DATE_TIME = TstTestQuestionType._(8, _omitEnumNames ? '' : 'TST_TEST_QUESTION_TYPE_DATE_TIME');

  static const $core.List<TstTestQuestionType> values = <TstTestQuestionType> [
    TST_TEST_QUESTION_TYPE_UNSPECIFIED,
    TST_TEST_QUESTION_TYPE_PLAIN_TEXT,
    TST_TEST_QUESTION_TYPE_BOOLEAN,
    TST_TEST_QUESTION_TYPE_OPTION_LIST,
    TST_TEST_QUESTION_TYPE_EMOTION,
    TST_TEST_QUESTION_TYPE_MOOD,
    TST_TEST_QUESTION_TYPE_DATE,
    TST_TEST_QUESTION_TYPE_DATE_TIME,
  ];

  static final $core.Map<$core.int, TstTestQuestionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TstTestQuestionType? valueOf($core.int value) => _byValue[value];

  const TstTestQuestionType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
