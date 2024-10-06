//
//  Generated code. Do not modify.
//  source: tstmod/tst_question.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use tstTestQuestionTypeDescriptor instead')
const TstTestQuestionType$json = {
  '1': 'TstTestQuestionType',
  '2': [
    {'1': 'TST_TEST_QUESTION_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'TST_TEST_QUESTION_TYPE_PLAIN_TEXT', '2': 1},
    {'1': 'TST_TEST_QUESTION_TYPE_BOOLEAN', '2': 2},
    {'1': 'TST_TEST_QUESTION_TYPE_OPTION_LIST', '2': 4},
    {'1': 'TST_TEST_QUESTION_TYPE_EMOTION', '2': 5},
    {'1': 'TST_TEST_QUESTION_TYPE_MOOD', '2': 6},
    {'1': 'TST_TEST_QUESTION_TYPE_DATE', '2': 7},
    {'1': 'TST_TEST_QUESTION_TYPE_DATE_TIME', '2': 8},
  ],
};

/// Descriptor for `TstTestQuestionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List tstTestQuestionTypeDescriptor = $convert.base64Decode(
    'ChNUc3RUZXN0UXVlc3Rpb25UeXBlEiYKIlRTVF9URVNUX1FVRVNUSU9OX1RZUEVfVU5TUEVDSU'
    'ZJRUQQABIlCiFUU1RfVEVTVF9RVUVTVElPTl9UWVBFX1BMQUlOX1RFWFQQARIiCh5UU1RfVEVT'
    'VF9RVUVTVElPTl9UWVBFX0JPT0xFQU4QAhImCiJUU1RfVEVTVF9RVUVTVElPTl9UWVBFX09QVE'
    'lPTl9MSVNUEAQSIgoeVFNUX1RFU1RfUVVFU1RJT05fVFlQRV9FTU9USU9OEAUSHwobVFNUX1RF'
    'U1RfUVVFU1RJT05fVFlQRV9NT09EEAYSHwobVFNUX1RFU1RfUVVFU1RJT05fVFlQRV9EQVRFEA'
    'cSJAogVFNUX1RFU1RfUVVFU1RJT05fVFlQRV9EQVRFX1RJTUUQCA==');

@$core.Deprecated('Use tstQuestionDescriptor instead')
const TstQuestion$json = {
  '1': 'TstQuestion',
  '2': [
    {'1': 'base_entity', '3': 1, '4': 1, '5': 11, '6': '.proto.ModelEntity', '10': 'baseEntity'},
    {'1': 'test', '3': 2, '4': 1, '5': 11, '6': '.proto.TstTest', '10': 'test'},
    {'1': 'test_question_type', '3': 3, '4': 1, '5': 14, '6': '.proto.TstTestQuestionType', '10': 'testQuestionType'},
    {'1': 'block', '3': 4, '4': 1, '5': 11, '6': '.proto.TstQuestion', '9': 0, '10': 'block', '17': true},
    {'1': 'question', '3': 5, '4': 1, '5': 9, '10': 'question'},
    {'1': 'help', '3': 6, '4': 1, '5': 9, '9': 1, '10': 'help', '17': true},
    {'1': 'mandatory', '3': 7, '4': 1, '5': 8, '10': 'mandatory'},
    {'1': 'custom', '3': 8, '4': 1, '5': 8, '10': 'custom'},
  ],
  '8': [
    {'1': '_block'},
    {'1': '_help'},
  ],
};

/// Descriptor for `TstQuestion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tstQuestionDescriptor = $convert.base64Decode(
    'CgtUc3RRdWVzdGlvbhIzCgtiYXNlX2VudGl0eRgBIAEoCzISLnByb3RvLk1vZGVsRW50aXR5Ug'
    'piYXNlRW50aXR5EiIKBHRlc3QYAiABKAsyDi5wcm90by5Uc3RUZXN0UgR0ZXN0EkgKEnRlc3Rf'
    'cXVlc3Rpb25fdHlwZRgDIAEoDjIaLnByb3RvLlRzdFRlc3RRdWVzdGlvblR5cGVSEHRlc3RRdW'
    'VzdGlvblR5cGUSLQoFYmxvY2sYBCABKAsyEi5wcm90by5Uc3RRdWVzdGlvbkgAUgVibG9ja4gB'
    'ARIaCghxdWVzdGlvbhgFIAEoCVIIcXVlc3Rpb24SFwoEaGVscBgGIAEoCUgBUgRoZWxwiAEBEh'
    'wKCW1hbmRhdG9yeRgHIAEoCFIJbWFuZGF0b3J5EhYKBmN1c3RvbRgIIAEoCFIGY3VzdG9tQggK'
    'Bl9ibG9ja0IHCgVfaGVscA==');

