//
//  Generated code. Do not modify.
//  source: gbl_enumerations.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Enumeració dels errors generals que poden aparèixer.
class GbErrorCode extends $pb.ProtobufEnum {
  static const GbErrorCode GB_ERROR_CODE_UNSPECIFIED = GbErrorCode._(0, _omitEnumNames ? '' : 'GB_ERROR_CODE_UNSPECIFIED');
  static const GbErrorCode GB_ERROR_CODE_SUCCESS = GbErrorCode._(1, _omitEnumNames ? '' : 'GB_ERROR_CODE_SUCCESS');
  static const GbErrorCode GB_ERROR_CODE_CUSTOM = GbErrorCode._(2, _omitEnumNames ? '' : 'GB_ERROR_CODE_CUSTOM');
  static const GbErrorCode GB_ERROR_CODE_UNKNOWN = GbErrorCode._(3, _omitEnumNames ? '' : 'GB_ERROR_CODE_UNKNOWN');
  static const GbErrorCode GB_ERROR_CODE_INTERNAL_SERVER_ERROR = GbErrorCode._(4, _omitEnumNames ? '' : 'GB_ERROR_CODE_INTERNAL_SERVER_ERROR');
  static const GbErrorCode GB_ERROR_CODE_SERVICE_UNAVAILABLE = GbErrorCode._(5, _omitEnumNames ? '' : 'GB_ERROR_CODE_SERVICE_UNAVAILABLE');
  static const GbErrorCode GB_ERROR_CODE_SQL_ERROR = GbErrorCode._(6, _omitEnumNames ? '' : 'GB_ERROR_CODE_SQL_ERROR');

  static const $core.List<GbErrorCode> values = <GbErrorCode> [
    GB_ERROR_CODE_UNSPECIFIED,
    GB_ERROR_CODE_SUCCESS,
    GB_ERROR_CODE_CUSTOM,
    GB_ERROR_CODE_UNKNOWN,
    GB_ERROR_CODE_INTERNAL_SERVER_ERROR,
    GB_ERROR_CODE_SERVICE_UNAVAILABLE,
    GB_ERROR_CODE_SQL_ERROR,
  ];

  static final $core.Map<$core.int, GbErrorCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GbErrorCode? valueOf($core.int value) => _byValue[value];

  const GbErrorCode._($core.int v, $core.String n) : super(v, n);
}

/// Enumeració de les accions sobre instàncies d'entitat.
class GbEntityAction extends $pb.ProtobufEnum {
  static const GbEntityAction GB_ENTITY_ACTION_UNSPECIFIED = GbEntityAction._(0, _omitEnumNames ? '' : 'GB_ENTITY_ACTION_UNSPECIFIED');
  static const GbEntityAction GB_ENTITY_ACTION_CREATE = GbEntityAction._(1, _omitEnumNames ? '' : 'GB_ENTITY_ACTION_CREATE');
  static const GbEntityAction GB_ENTITY_ACTION_MODIFY = GbEntityAction._(2, _omitEnumNames ? '' : 'GB_ENTITY_ACTION_MODIFY');
  static const GbEntityAction GB_ENTITY_ACTION_FIND = GbEntityAction._(3, _omitEnumNames ? '' : 'GB_ENTITY_ACTION_FIND');
  static const GbEntityAction GB_ENTITY_ACTION_SYNC = GbEntityAction._(4, _omitEnumNames ? '' : 'GB_ENTITY_ACTION_SYNC');
  static const GbEntityAction GB_ENTITY_ACTION_LOCK = GbEntityAction._(5, _omitEnumNames ? '' : 'GB_ENTITY_ACTION_LOCK');
  static const GbEntityAction GB_ENTITY_ACTION_DELETE = GbEntityAction._(6, _omitEnumNames ? '' : 'GB_ENTITY_ACTION_DELETE');

  static const $core.List<GbEntityAction> values = <GbEntityAction> [
    GB_ENTITY_ACTION_UNSPECIFIED,
    GB_ENTITY_ACTION_CREATE,
    GB_ENTITY_ACTION_MODIFY,
    GB_ENTITY_ACTION_FIND,
    GB_ENTITY_ACTION_SYNC,
    GB_ENTITY_ACTION_LOCK,
    GB_ENTITY_ACTION_DELETE,
  ];

  static final $core.Map<$core.int, GbEntityAction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GbEntityAction? valueOf($core.int value) => _byValue[value];

  const GbEntityAction._($core.int v, $core.String n) : super(v, n);
}

/// Tipus d'acció de sincronització cap al backend.
class GbSyncAction extends $pb.ProtobufEnum {
  static const GbSyncAction GB_SYNC_ACTION_SYNC_UNSPECIFIED = GbSyncAction._(0, _omitEnumNames ? '' : 'GB_SYNC_ACTION_SYNC_UNSPECIFIED');
  static const GbSyncAction GB_SYNC_ACTION_SYNC_CREATE = GbSyncAction._(1, _omitEnumNames ? '' : 'GB_SYNC_ACTION_SYNC_CREATE');
  static const GbSyncAction GB_SYNC_ACTION_SYNC_UPDATE = GbSyncAction._(2, _omitEnumNames ? '' : 'GB_SYNC_ACTION_SYNC_UPDATE');
  static const GbSyncAction GB_SYNC_ACTION_SYNC_DELETE = GbSyncAction._(3, _omitEnumNames ? '' : 'GB_SYNC_ACTION_SYNC_DELETE');

  static const $core.List<GbSyncAction> values = <GbSyncAction> [
    GB_SYNC_ACTION_SYNC_UNSPECIFIED,
    GB_SYNC_ACTION_SYNC_CREATE,
    GB_SYNC_ACTION_SYNC_UPDATE,
    GB_SYNC_ACTION_SYNC_DELETE,
  ];

  static final $core.Map<$core.int, GbSyncAction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GbSyncAction? valueOf($core.int value) => _byValue[value];

  const GbSyncAction._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
