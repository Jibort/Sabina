//
//  Generated code. Do not modify.
//  source: usrmod/usr_device.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use usrDeviceTypeDescriptor instead')
const UsrDeviceType$json = {
  '1': 'UsrDeviceType',
  '2': [
    {'1': 'USR_DEVICE_TYPE_DEVICE_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'USR_DEVICE_TYPE_ANDROID_MOBILE', '2': 1},
    {'1': 'USR_DEVICE_TYPE_ANDROID_TABLET', '2': 2},
    {'1': 'USR_DEVICE_TYPE_IOS_MOBILE', '2': 3},
    {'1': 'USR_DEVICE_TYPE_IOS_TABLET', '2': 4},
    {'1': 'USR_DEVICE_TYPE_WINDOWS', '2': 5},
    {'1': 'USR_DEVICE_TYPE_MACOS', '2': 6},
    {'1': 'USR_DEVICE_TYPE_LINUX', '2': 7},
  ],
};

/// Descriptor for `UsrDeviceType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List usrDeviceTypeDescriptor = $convert.base64Decode(
    'Cg1Vc3JEZXZpY2VUeXBlEisKJ1VTUl9ERVZJQ0VfVFlQRV9ERVZJQ0VfVFlQRV9VTlNQRUNJRk'
    'lFRBAAEiIKHlVTUl9ERVZJQ0VfVFlQRV9BTkRST0lEX01PQklMRRABEiIKHlVTUl9ERVZJQ0Vf'
    'VFlQRV9BTkRST0lEX1RBQkxFVBACEh4KGlVTUl9ERVZJQ0VfVFlQRV9JT1NfTU9CSUxFEAMSHg'
    'oaVVNSX0RFVklDRV9UWVBFX0lPU19UQUJMRVQQBBIbChdVU1JfREVWSUNFX1RZUEVfV0lORE9X'
    'UxAFEhkKFVVTUl9ERVZJQ0VfVFlQRV9NQUNPUxAGEhkKFVVTUl9ERVZJQ0VfVFlQRV9MSU5VWB'
    'AH');

@$core.Deprecated('Use usrDeviceStateDescriptor instead')
const UsrDeviceState$json = {
  '1': 'UsrDeviceState',
  '2': [
    {'1': 'USR_DEVICE_STATE_UNSPECIFIED', '2': 0},
    {'1': 'USR_DEVICE_STATE_ENABLED', '2': 1},
    {'1': 'USR_DEVICE_STATE_DISABLED', '2': 2},
  ],
};

/// Descriptor for `UsrDeviceState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List usrDeviceStateDescriptor = $convert.base64Decode(
    'Cg5Vc3JEZXZpY2VTdGF0ZRIgChxVU1JfREVWSUNFX1NUQVRFX1VOU1BFQ0lGSUVEEAASHAoYVV'
    'NSX0RFVklDRV9TVEFURV9FTkFCTEVEEAESHQoZVVNSX0RFVklDRV9TVEFURV9ESVNBQkxFRBAC');

@$core.Deprecated('Use usrDeviceDescriptor instead')
const UsrDevice$json = {
  '1': 'UsrDevice',
  '2': [
    {'1': 'base_entity', '3': 1, '4': 1, '5': 11, '6': '.proto.ModelEntity', '10': 'baseEntity'},
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.proto.UsrDeviceType', '10': 'type'},
    {'1': 'state', '3': 3, '4': 1, '5': 14, '6': '.proto.UsrDeviceState', '10': 'state'},
    {'1': 'desc', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'desc', '17': true},
    {'1': 'token', '3': 5, '4': 1, '5': 9, '10': 'token'},
    {'1': 'owner', '3': 6, '4': 1, '5': 13, '10': 'owner'},
  ],
  '8': [
    {'1': '_desc'},
  ],
};

/// Descriptor for `UsrDevice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usrDeviceDescriptor = $convert.base64Decode(
    'CglVc3JEZXZpY2USMwoLYmFzZV9lbnRpdHkYASABKAsyEi5wcm90by5Nb2RlbEVudGl0eVIKYm'
    'FzZUVudGl0eRIoCgR0eXBlGAIgASgOMhQucHJvdG8uVXNyRGV2aWNlVHlwZVIEdHlwZRIrCgVz'
    'dGF0ZRgDIAEoDjIVLnByb3RvLlVzckRldmljZVN0YXRlUgVzdGF0ZRIXCgRkZXNjGAQgASgJSA'
    'BSBGRlc2OIAQESFAoFdG9rZW4YBSABKAlSBXRva2VuEhQKBW93bmVyGAYgASgNUgVvd25lckIH'
    'CgVfZGVzYw==');

@$core.Deprecated('Use usrDevicesListDescriptor instead')
const UsrDevicesList$json = {
  '1': 'UsrDevicesList',
  '2': [
    {'1': 'elms', '3': 1, '4': 3, '5': 11, '6': '.proto.UsrDevice', '10': 'elms'},
  ],
};

/// Descriptor for `UsrDevicesList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usrDevicesListDescriptor = $convert.base64Decode(
    'Cg5Vc3JEZXZpY2VzTGlzdBIkCgRlbG1zGAEgAygLMhAucHJvdG8uVXNyRGV2aWNlUgRlbG1z');

