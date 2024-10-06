//
//  Generated code. Do not modify.
//  source: locmod/loc_requests.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use locReqtTranslateDescriptor instead')
const LocReqtTranslate$json = {
  '1': 'LocReqtTranslate',
  '2': [
    {'1': 'language', '3': 1, '4': 1, '5': 9, '10': 'language'},
    {'1': 'text_key', '3': 2, '4': 1, '5': 9, '10': 'textKey'},
    {'1': 'iteration', '3': 3, '4': 1, '5': 5, '9': 0, '10': 'iteration', '17': true},
  ],
  '8': [
    {'1': '_iteration'},
  ],
};

/// Descriptor for `LocReqtTranslate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locReqtTranslateDescriptor = $convert.base64Decode(
    'ChBMb2NSZXF0VHJhbnNsYXRlEhoKCGxhbmd1YWdlGAEgASgJUghsYW5ndWFnZRIZCgh0ZXh0X2'
    'tleRgCIAEoCVIHdGV4dEtleRIhCglpdGVyYXRpb24YAyABKAVIAFIJaXRlcmF0aW9uiAEBQgwK'
    'Cl9pdGVyYXRpb24=');

@$core.Deprecated('Use locRespTranslateDescriptor instead')
const LocRespTranslate$json = {
  '1': 'LocRespTranslate',
  '2': [
    {'1': 'request', '3': 1, '4': 1, '5': 11, '6': '.proto.LocReqtTranslate', '10': 'request'},
    {'1': 'translation', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'translation', '17': true},
  ],
  '8': [
    {'1': '_translation'},
  ],
};

/// Descriptor for `LocRespTranslate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locRespTranslateDescriptor = $convert.base64Decode(
    'ChBMb2NSZXNwVHJhbnNsYXRlEjEKB3JlcXVlc3QYASABKAsyFy5wcm90by5Mb2NSZXF0VHJhbn'
    'NsYXRlUgdyZXF1ZXN0EiUKC3RyYW5zbGF0aW9uGAIgASgJSABSC3RyYW5zbGF0aW9uiAEBQg4K'
    'DF90cmFuc2xhdGlvbg==');

