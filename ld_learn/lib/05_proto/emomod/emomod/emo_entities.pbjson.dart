//
//  Generated code. Do not modify.
//  source: emomod/emo_entities.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use emoEmotionDescriptor instead')
const EmoEmotion$json = {
  '1': 'EmoEmotion',
  '2': [
    {'1': 'base_entity', '3': 1, '4': 1, '5': 11, '6': '.proto.ModelEntity', '10': 'baseEntity'},
    {'1': 'name_key', '3': 2, '4': 1, '5': 9, '10': 'nameKey'},
    {'1': 'desc_key', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'descKey', '17': true},
    {'1': 'parent', '3': 4, '4': 1, '5': 11, '6': '.proto.EmoEmotion', '9': 1, '10': 'parent', '17': true},
    {'1': 'value', '3': 5, '4': 1, '5': 5, '10': 'value'},
  ],
  '8': [
    {'1': '_desc_key'},
    {'1': '_parent'},
  ],
};

/// Descriptor for `EmoEmotion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emoEmotionDescriptor = $convert.base64Decode(
    'CgpFbW9FbW90aW9uEjMKC2Jhc2VfZW50aXR5GAEgASgLMhIucHJvdG8uTW9kZWxFbnRpdHlSCm'
    'Jhc2VFbnRpdHkSGQoIbmFtZV9rZXkYAiABKAlSB25hbWVLZXkSHgoIZGVzY19rZXkYAyABKAlI'
    'AFIHZGVzY0tleYgBARIuCgZwYXJlbnQYBCABKAsyES5wcm90by5FbW9FbW90aW9uSAFSBnBhcm'
    'VudIgBARIUCgV2YWx1ZRgFIAEoBVIFdmFsdWVCCwoJX2Rlc2Nfa2V5QgkKB19wYXJlbnQ=');

@$core.Deprecated('Use emoEmotionsDescriptor instead')
const EmoEmotions$json = {
  '1': 'EmoEmotions',
  '2': [
    {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.proto.GbError', '9': 0, '10': 'error', '17': true},
    {'1': 'emotions', '3': 2, '4': 3, '5': 11, '6': '.proto.EmoEmotion', '10': 'emotions'},
  ],
  '8': [
    {'1': '_error'},
  ],
};

/// Descriptor for `EmoEmotions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emoEmotionsDescriptor = $convert.base64Decode(
    'CgtFbW9FbW90aW9ucxIpCgVlcnJvchgBIAEoCzIOLnByb3RvLkdiRXJyb3JIAFIFZXJyb3KIAQ'
    'ESLQoIZW1vdGlvbnMYAiADKAsyES5wcm90by5FbW9FbW90aW9uUghlbW90aW9uc0IICgZfZXJy'
    'b3I=');

@$core.Deprecated('Use emoModuleListsDescriptor instead')
const EmoModuleLists$json = {
  '1': 'EmoModuleLists',
  '2': [
    {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.proto.GbError', '9': 0, '10': 'error', '17': true},
    {'1': 'moods', '3': 2, '4': 1, '5': 11, '6': '.proto.EmoMoods', '10': 'moods'},
    {'1': 'emotions', '3': 3, '4': 1, '5': 11, '6': '.proto.EmoEmotions', '10': 'emotions'},
  ],
  '8': [
    {'1': '_error'},
  ],
};

/// Descriptor for `EmoModuleLists`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emoModuleListsDescriptor = $convert.base64Decode(
    'Cg5FbW9Nb2R1bGVMaXN0cxIpCgVlcnJvchgBIAEoCzIOLnByb3RvLkdiRXJyb3JIAFIFZXJyb3'
    'KIAQESJQoFbW9vZHMYAiABKAsyDy5wcm90by5FbW9Nb29kc1IFbW9vZHMSLgoIZW1vdGlvbnMY'
    'AyABKAsyEi5wcm90by5FbW9FbW90aW9uc1IIZW1vdGlvbnNCCAoGX2Vycm9y');

@$core.Deprecated('Use emoMoodDescriptor instead')
const EmoMood$json = {
  '1': 'EmoMood',
  '2': [
    {'1': 'base_entity', '3': 1, '4': 1, '5': 11, '6': '.proto.ModelEntity', '10': 'baseEntity'},
    {'1': 'name_key', '3': 2, '4': 1, '5': 9, '10': 'nameKey'},
    {'1': 'desc_key', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'descKey', '17': true},
    {'1': 'value', '3': 4, '4': 1, '5': 5, '10': 'value'},
  ],
  '8': [
    {'1': '_desc_key'},
  ],
};

/// Descriptor for `EmoMood`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emoMoodDescriptor = $convert.base64Decode(
    'CgdFbW9Nb29kEjMKC2Jhc2VfZW50aXR5GAEgASgLMhIucHJvdG8uTW9kZWxFbnRpdHlSCmJhc2'
    'VFbnRpdHkSGQoIbmFtZV9rZXkYAiABKAlSB25hbWVLZXkSHgoIZGVzY19rZXkYAyABKAlIAFIH'
    'ZGVzY0tleYgBARIUCgV2YWx1ZRgEIAEoBVIFdmFsdWVCCwoJX2Rlc2Nfa2V5');

@$core.Deprecated('Use emoMoodsDescriptor instead')
const EmoMoods$json = {
  '1': 'EmoMoods',
  '2': [
    {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.proto.GbError', '9': 0, '10': 'error', '17': true},
    {'1': 'moods', '3': 2, '4': 3, '5': 11, '6': '.proto.EmoMood', '10': 'moods'},
  ],
  '8': [
    {'1': '_error'},
  ],
};

/// Descriptor for `EmoMoods`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emoMoodsDescriptor = $convert.base64Decode(
    'CghFbW9Nb29kcxIpCgVlcnJvchgBIAEoCzIOLnByb3RvLkdiRXJyb3JIAFIFZXJyb3KIAQESJA'
    'oFbW9vZHMYAiADKAsyDi5wcm90by5FbW9Nb29kUgVtb29kc0IICgZfZXJyb3I=');

