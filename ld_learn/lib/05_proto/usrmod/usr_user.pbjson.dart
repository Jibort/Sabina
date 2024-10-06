//
//  Generated code. Do not modify.
//  source: usrmod/usr_user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use usrUserTypeDescriptor instead')
const UsrUserType$json = {
  '1': 'UsrUserType',
  '2': [
    {'1': 'USR_USER_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'USR_USER_TYPE_ROOT', '2': 1},
    {'1': 'USR_USER_TYPE_ADMIN', '2': 2},
    {'1': 'USR_USER_TYPE_PATIENT', '2': 3},
    {'1': 'USR_USER_TYPE_THERAPIST', '2': 4},
  ],
};

/// Descriptor for `UsrUserType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List usrUserTypeDescriptor = $convert.base64Decode(
    'CgtVc3JVc2VyVHlwZRIdChlVU1JfVVNFUl9UWVBFX1VOU1BFQ0lGSUVEEAASFgoSVVNSX1VTRV'
    'JfVFlQRV9ST09UEAESFwoTVVNSX1VTRVJfVFlQRV9BRE1JThACEhkKFVVTUl9VU0VSX1RZUEVf'
    'UEFUSUVOVBADEhsKF1VTUl9VU0VSX1RZUEVfVEhFUkFQSVNUEAQ=');

@$core.Deprecated('Use usrUserStateDescriptor instead')
const UsrUserState$json = {
  '1': 'UsrUserState',
  '2': [
    {'1': 'USR_USER_STATE_USER_UNSPECIFIED', '2': 0},
    {'1': 'USR_USER_STATE_USER_BUILDING', '2': 1},
    {'1': 'USR_USER_STATE_USER_ACTIVE', '2': 2},
    {'1': 'USR_USER_STATE_USER_LOCKED', '2': 3},
  ],
};

/// Descriptor for `UsrUserState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List usrUserStateDescriptor = $convert.base64Decode(
    'CgxVc3JVc2VyU3RhdGUSIwofVVNSX1VTRVJfU1RBVEVfVVNFUl9VTlNQRUNJRklFRBAAEiAKHF'
    'VTUl9VU0VSX1NUQVRFX1VTRVJfQlVJTERJTkcQARIeChpVU1JfVVNFUl9TVEFURV9VU0VSX0FD'
    'VElWRRACEh4KGlVTUl9VU0VSX1NUQVRFX1VTRVJfTE9DS0VEEAM=');

@$core.Deprecated('Use usrUserDescriptor instead')
const UsrUser$json = {
  '1': 'UsrUser',
  '2': [
    {'1': 'base_entity', '3': 1, '4': 1, '5': 11, '6': '.proto.ModelEntity', '10': 'baseEntity'},
    {'1': 'user_type', '3': 2, '4': 1, '5': 14, '6': '.proto.UsrUserType', '10': 'userType'},
    {'1': 'state', '3': 3, '4': 1, '5': 14, '6': '.proto.UsrUserState', '10': 'state'},
    {'1': 'permissions', '3': 4, '4': 1, '5': 4, '10': 'permissions'},
    {'1': 'alias', '3': 5, '4': 1, '5': 9, '10': 'alias'},
    {'1': 'certificate', '3': 6, '4': 1, '5': 12, '9': 0, '10': 'certificate', '17': true},
    {'1': 'birth_date', '3': 7, '4': 1, '5': 11, '6': '.proto.Timestamp', '9': 1, '10': 'birthDate', '17': true},
    {'1': 'first_key', '3': 8, '4': 1, '5': 4, '9': 2, '10': 'firstKey', '17': true},
    {'1': 'first_conn_at', '3': 9, '4': 1, '5': 11, '6': '.proto.Timestamp', '9': 3, '10': 'firstConnAt', '17': true},
    {'1': 'locale', '3': 10, '4': 1, '5': 9, '10': 'locale'},
    {'1': 'therapist_id', '3': 11, '4': 1, '5': 13, '9': 4, '10': 'therapistId', '17': true},
    {'1': 'device_id', '3': 12, '4': 1, '5': 13, '9': 5, '10': 'deviceId', '17': true},
  ],
  '8': [
    {'1': '_certificate'},
    {'1': '_birth_date'},
    {'1': '_first_key'},
    {'1': '_first_conn_at'},
    {'1': '_therapist_id'},
    {'1': '_device_id'},
  ],
};

/// Descriptor for `UsrUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usrUserDescriptor = $convert.base64Decode(
    'CgdVc3JVc2VyEjMKC2Jhc2VfZW50aXR5GAEgASgLMhIucHJvdG8uTW9kZWxFbnRpdHlSCmJhc2'
    'VFbnRpdHkSLwoJdXNlcl90eXBlGAIgASgOMhIucHJvdG8uVXNyVXNlclR5cGVSCHVzZXJUeXBl'
    'EikKBXN0YXRlGAMgASgOMhMucHJvdG8uVXNyVXNlclN0YXRlUgVzdGF0ZRIgCgtwZXJtaXNzaW'
    '9ucxgEIAEoBFILcGVybWlzc2lvbnMSFAoFYWxpYXMYBSABKAlSBWFsaWFzEiUKC2NlcnRpZmlj'
    'YXRlGAYgASgMSABSC2NlcnRpZmljYXRliAEBEjQKCmJpcnRoX2RhdGUYByABKAsyEC5wcm90by'
    '5UaW1lc3RhbXBIAVIJYmlydGhEYXRliAEBEiAKCWZpcnN0X2tleRgIIAEoBEgCUghmaXJzdEtl'
    'eYgBARI5Cg1maXJzdF9jb25uX2F0GAkgASgLMhAucHJvdG8uVGltZXN0YW1wSANSC2ZpcnN0Q2'
    '9ubkF0iAEBEhYKBmxvY2FsZRgKIAEoCVIGbG9jYWxlEiYKDHRoZXJhcGlzdF9pZBgLIAEoDUgE'
    'Ugt0aGVyYXBpc3RJZIgBARIgCglkZXZpY2VfaWQYDCABKA1IBVIIZGV2aWNlSWSIAQFCDgoMX2'
    'NlcnRpZmljYXRlQg0KC19iaXJ0aF9kYXRlQgwKCl9maXJzdF9rZXlCEAoOX2ZpcnN0X2Nvbm5f'
    'YXRCDwoNX3RoZXJhcGlzdF9pZEIMCgpfZGV2aWNlX2lk');

@$core.Deprecated('Use usrUsersListDescriptor instead')
const UsrUsersList$json = {
  '1': 'UsrUsersList',
  '2': [
    {'1': 'elms', '3': 1, '4': 3, '5': 11, '6': '.proto.UsrUser', '10': 'elms'},
  ],
};

/// Descriptor for `UsrUsersList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usrUsersListDescriptor = $convert.base64Decode(
    'CgxVc3JVc2Vyc0xpc3QSIgoEZWxtcxgBIAMoCzIOLnByb3RvLlVzclVzZXJSBGVsbXM=');

