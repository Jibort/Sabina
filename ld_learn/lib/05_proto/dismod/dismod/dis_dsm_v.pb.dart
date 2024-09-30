//
//  Generated code. Do not modify.
//  source: dismod/dis_dsm_v.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Codis de les patologies segons el DSM-V.
class DisDsmV extends $pb.GeneratedMessage {
  factory DisDsmV({
    $core.int? id,
    $core.String? name,
    $core.String? icd10,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (icd10 != null) {
      $result.icd10 = icd10;
    }
    return $result;
  }
  DisDsmV._() : super();
  factory DisDsmV.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DisDsmV.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DisDsmV', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icd10')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DisDsmV clone() => DisDsmV()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DisDsmV copyWith(void Function(DisDsmV) updates) => super.copyWith((message) => updates(message as DisDsmV)) as DisDsmV;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisDsmV create() => DisDsmV._();
  DisDsmV createEmptyInstance() => create();
  static $pb.PbList<DisDsmV> createRepeated() => $pb.PbList<DisDsmV>();
  @$core.pragma('dart2js:noInline')
  static DisDsmV getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DisDsmV>(create);
  static DisDsmV? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icd10 => $_getSZ(2);
  @$pb.TagNumber(3)
  set icd10($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIcd10() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcd10() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
