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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../gbl_timestamp.pb.dart' as $1;
import '../model_entity.pb.dart' as $0;
import 'usr_user.pbenum.dart';

export 'usr_user.pbenum.dart';

/// Representació d'un usuari.
class UsrUser extends $pb.GeneratedMessage {
  factory UsrUser({
    $0.ModelEntity? baseEntity,
    UsrUserType? userType,
    UsrUserState? state,
    $fixnum.Int64? permissions,
    $core.String? alias,
    $core.List<$core.int>? certificate,
    $1.Timestamp? birthDate,
    $fixnum.Int64? firstKey,
    $1.Timestamp? firstConnAt,
    $core.String? locale,
    $core.int? therapistId,
    $core.int? deviceId,
  }) {
    final $result = create();
    if (baseEntity != null) {
      $result.baseEntity = baseEntity;
    }
    if (userType != null) {
      $result.userType = userType;
    }
    if (state != null) {
      $result.state = state;
    }
    if (permissions != null) {
      $result.permissions = permissions;
    }
    if (alias != null) {
      $result.alias = alias;
    }
    if (certificate != null) {
      $result.certificate = certificate;
    }
    if (birthDate != null) {
      $result.birthDate = birthDate;
    }
    if (firstKey != null) {
      $result.firstKey = firstKey;
    }
    if (firstConnAt != null) {
      $result.firstConnAt = firstConnAt;
    }
    if (locale != null) {
      $result.locale = locale;
    }
    if (therapistId != null) {
      $result.therapistId = therapistId;
    }
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    return $result;
  }
  UsrUser._() : super();
  factory UsrUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UsrUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UsrUser', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$0.ModelEntity>(1, _omitFieldNames ? '' : 'baseEntity', subBuilder: $0.ModelEntity.create)
    ..e<UsrUserType>(2, _omitFieldNames ? '' : 'userType', $pb.PbFieldType.OE, defaultOrMaker: UsrUserType.USR_USER_TYPE_UNSPECIFIED, valueOf: UsrUserType.valueOf, enumValues: UsrUserType.values)
    ..e<UsrUserState>(3, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: UsrUserState.USR_USER_STATE_USER_UNSPECIFIED, valueOf: UsrUserState.valueOf, enumValues: UsrUserState.values)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'permissions', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(5, _omitFieldNames ? '' : 'alias')
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'certificate', $pb.PbFieldType.OY)
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'birthDate', subBuilder: $1.Timestamp.create)
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'firstKey', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$1.Timestamp>(9, _omitFieldNames ? '' : 'firstConnAt', subBuilder: $1.Timestamp.create)
    ..aOS(10, _omitFieldNames ? '' : 'locale')
    ..a<$core.int>(11, _omitFieldNames ? '' : 'therapistId', $pb.PbFieldType.OU3)
    ..a<$core.int>(12, _omitFieldNames ? '' : 'deviceId', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UsrUser clone() => UsrUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UsrUser copyWith(void Function(UsrUser) updates) => super.copyWith((message) => updates(message as UsrUser)) as UsrUser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UsrUser create() => UsrUser._();
  UsrUser createEmptyInstance() => create();
  static $pb.PbList<UsrUser> createRepeated() => $pb.PbList<UsrUser>();
  @$core.pragma('dart2js:noInline')
  static UsrUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsrUser>(create);
  static UsrUser? _defaultInstance;

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
  UsrUserType get userType => $_getN(1);
  @$pb.TagNumber(2)
  set userType(UsrUserType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserType() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserType() => clearField(2);

  @$pb.TagNumber(3)
  UsrUserState get state => $_getN(2);
  @$pb.TagNumber(3)
  set state(UsrUserState v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasState() => $_has(2);
  @$pb.TagNumber(3)
  void clearState() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get permissions => $_getI64(3);
  @$pb.TagNumber(4)
  set permissions($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPermissions() => $_has(3);
  @$pb.TagNumber(4)
  void clearPermissions() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get alias => $_getSZ(4);
  @$pb.TagNumber(5)
  set alias($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAlias() => $_has(4);
  @$pb.TagNumber(5)
  void clearAlias() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get certificate => $_getN(5);
  @$pb.TagNumber(6)
  set certificate($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCertificate() => $_has(5);
  @$pb.TagNumber(6)
  void clearCertificate() => clearField(6);

  @$pb.TagNumber(7)
  $1.Timestamp get birthDate => $_getN(6);
  @$pb.TagNumber(7)
  set birthDate($1.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasBirthDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearBirthDate() => clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureBirthDate() => $_ensure(6);

  @$pb.TagNumber(8)
  $fixnum.Int64 get firstKey => $_getI64(7);
  @$pb.TagNumber(8)
  set firstKey($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFirstKey() => $_has(7);
  @$pb.TagNumber(8)
  void clearFirstKey() => clearField(8);

  @$pb.TagNumber(9)
  $1.Timestamp get firstConnAt => $_getN(8);
  @$pb.TagNumber(9)
  set firstConnAt($1.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasFirstConnAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearFirstConnAt() => clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensureFirstConnAt() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get locale => $_getSZ(9);
  @$pb.TagNumber(10)
  set locale($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLocale() => $_has(9);
  @$pb.TagNumber(10)
  void clearLocale() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get therapistId => $_getIZ(10);
  @$pb.TagNumber(11)
  set therapistId($core.int v) { $_setUnsignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasTherapistId() => $_has(10);
  @$pb.TagNumber(11)
  void clearTherapistId() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get deviceId => $_getIZ(11);
  @$pb.TagNumber(12)
  set deviceId($core.int v) { $_setUnsignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasDeviceId() => $_has(11);
  @$pb.TagNumber(12)
  void clearDeviceId() => clearField(12);
}

/// Representació d'una llista d'usuaris.
class UsrUsersList extends $pb.GeneratedMessage {
  factory UsrUsersList({
    $core.Iterable<UsrUser>? elms,
  }) {
    final $result = create();
    if (elms != null) {
      $result.elms.addAll(elms);
    }
    return $result;
  }
  UsrUsersList._() : super();
  factory UsrUsersList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UsrUsersList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UsrUsersList', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<UsrUser>(1, _omitFieldNames ? '' : 'elms', $pb.PbFieldType.PM, subBuilder: UsrUser.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UsrUsersList clone() => UsrUsersList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UsrUsersList copyWith(void Function(UsrUsersList) updates) => super.copyWith((message) => updates(message as UsrUsersList)) as UsrUsersList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UsrUsersList create() => UsrUsersList._();
  UsrUsersList createEmptyInstance() => create();
  static $pb.PbList<UsrUsersList> createRepeated() => $pb.PbList<UsrUsersList>();
  @$core.pragma('dart2js:noInline')
  static UsrUsersList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsrUsersList>(create);
  static UsrUsersList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UsrUser> get elms => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
