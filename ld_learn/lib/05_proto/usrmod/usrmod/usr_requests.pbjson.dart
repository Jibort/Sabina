//
//  Generated code. Do not modify.
//  source: usrmod/usr_requests.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use usrReqtUserActionDescriptor instead')
const UsrReqtUserAction$json = {
  '1': 'UsrReqtUserAction',
  '2': [
    {'1': 'action', '3': 1, '4': 1, '5': 14, '6': '.proto.GbEntityAction', '10': 'action'},
    {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.proto.UsrUser', '10': 'user'},
  ],
};

/// Descriptor for `UsrReqtUserAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usrReqtUserActionDescriptor = $convert.base64Decode(
    'ChFVc3JSZXF0VXNlckFjdGlvbhItCgZhY3Rpb24YASABKA4yFS5wcm90by5HYkVudGl0eUFjdG'
    'lvblIGYWN0aW9uEiIKBHVzZXIYAiABKAsyDi5wcm90by5Vc3JVc2VyUgR1c2Vy');

@$core.Deprecated('Use usrRespUserActionDescriptor instead')
const UsrRespUserAction$json = {
  '1': 'UsrRespUserAction',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.proto.UsrUser', '10': 'user'},
    {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.proto.GbError', '9': 0, '10': 'error', '17': true},
  ],
  '8': [
    {'1': '_error'},
  ],
};

/// Descriptor for `UsrRespUserAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usrRespUserActionDescriptor = $convert.base64Decode(
    'ChFVc3JSZXNwVXNlckFjdGlvbhIiCgR1c2VyGAEgASgLMg4ucHJvdG8uVXNyVXNlclIEdXNlch'
    'IpCgVlcnJvchgCIAEoCzIOLnByb3RvLkdiRXJyb3JIAFIFZXJyb3KIAQFCCAoGX2Vycm9y');

@$core.Deprecated('Use usrReqtSyncUserDescriptor instead')
const UsrReqtSyncUser$json = {
  '1': 'UsrReqtSyncUser',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.proto.UsrUser', '10': 'user'},
    {'1': 'sync', '3': 2, '4': 1, '5': 14, '6': '.proto.GbSyncAction', '10': 'sync'},
  ],
};

/// Descriptor for `UsrReqtSyncUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usrReqtSyncUserDescriptor = $convert.base64Decode(
    'Cg9Vc3JSZXF0U3luY1VzZXISIgoEdXNlchgBIAEoCzIOLnByb3RvLlVzclVzZXJSBHVzZXISJw'
    'oEc3luYxgCIAEoDjITLnByb3RvLkdiU3luY0FjdGlvblIEc3luYw==');

@$core.Deprecated('Use usrRespSyncUserDescriptor instead')
const UsrRespSyncUser$json = {
  '1': 'UsrRespSyncUser',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.proto.UsrUser', '10': 'user'},
    {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.proto.GbError', '9': 0, '10': 'error', '17': true},
  ],
  '8': [
    {'1': '_error'},
  ],
};

/// Descriptor for `UsrRespSyncUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usrRespSyncUserDescriptor = $convert.base64Decode(
    'Cg9Vc3JSZXNwU3luY1VzZXISIgoEdXNlchgBIAEoCzIOLnByb3RvLlVzclVzZXJSBHVzZXISKQ'
    'oFZXJyb3IYAiABKAsyDi5wcm90by5HYkVycm9ySABSBWVycm9yiAEBQggKBl9lcnJvcg==');

