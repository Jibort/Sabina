//
//  Generated code. Do not modify.
//  source: tstmod/tst_test.proto
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
import 'tst_test_category.pb.dart' as $1;

/// Definició d'un test d'avaluació.
class TstTest extends $pb.GeneratedMessage {
  factory TstTest({
    $0.ModelEntity? baseEntity,
    $1.TstTestCategory? category,
    $core.String? nameKey,
    $core.String? descKey,
    $core.String? instrKey,
    $core.int? version,
    TstTest? root,
    $2.UsrUser? therapist,
  }) {
    final $result = create();
    if (baseEntity != null) {
      $result.baseEntity = baseEntity;
    }
    if (category != null) {
      $result.category = category;
    }
    if (nameKey != null) {
      $result.nameKey = nameKey;
    }
    if (descKey != null) {
      $result.descKey = descKey;
    }
    if (instrKey != null) {
      $result.instrKey = instrKey;
    }
    if (version != null) {
      $result.version = version;
    }
    if (root != null) {
      $result.root = root;
    }
    if (therapist != null) {
      $result.therapist = therapist;
    }
    return $result;
  }
  TstTest._() : super();
  factory TstTest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TstTest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TstTest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$0.ModelEntity>(1, _omitFieldNames ? '' : 'baseEntity', subBuilder: $0.ModelEntity.create)
    ..aOM<$1.TstTestCategory>(2, _omitFieldNames ? '' : 'category', subBuilder: $1.TstTestCategory.create)
    ..aOS(3, _omitFieldNames ? '' : 'nameKey')
    ..aOS(4, _omitFieldNames ? '' : 'descKey')
    ..aOS(5, _omitFieldNames ? '' : 'instrKey')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..aOM<TstTest>(7, _omitFieldNames ? '' : 'root', subBuilder: TstTest.create)
    ..aOM<$2.UsrUser>(8, _omitFieldNames ? '' : 'therapist', subBuilder: $2.UsrUser.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TstTest clone() => TstTest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TstTest copyWith(void Function(TstTest) updates) => super.copyWith((message) => updates(message as TstTest)) as TstTest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TstTest create() => TstTest._();
  TstTest createEmptyInstance() => create();
  static $pb.PbList<TstTest> createRepeated() => $pb.PbList<TstTest>();
  @$core.pragma('dart2js:noInline')
  static TstTest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TstTest>(create);
  static TstTest? _defaultInstance;

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
  $1.TstTestCategory get category => $_getN(1);
  @$pb.TagNumber(2)
  set category($1.TstTestCategory v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCategory() => $_has(1);
  @$pb.TagNumber(2)
  void clearCategory() => clearField(2);
  @$pb.TagNumber(2)
  $1.TstTestCategory ensureCategory() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get nameKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set nameKey($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNameKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearNameKey() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get descKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set descKey($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescKey() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get instrKey => $_getSZ(4);
  @$pb.TagNumber(5)
  set instrKey($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasInstrKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearInstrKey() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get version => $_getIZ(5);
  @$pb.TagNumber(6)
  set version($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearVersion() => clearField(6);

  @$pb.TagNumber(7)
  TstTest get root => $_getN(6);
  @$pb.TagNumber(7)
  set root(TstTest v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasRoot() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoot() => clearField(7);
  @$pb.TagNumber(7)
  TstTest ensureRoot() => $_ensure(6);

  @$pb.TagNumber(8)
  $2.UsrUser get therapist => $_getN(7);
  @$pb.TagNumber(8)
  set therapist($2.UsrUser v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasTherapist() => $_has(7);
  @$pb.TagNumber(8)
  void clearTherapist() => clearField(8);
  @$pb.TagNumber(8)
  $2.UsrUser ensureTherapist() => $_ensure(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
