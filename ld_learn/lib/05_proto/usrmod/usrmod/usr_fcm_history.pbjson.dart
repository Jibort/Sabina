//
//  Generated code. Do not modify.
//  source: usrmod/usr_fcm_history.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use usrFcmHistoryDescriptor instead')
const UsrFcmHistory$json = {
  '1': 'UsrFcmHistory',
  '2': [
    {'1': 'base_entity', '3': 1, '4': 1, '5': 11, '6': '.proto.ModelEntity', '10': 'baseEntity'},
    {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
    {'1': 'device', '3': 3, '4': 1, '5': 11, '6': '.proto.UsrDevice', '10': 'device'},
    {'1': 'since', '3': 4, '4': 1, '5': 11, '6': '.proto.Timestamp', '9': 0, '10': 'since', '17': true},
    {'1': 'last_one', '3': 5, '4': 1, '5': 8, '10': 'lastOne'},
  ],
  '8': [
    {'1': '_since'},
  ],
};

/// Descriptor for `UsrFcmHistory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usrFcmHistoryDescriptor = $convert.base64Decode(
    'Cg1Vc3JGY21IaXN0b3J5EjMKC2Jhc2VfZW50aXR5GAEgASgLMhIucHJvdG8uTW9kZWxFbnRpdH'
    'lSCmJhc2VFbnRpdHkSFAoFdG9rZW4YAiABKAlSBXRva2VuEigKBmRldmljZRgDIAEoCzIQLnBy'
    'b3RvLlVzckRldmljZVIGZGV2aWNlEisKBXNpbmNlGAQgASgLMhAucHJvdG8uVGltZXN0YW1wSA'
    'BSBXNpbmNliAEBEhkKCGxhc3Rfb25lGAUgASgIUgdsYXN0T25lQggKBl9zaW5jZQ==');

@$core.Deprecated('Use usrFcmTokenaListDescriptor instead')
const UsrFcmTokenaList$json = {
  '1': 'UsrFcmTokenaList',
  '2': [
    {'1': 'elms', '3': 1, '4': 3, '5': 11, '6': '.proto.UsrFcmHistory', '10': 'elms'},
  ],
};

/// Descriptor for `UsrFcmTokenaList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usrFcmTokenaListDescriptor = $convert.base64Decode(
    'ChBVc3JGY21Ub2tlbmFMaXN0EigKBGVsbXMYASADKAsyFC5wcm90by5Vc3JGY21IaXN0b3J5Ug'
    'RlbG1z');

