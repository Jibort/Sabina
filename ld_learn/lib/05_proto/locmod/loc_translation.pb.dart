//
//  Generated code. Do not modify.
//  source: locmod/loc_translation.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Traduccions de les claus de text.
class LocTranslation extends $pb.GeneratedMessage {
  factory LocTranslation({
    $core.String? id,
    $core.String? localeId,
    $core.String? textKey,
    $core.String? literal,
    $core.int? iteration,
    $core.bool? isNew,
    $core.bool? isUpdated,
    $core.bool? isDeleted,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (localeId != null) {
      $result.localeId = localeId;
    }
    if (textKey != null) {
      $result.textKey = textKey;
    }
    if (literal != null) {
      $result.literal = literal;
    }
    if (iteration != null) {
      $result.iteration = iteration;
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
  LocTranslation._() : super();
  factory LocTranslation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LocTranslation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LocTranslation', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'localeId')
    ..aOS(3, _omitFieldNames ? '' : 'textKey')
    ..aOS(4, _omitFieldNames ? '' : 'literal')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'iteration', $pb.PbFieldType.O3)
    ..aOB(6, _omitFieldNames ? '' : 'isNew')
    ..aOB(7, _omitFieldNames ? '' : 'isUpdated')
    ..aOB(8, _omitFieldNames ? '' : 'isDeleted')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LocTranslation clone() => LocTranslation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LocTranslation copyWith(void Function(LocTranslation) updates) => super.copyWith((message) => updates(message as LocTranslation)) as LocTranslation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocTranslation create() => LocTranslation._();
  LocTranslation createEmptyInstance() => create();
  static $pb.PbList<LocTranslation> createRepeated() => $pb.PbList<LocTranslation>();
  @$core.pragma('dart2js:noInline')
  static LocTranslation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LocTranslation>(create);
  static LocTranslation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get localeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set localeId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocaleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocaleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get textKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set textKey($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTextKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearTextKey() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get literal => $_getSZ(3);
  @$pb.TagNumber(4)
  set literal($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLiteral() => $_has(3);
  @$pb.TagNumber(4)
  void clearLiteral() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get iteration => $_getIZ(4);
  @$pb.TagNumber(5)
  set iteration($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIteration() => $_has(4);
  @$pb.TagNumber(5)
  void clearIteration() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isNew => $_getBF(5);
  @$pb.TagNumber(6)
  set isNew($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsNew() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsNew() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isUpdated => $_getBF(6);
  @$pb.TagNumber(7)
  set isUpdated($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsUpdated() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsUpdated() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isDeleted => $_getBF(7);
  @$pb.TagNumber(8)
  set isDeleted($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIsDeleted() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsDeleted() => clearField(8);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
