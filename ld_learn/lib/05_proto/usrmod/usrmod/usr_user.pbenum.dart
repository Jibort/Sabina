//
//  Generated code. Do not modify.
//  source: usrmod/usr_user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Tipus d'usuari del projecte.
class UsrUserType extends $pb.ProtobufEnum {
  static const UsrUserType USR_USER_TYPE_UNSPECIFIED = UsrUserType._(0, _omitEnumNames ? '' : 'USR_USER_TYPE_UNSPECIFIED');
  static const UsrUserType USR_USER_TYPE_ROOT = UsrUserType._(1, _omitEnumNames ? '' : 'USR_USER_TYPE_ROOT');
  static const UsrUserType USR_USER_TYPE_ADMIN = UsrUserType._(2, _omitEnumNames ? '' : 'USR_USER_TYPE_ADMIN');
  static const UsrUserType USR_USER_TYPE_PATIENT = UsrUserType._(3, _omitEnumNames ? '' : 'USR_USER_TYPE_PATIENT');
  static const UsrUserType USR_USER_TYPE_THERAPIST = UsrUserType._(4, _omitEnumNames ? '' : 'USR_USER_TYPE_THERAPIST');

  static const $core.List<UsrUserType> values = <UsrUserType> [
    USR_USER_TYPE_UNSPECIFIED,
    USR_USER_TYPE_ROOT,
    USR_USER_TYPE_ADMIN,
    USR_USER_TYPE_PATIENT,
    USR_USER_TYPE_THERAPIST,
  ];

  static final $core.Map<$core.int, UsrUserType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UsrUserType? valueOf($core.int value) => _byValue[value];

  const UsrUserType._($core.int v, $core.String n) : super(v, n);
}

/// Tipus d'usuari del projecte.
class UsrUserState extends $pb.ProtobufEnum {
  static const UsrUserState USR_USER_STATE_USER_UNSPECIFIED = UsrUserState._(0, _omitEnumNames ? '' : 'USR_USER_STATE_USER_UNSPECIFIED');
  static const UsrUserState USR_USER_STATE_USER_BUILDING = UsrUserState._(1, _omitEnumNames ? '' : 'USR_USER_STATE_USER_BUILDING');
  static const UsrUserState USR_USER_STATE_USER_ACTIVE = UsrUserState._(2, _omitEnumNames ? '' : 'USR_USER_STATE_USER_ACTIVE');
  static const UsrUserState USR_USER_STATE_USER_LOCKED = UsrUserState._(3, _omitEnumNames ? '' : 'USR_USER_STATE_USER_LOCKED');

  static const $core.List<UsrUserState> values = <UsrUserState> [
    USR_USER_STATE_USER_UNSPECIFIED,
    USR_USER_STATE_USER_BUILDING,
    USR_USER_STATE_USER_ACTIVE,
    USR_USER_STATE_USER_LOCKED,
  ];

  static final $core.Map<$core.int, UsrUserState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UsrUserState? valueOf($core.int value) => _byValue[value];

  const UsrUserState._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
