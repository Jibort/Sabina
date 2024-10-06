//
//  Generated code. Do not modify.
//  source: model_entity.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'gbl_timestamp.pb.dart' as $0;

/// Camps clau i de seguiment.
class ModelEntity extends $pb.GeneratedMessage {
  factory ModelEntity({
    $core.int? localId,
    $core.int? id,
    $core.int? createdBy,
    $0.Timestamp? createdAt,
    $core.int? updatedBy,
    $0.Timestamp? updatedAt,
    $core.bool? isNew,
    $core.bool? isUpdated,
    $core.bool? isDeleted,
  }) {
    final $result = create();
    if (localId != null) {
      $result.localId = localId;
    }
    if (id != null) {
      $result.id = id;
    }
    if (createdBy != null) {
      $result.createdBy = createdBy;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedBy != null) {
      $result.updatedBy = updatedBy;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (isNew != null) {
      $result.isNew = isNew;
    }
    if (isUpdated != null) {
      $result.isUpdated = isUpdated;
    }
    if (isDeleted != null) {
      $result.isDeleted = isDeleted;
    }
    return $result;
  }
  ModelEntity._() : super();
  factory ModelEntity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ModelEntity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ModelEntity', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'localId', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'createdBy', $pb.PbFieldType.OU3)
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'updatedBy', $pb.PbFieldType.OU3)
    ..aOM<$0.Timestamp>(6, _omitFieldNames ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..aOB(7, _omitFieldNames ? '' : 'isNew')
    ..aOB(8, _omitFieldNames ? '' : 'isUpdated')
    ..aOB(9, _omitFieldNames ? '' : 'isDeleted')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ModelEntity clone() => ModelEntity()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ModelEntity copyWith(void Function(ModelEntity) updates) => super.copyWith((message) => updates(message as ModelEntity)) as ModelEntity;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ModelEntity create() => ModelEntity._();
  ModelEntity createEmptyInstance() => create();
  static $pb.PbList<ModelEntity> createRepeated() => $pb.PbList<ModelEntity>();
  @$core.pragma('dart2js:noInline')
  static ModelEntity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ModelEntity>(create);
  static ModelEntity? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get localId => $_getIZ(0);
  @$pb.TagNumber(1)
  set localId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocalId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocalId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get createdBy => $_getIZ(2);
  @$pb.TagNumber(3)
  set createdBy($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatedBy() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedBy() => clearField(3);

  @$pb.TagNumber(4)
  $0.Timestamp get createdAt => $_getN(3);
  @$pb.TagNumber(4)
  set createdAt($0.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureCreatedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get updatedBy => $_getIZ(4);
  @$pb.TagNumber(5)
  set updatedBy($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUpdatedBy() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdatedBy() => clearField(5);

  @$pb.TagNumber(6)
  $0.Timestamp get updatedAt => $_getN(5);
  @$pb.TagNumber(6)
  set updatedAt($0.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasUpdatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdatedAt() => clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureUpdatedAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.bool get isNew => $_getBF(6);
  @$pb.TagNumber(7)
  set isNew($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsNew() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsNew() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isUpdated => $_getBF(7);
  @$pb.TagNumber(8)
  set isUpdated($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIsUpdated() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsUpdated() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isDeleted => $_getBF(8);
  @$pb.TagNumber(9)
  set isDeleted($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsDeleted() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsDeleted() => clearField(9);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
