//
//  Generated code. Do not modify.
//  source: usrmod/usr_device.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Tipus dels dispositius d'usuari.
class UsrDeviceType extends $pb.ProtobufEnum {
  static const UsrDeviceType USR_DEVICE_TYPE_DEVICE_TYPE_UNSPECIFIED = UsrDeviceType._(0, _omitEnumNames ? '' : 'USR_DEVICE_TYPE_DEVICE_TYPE_UNSPECIFIED');
  static const UsrDeviceType USR_DEVICE_TYPE_ANDROID_MOBILE = UsrDeviceType._(1, _omitEnumNames ? '' : 'USR_DEVICE_TYPE_ANDROID_MOBILE');
  static const UsrDeviceType USR_DEVICE_TYPE_ANDROID_TABLET = UsrDeviceType._(2, _omitEnumNames ? '' : 'USR_DEVICE_TYPE_ANDROID_TABLET');
  static const UsrDeviceType USR_DEVICE_TYPE_IOS_MOBILE = UsrDeviceType._(3, _omitEnumNames ? '' : 'USR_DEVICE_TYPE_IOS_MOBILE');
  static const UsrDeviceType USR_DEVICE_TYPE_IOS_TABLET = UsrDeviceType._(4, _omitEnumNames ? '' : 'USR_DEVICE_TYPE_IOS_TABLET');
  static const UsrDeviceType USR_DEVICE_TYPE_WINDOWS = UsrDeviceType._(5, _omitEnumNames ? '' : 'USR_DEVICE_TYPE_WINDOWS');
  static const UsrDeviceType USR_DEVICE_TYPE_MACOS = UsrDeviceType._(6, _omitEnumNames ? '' : 'USR_DEVICE_TYPE_MACOS');
  static const UsrDeviceType USR_DEVICE_TYPE_LINUX = UsrDeviceType._(7, _omitEnumNames ? '' : 'USR_DEVICE_TYPE_LINUX');

  static const $core.List<UsrDeviceType> values = <UsrDeviceType> [
    USR_DEVICE_TYPE_DEVICE_TYPE_UNSPECIFIED,
    USR_DEVICE_TYPE_ANDROID_MOBILE,
    USR_DEVICE_TYPE_ANDROID_TABLET,
    USR_DEVICE_TYPE_IOS_MOBILE,
    USR_DEVICE_TYPE_IOS_TABLET,
    USR_DEVICE_TYPE_WINDOWS,
    USR_DEVICE_TYPE_MACOS,
    USR_DEVICE_TYPE_LINUX,
  ];

  static final $core.Map<$core.int, UsrDeviceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UsrDeviceType? valueOf($core.int value) => _byValue[value];

  const UsrDeviceType._($core.int v, $core.String n) : super(v, n);
}

/// Estats dels dispositius d'usuari.
class UsrDeviceState extends $pb.ProtobufEnum {
  static const UsrDeviceState USR_DEVICE_STATE_UNSPECIFIED = UsrDeviceState._(0, _omitEnumNames ? '' : 'USR_DEVICE_STATE_UNSPECIFIED');
  static const UsrDeviceState USR_DEVICE_STATE_ENABLED = UsrDeviceState._(1, _omitEnumNames ? '' : 'USR_DEVICE_STATE_ENABLED');
  static const UsrDeviceState USR_DEVICE_STATE_DISABLED = UsrDeviceState._(2, _omitEnumNames ? '' : 'USR_DEVICE_STATE_DISABLED');

  static const $core.List<UsrDeviceState> values = <UsrDeviceState> [
    USR_DEVICE_STATE_UNSPECIFIED,
    USR_DEVICE_STATE_ENABLED,
    USR_DEVICE_STATE_DISABLED,
  ];

  static final $core.Map<$core.int, UsrDeviceState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UsrDeviceState? valueOf($core.int value) => _byValue[value];

  const UsrDeviceState._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
