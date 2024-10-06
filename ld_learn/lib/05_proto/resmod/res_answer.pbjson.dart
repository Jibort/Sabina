//
//  Generated code. Do not modify.
//  source: resmod/res_answer.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use resAnswerDescriptor instead')
const ResAnswer$json = {
  '1': 'ResAnswer',
  '2': [
    {'1': 'base_entity', '3': 1, '4': 1, '5': 11, '6': '.proto.ModelEntity', '10': 'baseEntity'},
    {'1': 'test', '3': 2, '4': 1, '5': 11, '6': '.proto.ResPatientTest', '10': 'test'},
    {'1': 'question', '3': 3, '4': 1, '5': 11, '6': '.proto.TstQuestion', '10': 'question'},
    {'1': 'answer', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'answer', '17': true},
    {'1': 'option', '3': 5, '4': 1, '5': 11, '6': '.proto.LstOptionEntry', '9': 1, '10': 'option', '17': true},
    {'1': 'emotion', '3': 6, '4': 1, '5': 11, '6': '.proto.EmoEmotion', '9': 2, '10': 'emotion', '17': true},
    {'1': 'mood', '3': 7, '4': 1, '5': 11, '6': '.proto.EmoMood', '9': 3, '10': 'mood', '17': true},
    {'1': 'completed_at', '3': 8, '4': 1, '5': 11, '6': '.proto.Timestamp', '9': 4, '10': 'completedAt', '17': true},
    {'1': 'evaluated_by', '3': 9, '4': 1, '5': 11, '6': '.proto.UsrUser', '9': 5, '10': 'evaluatedBy', '17': true},
    {'1': 'evaluated_at', '3': 10, '4': 1, '5': 11, '6': '.proto.Timestamp', '9': 6, '10': 'evaluatedAt', '17': true},
    {'1': 'evaluation', '3': 11, '4': 1, '5': 9, '9': 7, '10': 'evaluation', '17': true},
  ],
  '8': [
    {'1': '_answer'},
    {'1': '_option'},
    {'1': '_emotion'},
    {'1': '_mood'},
    {'1': '_completed_at'},
    {'1': '_evaluated_by'},
    {'1': '_evaluated_at'},
    {'1': '_evaluation'},
  ],
};

/// Descriptor for `ResAnswer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resAnswerDescriptor = $convert.base64Decode(
    'CglSZXNBbnN3ZXISMwoLYmFzZV9lbnRpdHkYASABKAsyEi5wcm90by5Nb2RlbEVudGl0eVIKYm'
    'FzZUVudGl0eRIpCgR0ZXN0GAIgASgLMhUucHJvdG8uUmVzUGF0aWVudFRlc3RSBHRlc3QSLgoI'
    'cXVlc3Rpb24YAyABKAsyEi5wcm90by5Uc3RRdWVzdGlvblIIcXVlc3Rpb24SGwoGYW5zd2VyGA'
    'QgASgJSABSBmFuc3dlcogBARIyCgZvcHRpb24YBSABKAsyFS5wcm90by5Mc3RPcHRpb25FbnRy'
    'eUgBUgZvcHRpb26IAQESMAoHZW1vdGlvbhgGIAEoCzIRLnByb3RvLkVtb0Vtb3Rpb25IAlIHZW'
    '1vdGlvbogBARInCgRtb29kGAcgASgLMg4ucHJvdG8uRW1vTW9vZEgDUgRtb29kiAEBEjgKDGNv'
    'bXBsZXRlZF9hdBgIIAEoCzIQLnByb3RvLlRpbWVzdGFtcEgEUgtjb21wbGV0ZWRBdIgBARI2Cg'
    'xldmFsdWF0ZWRfYnkYCSABKAsyDi5wcm90by5Vc3JVc2VySAVSC2V2YWx1YXRlZEJ5iAEBEjgK'
    'DGV2YWx1YXRlZF9hdBgKIAEoCzIQLnByb3RvLlRpbWVzdGFtcEgGUgtldmFsdWF0ZWRBdIgBAR'
    'IjCgpldmFsdWF0aW9uGAsgASgJSAdSCmV2YWx1YXRpb26IAQFCCQoHX2Fuc3dlckIJCgdfb3B0'
    'aW9uQgoKCF9lbW90aW9uQgcKBV9tb29kQg8KDV9jb21wbGV0ZWRfYXRCDwoNX2V2YWx1YXRlZF'
    '9ieUIPCg1fZXZhbHVhdGVkX2F0Qg0KC19ldmFsdWF0aW9u');

