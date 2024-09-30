//
//  Generated code. Do not modify.
//  source: usrmod/usr_flows.proto
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
import 'usr_device.pb.dart' as $2;
import 'usr_user.pb.dart' as $0;
import 'usr_user.pbenum.dart' as $0;

/// Flux de petició per a un nou usuari.
class UsrFlowCreateUser extends $pb.GeneratedMessage {
  factory UsrFlowCreateUser({
    $core.int? createdBy,
    $0.UsrUserType? userType,
    $fixnum.Int64? permissions,
    $core.String? alias,
    $0.UsrUser? therapist,
    $1.Timestamp? birthDate,
    $core.String? defLang,
  }) {
    final $result = create();
    if (createdBy != null) {
      $result.createdBy = createdBy;
    }
    if (userType != null) {
      $result.userType = userType;
    }
    if (permissions != null) {
      $result.permissions = permissions;
    }
    if (alias != null) {
      $result.alias = alias;
    }
    if (therapist != null) {
      $result.therapist = therapist;
    }
    if (birthDate != null) {
      $result.birthDate = birthDate;
    }
    if (defLang != null) {
      $result.defLang = defLang;
    }
    return $result;
  }
  UsrFlowCreateUser._() : super();
  factory UsrFlowCreateUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UsrFlowCreateUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UsrFlowCreateUser', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'createdBy', $pb.PbFieldType.O3)
    ..e<$0.UsrUserType>(2, _omitFieldNames ? '' : 'userType', $pb.PbFieldType.OE, defaultOrMaker: $0.UsrUserType.USR_USER_TYPE_UNSPECIFIED, valueOf: $0.UsrUserType.valueOf, enumValues: $0.UsrUserType.values)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'permissions', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'alias')
    ..aOM<$0.UsrUser>(5, _omitFieldNames ? '' : 'therapist', subBuilder: $0.UsrUser.create)
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'birthDate', subBuilder: $1.Timestamp.create)
    ..aOS(7, _omitFieldNames ? '' : 'defLang')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UsrFlowCreateUser clone() => UsrFlowCreateUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UsrFlowCreateUser copyWith(void Function(UsrFlowCreateUser) updates) => super.copyWith((message) => updates(message as UsrFlowCreateUser)) as UsrFlowCreateUser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UsrFlowCreateUser create() => UsrFlowCreateUser._();
  UsrFlowCreateUser createEmptyInstance() => create();
  static $pb.PbList<UsrFlowCreateUser> createRepeated() => $pb.PbList<UsrFlowCreateUser>();
  @$core.pragma('dart2js:noInline')
  static UsrFlowCreateUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsrFlowCreateUser>(create);
  static UsrFlowCreateUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get createdBy => $_getIZ(0);
  @$pb.TagNumber(1)
  set createdBy($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCreatedBy() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreatedBy() => clearField(1);

  @$pb.TagNumber(2)
  $0.UsrUserType get userType => $_getN(1);
  @$pb.TagNumber(2)
  set userType($0.UsrUserType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserType() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserType() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get permissions => $_getI64(2);
  @$pb.TagNumber(3)
  set permissions($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPermissions() => $_has(2);
  @$pb.TagNumber(3)
  void clearPermissions() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get alias => $_getSZ(3);
  @$pb.TagNumber(4)
  set alias($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAlias() => $_has(3);
  @$pb.TagNumber(4)
  void clearAlias() => clearField(4);

  @$pb.TagNumber(5)
  $0.UsrUser get therapist => $_getN(4);
  @$pb.TagNumber(5)
  set therapist($0.UsrUser v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTherapist() => $_has(4);
  @$pb.TagNumber(5)
  void clearTherapist() => clearField(5);
  @$pb.TagNumber(5)
  $0.UsrUser ensureTherapist() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Timestamp get birthDate => $_getN(5);
  @$pb.TagNumber(6)
  set birthDate($1.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasBirthDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearBirthDate() => clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureBirthDate() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get defLang => $_getSZ(6);
  @$pb.TagNumber(7)
  set defLang($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDefLang() => $_has(6);
  @$pb.TagNumber(7)
  void clearDefLang() => clearField(7);
}

/// Flux de petició d'actualització d'un usuari.
class UsrFlowUpdateUser extends $pb.GeneratedMessage {
  factory UsrFlowUpdateUser({
    $core.int? updatedBy,
    $core.int? userId,
    $fixnum.Int64? permissions,
    $core.String? alias,
    $core.List<$core.int>? certificate,
    $0.UsrUserState? state,
    $0.UsrUser? therapist,
    $2.UsrDevice? lastDevice,
    $1.Timestamp? birthDate,
    $core.String? defLang,
  }) {
    final $result = create();
    if (updatedBy != null) {
      $result.updatedBy = updatedBy;
    }
    if (userId != null) {
      $result.userId = userId;
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
    if (state != null) {
      $result.state = state;
    }
    if (therapist != null) {
      $result.therapist = therapist;
    }
    if (lastDevice != null) {
      $result.lastDevice = lastDevice;
    }
    if (birthDate != null) {
      $result.birthDate = birthDate;
    }
    if (defLang != null) {
      $result.defLang = defLang;
    }
    return $result;
  }
  UsrFlowUpdateUser._() : super();
  factory UsrFlowUpdateUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UsrFlowUpdateUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UsrFlowUpdateUser', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'updatedBy', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'permissions', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'alias')
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'certificate', $pb.PbFieldType.OY)
    ..e<$0.UsrUserState>(6, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: $0.UsrUserState.USR_USER_STATE_USER_UNSPECIFIED, valueOf: $0.UsrUserState.valueOf, enumValues: $0.UsrUserState.values)
    ..aOM<$0.UsrUser>(7, _omitFieldNames ? '' : 'therapist', subBuilder: $0.UsrUser.create)
    ..aOM<$2.UsrDevice>(8, _omitFieldNames ? '' : 'lastDevice', subBuilder: $2.UsrDevice.create)
    ..aOM<$1.Timestamp>(9, _omitFieldNames ? '' : 'birthDate', subBuilder: $1.Timestamp.create)
    ..aOS(10, _omitFieldNames ? '' : 'defLang')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UsrFlowUpdateUser clone() => UsrFlowUpdateUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UsrFlowUpdateUser copyWith(void Function(UsrFlowUpdateUser) updates) => super.copyWith((message) => updates(message as UsrFlowUpdateUser)) as UsrFlowUpdateUser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UsrFlowUpdateUser create() => UsrFlowUpdateUser._();
  UsrFlowUpdateUser createEmptyInstance() => create();
  static $pb.PbList<UsrFlowUpdateUser> createRepeated() => $pb.PbList<UsrFlowUpdateUser>();
  @$core.pragma('dart2js:noInline')
  static UsrFlowUpdateUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsrFlowUpdateUser>(create);
  static UsrFlowUpdateUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get updatedBy => $_getIZ(0);
  @$pb.TagNumber(1)
  set updatedBy($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUpdatedBy() => $_has(0);
  @$pb.TagNumber(1)
  void clearUpdatedBy() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userId => $_getIZ(1);
  @$pb.TagNumber(2)
  set userId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get permissions => $_getI64(2);
  @$pb.TagNumber(3)
  set permissions($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPermissions() => $_has(2);
  @$pb.TagNumber(3)
  void clearPermissions() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get alias => $_getSZ(3);
  @$pb.TagNumber(4)
  set alias($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAlias() => $_has(3);
  @$pb.TagNumber(4)
  void clearAlias() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get certificate => $_getN(4);
  @$pb.TagNumber(5)
  set certificate($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCertificate() => $_has(4);
  @$pb.TagNumber(5)
  void clearCertificate() => clearField(5);

  @$pb.TagNumber(6)
  $0.UsrUserState get state => $_getN(5);
  @$pb.TagNumber(6)
  set state($0.UsrUserState v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasState() => $_has(5);
  @$pb.TagNumber(6)
  void clearState() => clearField(6);

  @$pb.TagNumber(7)
  $0.UsrUser get therapist => $_getN(6);
  @$pb.TagNumber(7)
  set therapist($0.UsrUser v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasTherapist() => $_has(6);
  @$pb.TagNumber(7)
  void clearTherapist() => clearField(7);
  @$pb.TagNumber(7)
  $0.UsrUser ensureTherapist() => $_ensure(6);

  @$pb.TagNumber(8)
  $2.UsrDevice get lastDevice => $_getN(7);
  @$pb.TagNumber(8)
  set lastDevice($2.UsrDevice v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasLastDevice() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastDevice() => clearField(8);
  @$pb.TagNumber(8)
  $2.UsrDevice ensureLastDevice() => $_ensure(7);

  @$pb.TagNumber(9)
  $1.Timestamp get birthDate => $_getN(8);
  @$pb.TagNumber(9)
  set birthDate($1.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasBirthDate() => $_has(8);
  @$pb.TagNumber(9)
  void clearBirthDate() => clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensureBirthDate() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get defLang => $_getSZ(9);
  @$pb.TagNumber(10)
  set defLang($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDefLang() => $_has(9);
  @$pb.TagNumber(10)
  void clearDefLang() => clearField(10);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
