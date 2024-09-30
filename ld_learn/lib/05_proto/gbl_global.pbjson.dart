//
//  Generated code. Do not modify.
//  source: gbl_global.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use gbErrorDescriptor instead')
const GbError$json = {
  '1': 'GbError',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.proto.GbErrorCode', '10': 'code'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'message', '17': true},
  ],
  '8': [
    {'1': '_message'},
  ],
};

/// Descriptor for `GbError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gbErrorDescriptor = $convert.base64Decode(
    'CgdHYkVycm9yEiYKBGNvZGUYASABKA4yEi5wcm90by5HYkVycm9yQ29kZVIEY29kZRIdCgdtZX'
    'NzYWdlGAIgASgJSABSB21lc3NhZ2WIAQFCCgoIX21lc3NhZ2U=');

@$core.Deprecated('Use gbRespAcknoledgeDescriptor instead')
const GbRespAcknoledge$json = {
  '1': 'GbRespAcknoledge',
  '2': [
    {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.proto.GbError', '9': 0, '10': 'error', '17': true},
  ],
  '8': [
    {'1': '_error'},
  ],
};

/// Descriptor for `GbRespAcknoledge`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gbRespAcknoledgeDescriptor = $convert.base64Decode(
    'ChBHYlJlc3BBY2tub2xlZGdlEikKBWVycm9yGAEgASgLMg4ucHJvdG8uR2JFcnJvckgAUgVlcn'
    'JvcogBAUIICgZfZXJyb3I=');

@$core.Deprecated('Use gbReqtInstanceByIdDescriptor instead')
const GbReqtInstanceById$json = {
  '1': 'GbReqtInstanceById',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `GbReqtInstanceById`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gbReqtInstanceByIdDescriptor = $convert.base64Decode(
    'ChJHYlJlcXRJbnN0YW5jZUJ5SWQSDgoCaWQYASABKAVSAmlk');

@$core.Deprecated('Use gbReqtInstanceByStringDescriptor instead')
const GbReqtInstanceByString$json = {
  '1': 'GbReqtInstanceByString',
  '2': [
    {'1': 'str', '3': 1, '4': 1, '5': 9, '10': 'str'},
  ],
};

/// Descriptor for `GbReqtInstanceByString`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gbReqtInstanceByStringDescriptor = $convert.base64Decode(
    'ChZHYlJlcXRJbnN0YW5jZUJ5U3RyaW5nEhAKA3N0chgBIAEoCVIDc3Ry');

