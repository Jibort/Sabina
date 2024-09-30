//
//  Generated code. Do not modify.
//  source: dismod/dis_goal.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../model_entity.pb.dart' as $0;
import 'dis_phase.pb.dart' as $1;

/// Definició d'un objectiu de la fase d'una patologia.
class DisGoal extends $pb.GeneratedMessage {
  factory DisGoal({
    $0.ModelEntity? baseEntity,
    $core.int? idx,
    $core.String? nameKey,
    $1.DisPhase? phase,
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
    if (phase != null) {
      $result.phase = phase;
    }
    if (descKey != null) {
      $result.descKey = descKey;
    }
    return $result;
  }
  DisGoal._() : super();
  factory DisGoal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DisGoal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DisGoal', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$0.ModelEntity>(1, _omitFieldNames ? '' : 'baseEntity', subBuilder: $0.ModelEntity.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'idx', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'nameKey')
    ..aOM<$1.DisPhase>(4, _omitFieldNames ? '' : 'phase', subBuilder: $1.DisPhase.create)
    ..aOS(5, _omitFieldNames ? '' : 'descKey')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DisGoal clone() => DisGoal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DisGoal copyWith(void Function(DisGoal) updates) => super.copyWith((message) => updates(message as DisGoal)) as DisGoal;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisGoal create() => DisGoal._();
  DisGoal createEmptyInstance() => create();
  static $pb.PbList<DisGoal> createRepeated() => $pb.PbList<DisGoal>();
  @$core.pragma('dart2js:noInline')
  static DisGoal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DisGoal>(create);
  static DisGoal? _defaultInstance;

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
  $1.DisPhase get phase => $_getN(3);
  @$pb.TagNumber(4)
  set phase($1.DisPhase v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPhase() => $_has(3);
  @$pb.TagNumber(4)
  void clearPhase() => clearField(4);
  @$pb.TagNumber(4)
  $1.DisPhase ensurePhase() => $_ensure(3);

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
