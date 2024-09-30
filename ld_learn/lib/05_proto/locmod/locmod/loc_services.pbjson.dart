//
//  Generated code. Do not modify.
//  source: locmod/loc_services.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use gbTextKeyFingerPrintDescriptor instead')
const GbTextKeyFingerPrint$json = {
  '1': 'GbTextKeyFingerPrint',
  '2': [
    {'1': 'last_text_key_id', '3': 1, '4': 1, '5': 5, '10': 'lastTextKeyId'},
  ],
};

/// Descriptor for `GbTextKeyFingerPrint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gbTextKeyFingerPrintDescriptor = $convert.base64Decode(
    'ChRHYlRleHRLZXlGaW5nZXJQcmludBInChBsYXN0X3RleHRfa2V5X2lkGAEgASgFUg1sYXN0VG'
    'V4dEtleUlk');

@$core.Deprecated('Use gbLocaleFingerPrintDescriptor instead')
const GbLocaleFingerPrint$json = {
  '1': 'GbLocaleFingerPrint',
  '2': [
    {'1': 'last_location_id', '3': 1, '4': 1, '5': 5, '10': 'lastLocationId'},
  ],
};

/// Descriptor for `GbLocaleFingerPrint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gbLocaleFingerPrintDescriptor = $convert.base64Decode(
    'ChNHYkxvY2FsZUZpbmdlclByaW50EigKEGxhc3RfbG9jYXRpb25faWQYASABKAVSDmxhc3RMb2'
    'NhdGlvbklk');

@$core.Deprecated('Use gbTranslationFingerPrintDescriptor instead')
const GbTranslationFingerPrint$json = {
  '1': 'GbTranslationFingerPrint',
  '2': [
    {'1': 'last_translation_id', '3': 1, '4': 1, '5': 5, '10': 'lastTranslationId'},
  ],
};

/// Descriptor for `GbTranslationFingerPrint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gbTranslationFingerPrintDescriptor = $convert.base64Decode(
    'ChhHYlRyYW5zbGF0aW9uRmluZ2VyUHJpbnQSLgoTbGFzdF90cmFuc2xhdGlvbl9pZBgBIAEoBV'
    'IRbGFzdFRyYW5zbGF0aW9uSWQ=');

@$core.Deprecated('Use gbSyncLocModDescriptor instead')
const GbSyncLocMod$json = {
  '1': 'GbSyncLocMod',
  '2': [
    {'1': 'finger_id', '3': 1, '4': 1, '5': 5, '10': 'fingerId'},
    {'1': 'loc_text_key', '3': 2, '4': 1, '5': 11, '6': '.proto.GbTextKeyFingerPrint', '9': 0, '10': 'locTextKey', '17': true},
    {'1': 'loc_locale', '3': 3, '4': 1, '5': 11, '6': '.proto.GbLocaleFingerPrint', '9': 1, '10': 'locLocale', '17': true},
    {'1': 'loc_translation', '3': 4, '4': 1, '5': 11, '6': '.proto.GbTranslationFingerPrint', '9': 2, '10': 'locTranslation', '17': true},
  ],
  '8': [
    {'1': '_loc_text_key'},
    {'1': '_loc_locale'},
    {'1': '_loc_translation'},
  ],
};

/// Descriptor for `GbSyncLocMod`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gbSyncLocModDescriptor = $convert.base64Decode(
    'CgxHYlN5bmNMb2NNb2QSGwoJZmluZ2VyX2lkGAEgASgFUghmaW5nZXJJZBJCCgxsb2NfdGV4dF'
    '9rZXkYAiABKAsyGy5wcm90by5HYlRleHRLZXlGaW5nZXJQcmludEgAUgpsb2NUZXh0S2V5iAEB'
    'Ej4KCmxvY19sb2NhbGUYAyABKAsyGi5wcm90by5HYkxvY2FsZUZpbmdlclByaW50SAFSCWxvY0'
    'xvY2FsZYgBARJNCg9sb2NfdHJhbnNsYXRpb24YBCABKAsyHy5wcm90by5HYlRyYW5zbGF0aW9u'
    'RmluZ2VyUHJpbnRIAlIObG9jVHJhbnNsYXRpb26IAQFCDwoNX2xvY190ZXh0X2tleUINCgtfbG'
    '9jX2xvY2FsZUISChBfbG9jX3RyYW5zbGF0aW9u');

@$core.Deprecated('Use prtDownloadTranslationDescriptor instead')
const PrtDownloadTranslation$json = {
  '1': 'PrtDownloadTranslation',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'lang_id', '3': 2, '4': 1, '5': 9, '10': 'langId'},
    {'1': 'tkey_id', '3': 3, '4': 1, '5': 9, '10': 'tkeyId'},
  ],
};

/// Descriptor for `PrtDownloadTranslation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List prtDownloadTranslationDescriptor = $convert.base64Decode(
    'ChZQcnREb3dubG9hZFRyYW5zbGF0aW9uEhcKB3VzZXJfaWQYASABKAVSBnVzZXJJZBIXCgdsYW'
    '5nX2lkGAIgASgJUgZsYW5nSWQSFwoHdGtleV9pZBgDIAEoCVIGdGtleUlk');

@$core.Deprecated('Use prtTranslationDescriptor instead')
const PrtTranslation$json = {
  '1': 'PrtTranslation',
  '2': [
    {'1': 'locale', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'locale', '17': true},
    {'1': 'text_key', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'textKey', '17': true},
    {'1': 'translation', '3': 3, '4': 1, '5': 11, '6': '.proto.LocTranslation', '9': 2, '10': 'translation', '17': true},
  ],
  '8': [
    {'1': '_locale'},
    {'1': '_text_key'},
    {'1': '_translation'},
  ],
};

/// Descriptor for `PrtTranslation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List prtTranslationDescriptor = $convert.base64Decode(
    'Cg5QcnRUcmFuc2xhdGlvbhIbCgZsb2NhbGUYASABKAlIAFIGbG9jYWxliAEBEh4KCHRleHRfa2'
    'V5GAIgASgJSAFSB3RleHRLZXmIAQESPAoLdHJhbnNsYXRpb24YAyABKAsyFS5wcm90by5Mb2NU'
    'cmFuc2xhdGlvbkgCUgt0cmFuc2xhdGlvbogBAUIJCgdfbG9jYWxlQgsKCV90ZXh0X2tleUIOCg'
    'xfdHJhbnNsYXRpb24=');

