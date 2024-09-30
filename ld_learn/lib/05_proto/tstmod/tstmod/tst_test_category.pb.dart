//
//  Generated code. Do not modify.
//  source: tstmod/tst_test_category.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../model_entity.pb.dart' as $0;

/// Definició de les catergories de tests.
class TstTestCategory extends $pb.GeneratedMessage {
  factory TstTestCategory({
    $0.ModelEntity? baseEntity,
    $core.String? titleKey,
    $core.String? descKey,
    TstTestCategory? parent,
  }) {
    final $result = create();
    if (baseEntity != null) {
      $result.baseEntity = baseEntity;
    }
    if (titleKey != null) {
      $result.titleKey = titleKey;
    }
    if (descKey != null) {
      $result.descKey = descKey;
    }
    if (parent != null) {
      $result.parent = parent;
    }
    return $result;
  }
  TstTestCategory._() : super();
  factory TstTestCategory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TstTestCategory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TstTestCategory', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$0.ModelEntity>(1, _omitFieldNames ? '' : 'baseEntity', subBuilder: $0.ModelEntity.create)
    ..aOS(2, _omitFieldNames ? '' : 'titleKey')
    ..aOS(3, _omitFieldNames ? '' : 'descKey')
    ..aOM<TstTestCategory>(4, _omitFieldNames ? '' : 'parent', subBuilder: TstTestCategory.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TstTestCategory clone() => TstTestCategory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TstTestCategory copyWith(void Function(TstTestCategory) updates) => super.copyWith((message) => updates(message as TstTestCategory)) as TstTestCategory;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TstTestCategory create() => TstTestCategory._();
  TstTestCategory createEmptyInstance() => create();
  static $pb.PbList<TstTestCategory> createRepeated() => $pb.PbList<TstTestCategory>();
  @$core.pragma('dart2js:noInline')
  static TstTestCategory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TstTestCategory>(create);
  static TstTestCategory? _defaultInstance;

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
  $core.String get titleKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set titleKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitleKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitleKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get descKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set descKey($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescKey() => clearField(3);

  @$pb.TagNumber(4)
  TstTestCategory get parent => $_getN(3);
  @$pb.TagNumber(4)
  set parent(TstTestCategory v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasParent() => $_has(3);
  @$pb.TagNumber(4)
  void clearParent() => clearField(4);
  @$pb.TagNumber(4)
  TstTestCategory ensureParent() => $_ensure(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
