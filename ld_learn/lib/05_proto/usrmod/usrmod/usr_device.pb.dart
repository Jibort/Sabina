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

import '../model_entity.pb.dart' as $0;
import 'usr_device.pbenum.dart';

export 'usr_device.pbenum.dart';

/// Representació dels dispositius d'usuari.
class UsrDevice extends $pb.GeneratedMessage {
  factory UsrDevice({
    $0.ModelEntity? baseEntity,
    UsrDeviceType? type,
    UsrDeviceState? state,
    $core.String? descKey,
    $core.String? token,
    $core.int? owner,
  }) {
    final $result = create();
    if (baseEntity != null) {
      $result.baseEntity = baseEntity;
    }
    if (type != null) {
      $result.type = type;
    }
    if (state != null) {
      $result.state = state;
    }
    if (descKey != null) {
      $result.descKey = descKey;
    }
    if (token != null) {
      $result.token = token;
    }
    if (owner != null) {
      $result.owner = owner;
    }
    return $result;
  }
  UsrDevice._() : super();
  factory UsrDevice.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UsrDevice.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UsrDevice', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$0.ModelEntity>(1, _omitFieldNames ? '' : 'baseEntity', subBuilder: $0.ModelEntity.create)
    ..e<UsrDeviceType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: UsrDeviceType.USR_DEVICE_TYPE_DEVICE_TYPE_UNSPECIFIED, valueOf: UsrDeviceType.valueOf, enumValues: UsrDeviceType.values)
    ..e<UsrDeviceState>(3, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: UsrDeviceState.USR_DEVICE_STATE_UNSPECIFIED, valueOf: UsrDeviceState.valueOf, enumValues: UsrDeviceState.values)
    ..aOS(4, _omitFieldNames ? '' : 'descKey')
    ..aOS(5, _omitFieldNames ? '' : 'token')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'owner', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UsrDevice clone() => UsrDevice()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UsrDevice copyWith(void Function(UsrDevice) updates) => super.copyWith((message) => updates(message as UsrDevice)) as UsrDevice;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UsrDevice create() => UsrDevice._();
  UsrDevice createEmptyInstance() => create();
  static $pb.PbList<UsrDevice> createRepeated() => $pb.PbList<UsrDevice>();
  @$core.pragma('dart2js:noInline')
  static UsrDevice getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsrDevice>(create);
  static UsrDevice? _defaultInstance;

  @$pb.TagNumber(1)
  $0.ModelEntity get baseEntity => $_getN(0);
  @$pb.TagNumber(1)
  set baseEntity($0.ModelEntity v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBaseEntity() => $_has(0);
  @$pb.TagNumber(1)
  void clearBaseEntity() => clearField(1);
  @$pb.TagNumber(1)
  $0.ModelEntity ensureBaseEntity() => $_ensure(0);

  @$pb.TagNumber(2)
  UsrDeviceType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(UsrDeviceType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  UsrDeviceState get state => $_getN(2);
  @$pb.TagNumber(3)
  set state(UsrDeviceState v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasState() => $_has(2);
  @$pb.TagNumber(3)
  void clearState() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get descKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set descKey($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescKey() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get token => $_getSZ(4);
  @$pb.TagNumber(5)
  set token($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasToken() => $_has(4);
  @$pb.TagNumber(5)
  void clearToken() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get owner => $_getIZ(5);
  @$pb.TagNumber(6)
  set owner($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOwner() => $_has(5);
  @$pb.TagNumber(6)
  void clearOwner() => clearField(6);
}

/// Representació d'una llista de dispositius.
class UsrDevicesList extends $pb.GeneratedMessage {
  factory UsrDevicesList({
    $core.Iterable<UsrDevice>? elms,
  }) {
    final $result = create();
    if (elms != null) {
      $result.elms.addAll(elms);
    }
    return $result;
  }
  UsrDevicesList._() : super();
  factory UsrDevicesList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UsrDevicesList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UsrDevicesList', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<UsrDevice>(1, _omitFieldNames ? '' : 'elms', $pb.PbFieldType.PM, subBuilder: UsrDevice.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UsrDevicesList clone() => UsrDevicesList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UsrDevicesList copyWith(void Function(UsrDevicesList) updates) => super.copyWith((message) => updates(message as UsrDevicesList)) as UsrDevicesList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UsrDevicesList create() => UsrDevicesList._();
  UsrDevicesList createEmptyInstance() => create();
  static $pb.PbList<UsrDevicesList> createRepeated() => $pb.PbList<UsrDevicesList>();
  @$core.pragma('dart2js:noInline')
  static UsrDevicesList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsrDevicesList>(create);
  static UsrDevicesList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UsrDevice> get elms => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
