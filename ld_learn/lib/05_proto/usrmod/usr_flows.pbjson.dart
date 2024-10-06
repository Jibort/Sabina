//
//  Generated code. Do not modify.
//  source: usrmod/usr_flows.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use usrFlowCreateUserDescriptor instead')
const UsrFlowCreateUser$json = {
  '1': 'UsrFlowCreateUser',
  '2': [
    {'1': 'created_by', '3': 1, '4': 1, '5': 5, '10': 'createdBy'},
    {'1': 'user_type', '3': 2, '4': 1, '5': 14, '6': '.proto.UsrUserType', '10': 'userType'},
    {'1': 'permissions', '3': 3, '4': 1, '5': 4, '10': 'permissions'},
    {'1': 'alias', '3': 4, '4': 1, '5': 9, '10': 'alias'},
    {'1': 'therapist', '3': 5, '4': 1, '5': 11, '6': '.proto.UsrUser', '9': 0, '10': 'therapist', '17': true},
    {'1': 'birth_date', '3': 6, '4': 1, '5': 11, '6': '.proto.Timestamp', '9': 1, '10': 'birthDate', '17': true},
    {'1': 'def_lang', '3': 7, '4': 1, '5': 9, '10': 'defLang'},
  ],
  '8': [
    {'1': '_therapist'},
    {'1': '_birth_date'},
  ],
};

/// Descriptor for `UsrFlowCreateUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usrFlowCreateUserDescriptor = $convert.base64Decode(
    'ChFVc3JGbG93Q3JlYXRlVXNlchIdCgpjcmVhdGVkX2J5GAEgASgFUgljcmVhdGVkQnkSLwoJdX'
    'Nlcl90eXBlGAIgASgOMhIucHJvdG8uVXNyVXNlclR5cGVSCHVzZXJUeXBlEiAKC3Blcm1pc3Np'
    'b25zGAMgASgEUgtwZXJtaXNzaW9ucxIUCgVhbGlhcxgEIAEoCVIFYWxpYXMSMQoJdGhlcmFwaX'
    'N0GAUgASgLMg4ucHJvdG8uVXNyVXNlckgAUgl0aGVyYXBpc3SIAQESNAoKYmlydGhfZGF0ZRgG'
    'IAEoCzIQLnByb3RvLlRpbWVzdGFtcEgBUgliaXJ0aERhdGWIAQESGQoIZGVmX2xhbmcYByABKA'
    'lSB2RlZkxhbmdCDAoKX3RoZXJhcGlzdEINCgtfYmlydGhfZGF0ZQ==');

@$core.Deprecated('Use usrFlowUpdateUserDescriptor instead')
const UsrFlowUpdateUser$json = {
  '1': 'UsrFlowUpdateUser',
  '2': [
    {'1': 'updated_by', '3': 1, '4': 1, '5': 5, '10': 'updatedBy'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'permissions', '3': 3, '4': 1, '5': 4, '9': 0, '10': 'permissions', '17': true},
    {'1': 'alias', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'alias', '17': true},
    {'1': 'certificate', '3': 5, '4': 1, '5': 12, '9': 2, '10': 'certificate', '17': true},
    {'1': 'state', '3': 6, '4': 1, '5': 14, '6': '.proto.UsrUserState', '9': 3, '10': 'state', '17': true},
    {'1': 'therapist', '3': 7, '4': 1, '5': 11, '6': '.proto.UsrUser', '9': 4, '10': 'therapist', '17': true},
    {'1': 'last_device', '3': 8, '4': 1, '5': 11, '6': '.proto.UsrDevice', '9': 5, '10': 'lastDevice', '17': true},
    {'1': 'birth_date', '3': 9, '4': 1, '5': 11, '6': '.proto.Timestamp', '9': 6, '10': 'birthDate', '17': true},
    {'1': 'def_lang', '3': 10, '4': 1, '5': 9, '9': 7, '10': 'defLang', '17': true},
  ],
  '8': [
    {'1': '_permissions'},
    {'1': '_alias'},
    {'1': '_certificate'},
    {'1': '_state'},
    {'1': '_therapist'},
    {'1': '_last_device'},
    {'1': '_birth_date'},
    {'1': '_def_lang'},
  ],
};

/// Descriptor for `UsrFlowUpdateUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usrFlowUpdateUserDescriptor = $convert.base64Decode(
    'ChFVc3JGbG93VXBkYXRlVXNlchIdCgp1cGRhdGVkX2J5GAEgASgFUgl1cGRhdGVkQnkSFwoHdX'
    'Nlcl9pZBgCIAEoBVIGdXNlcklkEiUKC3Blcm1pc3Npb25zGAMgASgESABSC3Blcm1pc3Npb25z'
    'iAEBEhkKBWFsaWFzGAQgASgJSAFSBWFsaWFziAEBEiUKC2NlcnRpZmljYXRlGAUgASgMSAJSC2'
    'NlcnRpZmljYXRliAEBEi4KBXN0YXRlGAYgASgOMhMucHJvdG8uVXNyVXNlclN0YXRlSANSBXN0'
    'YXRliAEBEjEKCXRoZXJhcGlzdBgHIAEoCzIOLnByb3RvLlVzclVzZXJIBFIJdGhlcmFwaXN0iA'
    'EBEjYKC2xhc3RfZGV2aWNlGAggASgLMhAucHJvdG8uVXNyRGV2aWNlSAVSCmxhc3REZXZpY2WI'
    'AQESNAoKYmlydGhfZGF0ZRgJIAEoCzIQLnByb3RvLlRpbWVzdGFtcEgGUgliaXJ0aERhdGWIAQ'
    'ESHgoIZGVmX2xhbmcYCiABKAlIB1IHZGVmTGFuZ4gBAUIOCgxfcGVybWlzc2lvbnNCCAoGX2Fs'
    'aWFzQg4KDF9jZXJ0aWZpY2F0ZUIICgZfc3RhdGVCDAoKX3RoZXJhcGlzdEIOCgxfbGFzdF9kZX'
    'ZpY2VCDQoLX2JpcnRoX2RhdGVCCwoJX2RlZl9sYW5n');

