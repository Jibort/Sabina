//
//  Generated code. Do not modify.
//  source: gbl_enumerations.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use gbErrorCodeDescriptor instead')
const GbErrorCode$json = {
  '1': 'GbErrorCode',
  '2': [
    {'1': 'GB_ERROR_CODE_UNSPECIFIED', '2': 0},
    {'1': 'GB_ERROR_CODE_SUCCESS', '2': 1},
    {'1': 'GB_ERROR_CODE_CUSTOM', '2': 2},
    {'1': 'GB_ERROR_CODE_UNKNOWN', '2': 3},
    {'1': 'GB_ERROR_CODE_INTERNAL_SERVER_ERROR', '2': 4},
    {'1': 'GB_ERROR_CODE_SERVICE_UNAVAILABLE', '2': 5},
    {'1': 'GB_ERROR_CODE_SQL_ERROR', '2': 6},
  ],
};

/// Descriptor for `GbErrorCode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List gbErrorCodeDescriptor = $convert.base64Decode(
    'CgtHYkVycm9yQ29kZRIdChlHQl9FUlJPUl9DT0RFX1VOU1BFQ0lGSUVEEAASGQoVR0JfRVJST1'
    'JfQ09ERV9TVUNDRVNTEAESGAoUR0JfRVJST1JfQ09ERV9DVVNUT00QAhIZChVHQl9FUlJPUl9D'
    'T0RFX1VOS05PV04QAxInCiNHQl9FUlJPUl9DT0RFX0lOVEVSTkFMX1NFUlZFUl9FUlJPUhAEEi'
    'UKIUdCX0VSUk9SX0NPREVfU0VSVklDRV9VTkFWQUlMQUJMRRAFEhsKF0dCX0VSUk9SX0NPREVf'
    'U1FMX0VSUk9SEAY=');

@$core.Deprecated('Use gbEntityActionDescriptor instead')
const GbEntityAction$json = {
  '1': 'GbEntityAction',
  '2': [
    {'1': 'GB_ENTITY_ACTION_UNSPECIFIED', '2': 0},
    {'1': 'GB_ENTITY_ACTION_CREATE', '2': 1},
    {'1': 'GB_ENTITY_ACTION_MODIFY', '2': 2},
    {'1': 'GB_ENTITY_ACTION_FIND', '2': 3},
    {'1': 'GB_ENTITY_ACTION_SYNC', '2': 4},
    {'1': 'GB_ENTITY_ACTION_LOCK', '2': 5},
    {'1': 'GB_ENTITY_ACTION_DELETE', '2': 6},
  ],
};

/// Descriptor for `GbEntityAction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List gbEntityActionDescriptor = $convert.base64Decode(
    'Cg5HYkVudGl0eUFjdGlvbhIgChxHQl9FTlRJVFlfQUNUSU9OX1VOU1BFQ0lGSUVEEAASGwoXR0'
    'JfRU5USVRZX0FDVElPTl9DUkVBVEUQARIbChdHQl9FTlRJVFlfQUNUSU9OX01PRElGWRACEhkK'
    'FUdCX0VOVElUWV9BQ1RJT05fRklORBADEhkKFUdCX0VOVElUWV9BQ1RJT05fU1lOQxAEEhkKFU'
    'dCX0VOVElUWV9BQ1RJT05fTE9DSxAFEhsKF0dCX0VOVElUWV9BQ1RJT05fREVMRVRFEAY=');

@$core.Deprecated('Use gbSyncActionDescriptor instead')
const GbSyncAction$json = {
  '1': 'GbSyncAction',
  '2': [
    {'1': 'GB_SYNC_ACTION_SYNC_UNSPECIFIED', '2': 0},
    {'1': 'GB_SYNC_ACTION_SYNC_CREATE', '2': 1},
    {'1': 'GB_SYNC_ACTION_SYNC_UPDATE', '2': 2},
    {'1': 'GB_SYNC_ACTION_SYNC_DELETE', '2': 3},
  ],
};

/// Descriptor for `GbSyncAction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List gbSyncActionDescriptor = $convert.base64Decode(
    'CgxHYlN5bmNBY3Rpb24SIwofR0JfU1lOQ19BQ1RJT05fU1lOQ19VTlNQRUNJRklFRBAAEh4KGk'
    'dCX1NZTkNfQUNUSU9OX1NZTkNfQ1JFQVRFEAESHgoaR0JfU1lOQ19BQ1RJT05fU1lOQ19VUERB'
    'VEUQAhIeChpHQl9TWU5DX0FDVElPTl9TWU5DX0RFTEVURRAD');

