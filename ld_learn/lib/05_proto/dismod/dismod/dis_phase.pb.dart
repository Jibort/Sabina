//
//  Generated code. Do not modify.
//  source: dismod/dis_phase.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../model_entity.pb.dart' as $0;
import 'dis_disease.pb.dart' as $1;

/// Definició d'una fase d'una patologia.
class DisPhase extends $pb.GeneratedMessage {
  factory DisPhase({
    $0.ModelEntity? baseEntity,
    $core.int? idx,
    $core.String? nameKey,
    $1.DisDisease? disease,
    $core.String? descKey,
  }) {
    final $result = create();
    if (baseEntity != null) {
      $result.baseEntity = baseEntity;
    }
    if (idx != null) {
      $result.idx = idx;
    }
    if (nameKey != null) {
      $result.nameKey = nameKey;
    }
    if (disease != null) {
      $result.disease = disease;
    }
    if (descKey != null) {
      $result.descKey = descKey;
    }
    return $result;
  }
  DisPhase._() : super();
  factory DisPhase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DisPhase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DisPhase', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$0.ModelEntity>(1, _omitFieldNames ? '' : 'baseEntity', subBuilder: $0.ModelEntity.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'idx', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'nameKey')
    ..aOM<$1.DisDisease>(4, _omitFieldNames ? '' : 'disease', subBuilder: $1.DisDisease.create)
    ..aOS(5, _omitFieldNames ? '' : 'descKey')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DisPhase clone() => DisPhase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DisPhase copyWith(void Function(DisPhase) updates) => super.copyWith((message) => updates(message as DisPhase)) as DisPhase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisPhase create() => DisPhase._();
  DisPhase createEmptyInstance() => create();
  static $pb.PbList<DisPhase> createRepeated() => $pb.PbList<DisPhase>();
  @$core.pragma('dart2js:noInline')
  static DisPhase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DisPhase>(create);
  static DisPhase? _defaultInstance;

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
  $core.int get idx => $_getIZ(1);
  @$pb.TagNumber(2)
  set idx($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdx() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdx() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nameKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set nameKey($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNameKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearNameKey() => clearField(3);

  @$pb.TagNumber(4)
  $1.DisDisease get disease => $_getN(3);
  @$pb.TagNumber(4)
  set disease($1.DisDisease v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDisease() => $_has(3);
  @$pb.TagNumber(4)
  void clearDisease() => clearField(4);
  @$pb.TagNumber(4)
  $1.DisDisease ensureDisease() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get descKey => $_getSZ(4);
  @$pb.TagNumber(5)
  set descKey($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescKey() => clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
