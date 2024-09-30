//
//  Generated code. Do not modify.
//  source: lstmod/lst_option_list.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../model_entity.pb.dart' as $0;
import 'lst_list_category.pb.dart' as $1;

/// Definició d'una llista d'opcions.
class LstOptionList extends $pb.GeneratedMessage {
  factory LstOptionList({
    $0.ModelEntity? baseEntity,
    $core.String? nameKey,
    $core.String? descKey,
    $1.LstListCategory? category,
    $core.bool? alpha,
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
    if (category != null) {
      $result.category = category;
    }
    if (alpha != null) {
      $result.alpha = alpha;
    }
    return $result;
  }
  LstOptionList._() : super();
  factory LstOptionList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LstOptionList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LstOptionList', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$0.ModelEntity>(1, _omitFieldNames ? '' : 'baseEntity', subBuilder: $0.ModelEntity.create)
    ..aOS(2, _omitFieldNames ? '' : 'nameKey')
    ..aOS(3, _omitFieldNames ? '' : 'descKey')
    ..aOM<$1.LstListCategory>(4, _omitFieldNames ? '' : 'category', subBuilder: $1.LstListCategory.create)
    ..aOB(5, _omitFieldNames ? '' : 'alpha')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LstOptionList clone() => LstOptionList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LstOptionList copyWith(void Function(LstOptionList) updates) => super.copyWith((message) => updates(message as LstOptionList)) as LstOptionList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LstOptionList create() => LstOptionList._();
  LstOptionList createEmptyInstance() => create();
  static $pb.PbList<LstOptionList> createRepeated() => $pb.PbList<LstOptionList>();
  @$core.pragma('dart2js:noInline')
  static LstOptionList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LstOptionList>(create);
  static LstOptionList? _defaultInstance;

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
  $1.LstListCategory get category => $_getN(3);
  @$pb.TagNumber(4)
  set category($1.LstListCategory v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCategory() => $_has(3);
  @$pb.TagNumber(4)
  void clearCategory() => clearField(4);
  @$pb.TagNumber(4)
  $1.LstListCategory ensureCategory() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get alpha => $_getBF(4);
  @$pb.TagNumber(5)
  set alpha($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAlpha() => $_has(4);
  @$pb.TagNumber(5)
  void clearAlpha() => clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
