//
//  Generated code. Do not modify.
//  source: model_entity.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use modelEntityDescriptor instead')
const ModelEntity$json = {
  '1': 'ModelEntity',
  '2': [
    {'1': 'local_id', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'localId', '17': true},
    {'1': 'id', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'id', '17': true},
    {'1': 'created_by', '3': 3, '4': 1, '5': 13, '10': 'createdBy'},
    {'1': 'created_at', '3': 4, '4': 1, '5': 11, '6': '.proto.Timestamp', '10': 'createdAt'},
    {'1': 'updated_by', '3': 5, '4': 1, '5': 13, '9': 2, '10': 'updatedBy', '17': true},
    {'1': 'updated_at', '3': 6, '4': 1, '5': 11, '6': '.proto.Timestamp', '9': 3, '10': 'updatedAt', '17': true},
    {'1': 'is_new', '3': 7, '4': 1, '5': 8, '10': 'isNew'},
    {'1': 'is_updated', '3': 8, '4': 1, '5': 8, '10': 'isUpdated'},
    {'1': 'is_deleted', '3': 9, '4': 1, '5': 8, '10': 'isDeleted'},
  ],
  '8': [
    {'1': '_local_id'},
    {'1': '_id'},
    {'1': '_updated_by'},
    {'1': '_updated_at'},
  ],
};

/// Descriptor for `ModelEntity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List modelEntityDescriptor = $convert.base64Decode(
    'CgtNb2RlbEVudGl0eRIeCghsb2NhbF9pZBgBIAEoDUgAUgdsb2NhbElkiAEBEhMKAmlkGAIgAS'
    'gNSAFSAmlkiAEBEh0KCmNyZWF0ZWRfYnkYAyABKA1SCWNyZWF0ZWRCeRIvCgpjcmVhdGVkX2F0'
    'GAQgASgLMhAucHJvdG8uVGltZXN0YW1wUgljcmVhdGVkQXQSIgoKdXBkYXRlZF9ieRgFIAEoDU'
    'gCUgl1cGRhdGVkQnmIAQESNAoKdXBkYXRlZF9hdBgGIAEoCzIQLnByb3RvLlRpbWVzdGFtcEgD'
    'Ugl1cGRhdGVkQXSIAQESFQoGaXNfbmV3GAcgASgIUgVpc05ldxIdCgppc191cGRhdGVkGAggAS'
    'gIUglpc1VwZGF0ZWQSHQoKaXNfZGVsZXRlZBgJIAEoCFIJaXNEZWxldGVkQgsKCV9sb2NhbF9p'
    'ZEIFCgNfaWRCDQoLX3VwZGF0ZWRfYnlCDQoLX3VwZGF0ZWRfYXQ=');

