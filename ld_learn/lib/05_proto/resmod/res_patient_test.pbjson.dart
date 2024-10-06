//
//  Generated code. Do not modify.
//  source: resmod/res_patient_test.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use resPatientTestDescriptor instead')
const ResPatientTest$json = {
  '1': 'ResPatientTest',
  '2': [
    {'1': 'base_entity', '3': 1, '4': 1, '5': 11, '6': '.proto.ModelEntity', '10': 'baseEntity'},
    {'1': 'test', '3': 2, '4': 1, '5': 11, '6': '.proto.TstTest', '10': 'test'},
    {'1': 'therapist', '3': 3, '4': 1, '5': 11, '6': '.proto.UsrUser', '10': 'therapist'},
    {'1': 'patient', '3': 4, '4': 1, '5': 11, '6': '.proto.UsrUser', '10': 'patient'},
    {'1': 'assigned_at', '3': 5, '4': 1, '5': 11, '6': '.proto.Timestamp', '10': 'assignedAt'},
    {'1': 'completed_at', '3': 6, '4': 1, '5': 11, '6': '.proto.Timestamp', '9': 0, '10': 'completedAt', '17': true},
    {'1': 'evaluated_by', '3': 7, '4': 1, '5': 11, '6': '.proto.UsrUser', '9': 1, '10': 'evaluatedBy', '17': true},
    {'1': 'evaluated_at', '3': 8, '4': 1, '5': 11, '6': '.proto.Timestamp', '9': 2, '10': 'evaluatedAt', '17': true},
    {'1': 'evaluation', '3': 9, '4': 1, '5': 9, '9': 3, '10': 'evaluation', '17': true},
  ],
  '8': [
    {'1': '_completed_at'},
    {'1': '_evaluated_by'},
    {'1': '_evaluated_at'},
    {'1': '_evaluation'},
  ],
};

/// Descriptor for `ResPatientTest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resPatientTestDescriptor = $convert.base64Decode(
    'Cg5SZXNQYXRpZW50VGVzdBIzCgtiYXNlX2VudGl0eRgBIAEoCzISLnByb3RvLk1vZGVsRW50aX'
    'R5UgpiYXNlRW50aXR5EiIKBHRlc3QYAiABKAsyDi5wcm90by5Uc3RUZXN0UgR0ZXN0EiwKCXRo'
    'ZXJhcGlzdBgDIAEoCzIOLnByb3RvLlVzclVzZXJSCXRoZXJhcGlzdBIoCgdwYXRpZW50GAQgAS'
    'gLMg4ucHJvdG8uVXNyVXNlclIHcGF0aWVudBIxCgthc3NpZ25lZF9hdBgFIAEoCzIQLnByb3Rv'
    'LlRpbWVzdGFtcFIKYXNzaWduZWRBdBI4Cgxjb21wbGV0ZWRfYXQYBiABKAsyEC5wcm90by5UaW'
    '1lc3RhbXBIAFILY29tcGxldGVkQXSIAQESNgoMZXZhbHVhdGVkX2J5GAcgASgLMg4ucHJvdG8u'
    'VXNyVXNlckgBUgtldmFsdWF0ZWRCeYgBARI4CgxldmFsdWF0ZWRfYXQYCCABKAsyEC5wcm90by'
    '5UaW1lc3RhbXBIAlILZXZhbHVhdGVkQXSIAQESIwoKZXZhbHVhdGlvbhgJIAEoCUgDUgpldmFs'
    'dWF0aW9uiAEBQg8KDV9jb21wbGV0ZWRfYXRCDwoNX2V2YWx1YXRlZF9ieUIPCg1fZXZhbHVhdG'
    'VkX2F0Qg0KC19ldmFsdWF0aW9u');

