//
//  Generated code. Do not modify.
//  source: usrmod/usr_fcm_history.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../gbl_timestamp.pb.dart' as $2;
import '../model_entity.pb.dart' as $0;
import 'usr_device.pb.dart' as $1;

/// Representació de l'històric de tokens Firebase.
class UsrFcmHistory extends $pb.GeneratedMessage {
  factory UsrFcmHistory({
    $0.ModelEntity? baseEntity,
    $core.String? token,
    $1.UsrDevice? device,
    $2.Timestamp? since,
    $core.bool? lastOne,
  }) {
    final $result = create();
    if (baseEntity != null) {
      $result.baseEntity = baseEntity;
    }
    if (token != null) {
      $result.token = token;
    }
    if (device != null) {
      $result.device = device;
    }
    if (since != null) {
      $result.since = since;
    }
    if (lastOne != null) {
      $result.lastOne = lastOne;
    }
    return $result;
  }
  UsrFcmHistory._() : super();
  factory UsrFcmHistory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UsrFcmHistory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UsrFcmHistory', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$0.ModelEntity>(1, _omitFieldNames ? '' : 'baseEntity', subBuilder: $0.ModelEntity.create)
    ..aOS(2, _omitFieldNames ? '' : 'token')
    ..aOM<$1.UsrDevice>(3, _omitFieldNames ? '' : 'device', subBuilder: $1.UsrDevice.create)
    ..aOM<$2.Timestamp>(4, _omitFieldNames ? '' : 'since', subBuilder: $2.Timestamp.create)
    ..aOB(5, _omitFieldNames ? '' : 'lastOne')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UsrFcmHistory clone() => UsrFcmHistory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UsrFcmHistory copyWith(void Function(UsrFcmHistory) updates) => super.copyWith((message) => updates(message as UsrFcmHistory)) as UsrFcmHistory;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UsrFcmHistory create() => UsrFcmHistory._();
  UsrFcmHistory createEmptyInstance() => create();
  static $pb.PbList<UsrFcmHistory> createRepeated() => $pb.PbList<UsrFcmHistory>();
  @$core.pragma('dart2js:noInline')
  static UsrFcmHistory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsrFcmHistory>(create);
  static UsrFcmHistory? _defaultInstance;

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
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);

  @$pb.TagNumber(3)
  $1.UsrDevice get device => $_getN(2);
  @$pb.TagNumber(3)
  set device($1.UsrDevice v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDevice() => $_has(2);
  @$pb.TagNumber(3)
  void clearDevice() => clearField(3);
  @$pb.TagNumber(3)
  $1.UsrDevice ensureDevice() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.Timestamp get since => $_getN(3);
  @$pb.TagNumber(4)
  set since($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSince() => $_has(3);
  @$pb.TagNumber(4)
  void clearSince() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureSince() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get lastOne => $_getBF(4);
  @$pb.TagNumber(5)
  set lastOne($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastOne() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastOne() => clearField(5);
}

/// Representació d'una llista de tokens d'un dispositiu.
class UsrFcmTokenaList extends $pb.GeneratedMessage {
  factory UsrFcmTokenaList({
    $core.Iterable<UsrFcmHistory>? elms,
  }) {
    final $result = create();
    if (elms != null) {
      $result.elms.addAll(elms);
    }
    return $result;
  }
  UsrFcmTokenaList._() : super();
  factory UsrFcmTokenaList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UsrFcmTokenaList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UsrFcmTokenaList', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<UsrFcmHistory>(1, _omitFieldNames ? '' : 'elms', $pb.PbFieldType.PM, subBuilder: UsrFcmHistory.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UsrFcmTokenaList clone() => UsrFcmTokenaList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UsrFcmTokenaList copyWith(void Function(UsrFcmTokenaList) updates) => super.copyWith((message) => updates(message as UsrFcmTokenaList)) as UsrFcmTokenaList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UsrFcmTokenaList create() => UsrFcmTokenaList._();
  UsrFcmTokenaList createEmptyInstance() => create();
  static $pb.PbList<UsrFcmTokenaList> createRepeated() => $pb.PbList<UsrFcmTokenaList>();
  @$core.pragma('dart2js:noInline')
  static UsrFcmTokenaList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsrFcmTokenaList>(create);
  static UsrFcmTokenaList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UsrFcmHistory> get elms => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
