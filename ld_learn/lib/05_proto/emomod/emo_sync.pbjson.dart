//
//  Generated code. Do not modify.
//  source: emomod/emo_sync.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use gbMoodFingerPrintDescriptor instead')
const GbMoodFingerPrint$json = {
  '1': 'GbMoodFingerPrint',
  '2': [
    {'1': 'last_mood_id', '3': 1, '4': 1, '5': 5, '10': 'lastMoodId'},
    {'1': 'last_mood_update', '3': 2, '4': 1, '5': 11, '6': '.proto.Timestamp', '10': 'lastMoodUpdate'},
  ],
};

/// Descriptor for `GbMoodFingerPrint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gbMoodFingerPrintDescriptor = $convert.base64Decode(
    'ChFHYk1vb2RGaW5nZXJQcmludBIgCgxsYXN0X21vb2RfaWQYASABKAVSCmxhc3RNb29kSWQSOg'
    'oQbGFzdF9tb29kX3VwZGF0ZRgCIAEoCzIQLnByb3RvLlRpbWVzdGFtcFIObGFzdE1vb2RVcGRh'
    'dGU=');

@$core.Deprecated('Use gbEmotionFingerPrintDescriptor instead')
const GbEmotionFingerPrint$json = {
  '1': 'GbEmotionFingerPrint',
  '2': [
    {'1': 'last_emotion_id', '3': 1, '4': 1, '5': 5, '10': 'lastEmotionId'},
    {'1': 'last_emotion_update', '3': 2, '4': 1, '5': 11, '6': '.proto.Timestamp', '10': 'lastEmotionUpdate'},
  ],
};

/// Descriptor for `GbEmotionFingerPrint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gbEmotionFingerPrintDescriptor = $convert.base64Decode(
    'ChRHYkVtb3Rpb25GaW5nZXJQcmludBImCg9sYXN0X2Vtb3Rpb25faWQYASABKAVSDWxhc3RFbW'
    '90aW9uSWQSQAoTbGFzdF9lbW90aW9uX3VwZGF0ZRgCIAEoCzIQLnByb3RvLlRpbWVzdGFtcFIR'
    'bGFzdEVtb3Rpb25VcGRhdGU=');

@$core.Deprecated('Use gbSyncEmoModDescriptor instead')
const GbSyncEmoMod$json = {
  '1': 'GbSyncEmoMod',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'user_lang', '3': 2, '4': 1, '5': 9, '10': 'userLang'},
    {'1': 'emo_mood', '3': 3, '4': 1, '5': 11, '6': '.proto.GbMoodFingerPrint', '9': 0, '10': 'emoMood', '17': true},
    {'1': 'emo_emotion', '3': 4, '4': 1, '5': 11, '6': '.proto.GbEmotionFingerPrint', '9': 1, '10': 'emoEmotion', '17': true},
  ],
  '8': [
    {'1': '_emo_mood'},
    {'1': '_emo_emotion'},
  ],
};

/// Descriptor for `GbSyncEmoMod`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gbSyncEmoModDescriptor = $convert.base64Decode(
    'CgxHYlN5bmNFbW9Nb2QSFwoHdXNlcl9pZBgBIAEoBVIGdXNlcklkEhsKCXVzZXJfbGFuZxgCIA'
    'EoCVIIdXNlckxhbmcSOAoIZW1vX21vb2QYAyABKAsyGC5wcm90by5HYk1vb2RGaW5nZXJQcmlu'
    'dEgAUgdlbW9Nb29kiAEBEkEKC2Vtb19lbW90aW9uGAQgASgLMhsucHJvdG8uR2JFbW90aW9uRm'
    'luZ2VyUHJpbnRIAVIKZW1vRW1vdGlvbogBAUILCglfZW1vX21vb2RCDgoMX2Vtb19lbW90aW9u');

