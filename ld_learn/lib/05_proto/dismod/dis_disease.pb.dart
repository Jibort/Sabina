//
//  Generated code. Do not modify.
//  source: dismod/dis_disease.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../model_entity.pb.dart' as $0;
import '../usrmod/usr_user.pb.dart' as $2;
import 'dis_dsm_v.pb.dart' as $1;

/// Definició d'una patologia segons un terapeuta.
class DisDisease extends $pb.GeneratedMessage {
  factory DisDisease({
    $0.ModelEntity? baseEntity,
    $core.String? nameKey,
    $core.String? descKey,
    $1.DisDsmV? dsmv,
    $2.UsrUser? theraphist,
  }) {
    final $result = create();
    if (baseEntity != null) {
      $result.baseEntity = baseEntity;
    }
    if (nameKey != null) {
      $result.nameKey = nameKey;
    }
    if (descKey != null) {
      $result.descKey = descKey;
    }
    if (dsmv != null) {
      $result.dsmv = dsmv;
    }
    if (theraphist != null) {
      $result.theraphist = theraphist;
    }
    return $result;
  }
  DisDisease._() : super();
  factory DisDisease.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DisDisease.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DisDisease', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$0.ModelEntity>(1, _omitFieldNames ? '' : 'baseEntity', subBuilder: $0.ModelEntity.create)
    ..aOS(2, _omitFieldNames ? '' : 'nameKey')
    ..aOS(3, _omitFieldNames ? '' : 'descKey')
    ..aOM<$1.DisDsmV>(4, _omitFieldNames ? '' : 'dsmv', subBuilder: $1.DisDsmV.create)
    ..aOM<$2.UsrUser>(5, _omitFieldNames ? '' : 'theraphist', subBuilder: $2.UsrUser.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DisDisease clone() => DisDisease()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DisDisease copyWith(void Function(DisDisease) updates) => super.copyWith((message) => updates(message as DisDisease)) as DisDisease;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisDisease create() => DisDisease._();
  DisDisease createEmptyInstance() => create();
  static $pb.PbList<DisDisease> createRepeated() => $pb.PbList<DisDisease>();
  @$core.pragma('dart2js:noInline')
  static DisDisease getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DisDisease>(create);
  static DisDisease? _defaultInstance;

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
  $core.String get nameKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set nameKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNameKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearNameKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get descKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set descKey($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescKey() => clearField(3);

  @$pb.TagNumber(4)
  $1.DisDsmV get dsmv => $_getN(3);
  @$pb.TagNumber(4)
  set dsmv($1.DisDsmV v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDsmv() => $_has(3);
  @$pb.TagNumber(4)
  void clearDsmv() => clearField(4);
  @$pb.TagNumber(4)
  $1.DisDsmV ensureDsmv() => $_ensure(3);

  @$pb.TagNumber(5)
  $2.UsrUser get theraphist => $_getN(4);
  @$pb.TagNumber(5)
  set theraphist($2.UsrUser v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTheraphist() => $_has(4);
  @$pb.TagNumber(5)
  void clearTheraphist() => clearField(5);
  @$pb.TagNumber(5)
  $2.UsrUser ensureTheraphist() => $_ensure(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
