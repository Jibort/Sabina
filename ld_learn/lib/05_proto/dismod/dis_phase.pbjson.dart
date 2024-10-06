//
//  Generated code. Do not modify.
//  source: dismod/dis_phase.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use disPhaseDescriptor instead')
const DisPhase$json = {
  '1': 'DisPhase',
  '2': [
    {'1': 'base_entity', '3': 1, '4': 1, '5': 11, '6': '.proto.ModelEntity', '10': 'baseEntity'},
    {'1': 'idx', '3': 2, '4': 1, '5': 5, '10': 'idx'},
    {'1': 'name_key', '3': 3, '4': 1, '5': 9, '10': 'nameKey'},
    {'1': 'desc_key', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'descKey', '17': true},
    {'1': 'disease', '3': 4, '4': 1, '5': 11, '6': '.proto.DisDisease', '10': 'disease'},
  ],
  '8': [
    {'1': '_desc_key'},
  ],
};

/// Descriptor for `DisPhase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disPhaseDescriptor = $convert.base64Decode(
    'CghEaXNQaGFzZRIzCgtiYXNlX2VudGl0eRgBIAEoCzISLnByb3RvLk1vZGVsRW50aXR5UgpiYX'
    'NlRW50aXR5EhAKA2lkeBgCIAEoBVIDaWR4EhkKCG5hbWVfa2V5GAMgASgJUgduYW1lS2V5Eh4K'
    'CGRlc2Nfa2V5GAUgASgJSABSB2Rlc2NLZXmIAQESKwoHZGlzZWFzZRgEIAEoCzIRLnByb3RvLk'
    'Rpc0Rpc2Vhc2VSB2Rpc2Vhc2VCCwoJX2Rlc2Nfa2V5');

