//
//  Generated code. Do not modify.
//  source: emomod/emo_services.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../gbl_timestamp.pb.dart' as $4;

/// Emprempta digital de EmoMood.
class GbMoodFingerPrint extends $pb.GeneratedMessage {
  factory GbMoodFingerPrint({
    $core.int? lastMoodId,
    $4.Timestamp? lastMoodUpdate,
  }) {
    final $result = create();
    if (lastMoodId != null) {
      $result.lastMoodId = lastMoodId;
    }
    if (lastMoodUpdate != null) {
      $result.lastMoodUpdate = lastMoodUpdate;
    }
    return $result;
  }
  GbMoodFingerPrint._() : super();
  factory GbMoodFingerPrint.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GbMoodFingerPrint.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GbMoodFingerPrint', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'lastMoodId', $pb.PbFieldType.O3)
    ..aOM<$4.Timestamp>(2, _omitFieldNames ? '' : 'lastMoodUpdate', subBuilder: $4.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GbMoodFingerPrint clone() => GbMoodFingerPrint()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GbMoodFingerPrint copyWith(void Function(GbMoodFingerPrint) updates) => super.copyWith((message) => updates(message as GbMoodFingerPrint)) as GbMoodFingerPrint;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GbMoodFingerPrint create() => GbMoodFingerPrint._();
  GbMoodFingerPrint createEmptyInstance() => create();
  static $pb.PbList<GbMoodFingerPrint> createRepeated() => $pb.PbList<GbMoodFingerPrint>();
  @$core.pragma('dart2js:noInline')
  static GbMoodFingerPrint getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GbMoodFingerPrint>(create);
  static GbMoodFingerPrint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get lastMoodId => $_getIZ(0);
  @$pb.TagNumber(1)
  set lastMoodId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastMoodId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastMoodId() => clearField(1);

  @$pb.TagNumber(2)
  $4.Timestamp get lastMoodUpdate => $_getN(1);
  @$pb.TagNumber(2)
  set lastMoodUpdate($4.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastMoodUpdate() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastMoodUpdate() => clearField(2);
  @$pb.TagNumber(2)
  $4.Timestamp ensureLastMoodUpdate() => $_ensure(1);
}

/// Emprempta digital de EmoEmotion.
class GbEmotionFingerPrint extends $pb.GeneratedMessage {
  factory GbEmotionFingerPrint({
    $core.int? lastEmotionId,
    $4.Timestamp? lastEmotionUpdate,
  }) {
    final $result = create();
    if (lastEmotionId != null) {
      $result.lastEmotionId = lastEmotionId;
    }
    if (lastEmotionUpdate != null) {
      $result.lastEmotionUpdate = lastEmotionUpdate;
    }
    return $result;
  }
  GbEmotionFingerPrint._() : super();
  factory GbEmotionFingerPrint.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GbEmotionFingerPrint.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GbEmotionFingerPrint', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'lastEmotionId', $pb.PbFieldType.O3)
    ..aOM<$4.Timestamp>(2, _omitFieldNames ? '' : 'lastEmotionUpdate', subBuilder: $4.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GbEmotionFingerPrint clone() => GbEmotionFingerPrint()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GbEmotionFingerPrint copyWith(void Function(GbEmotionFingerPrint) updates) => super.copyWith((message) => updates(message as GbEmotionFingerPrint)) as GbEmotionFingerPrint;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GbEmotionFingerPrint create() => GbEmotionFingerPrint._();
  GbEmotionFingerPrint createEmptyInstance() => create();
  static $pb.PbList<GbEmotionFingerPrint> createRepeated() => $pb.PbList<GbEmotionFingerPrint>();
  @$core.pragma('dart2js:noInline')
  static GbEmotionFingerPrint getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GbEmotionFingerPrint>(create);
  static GbEmotionFingerPrint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get lastEmotionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set lastEmotionId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastEmotionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastEmotionId() => clearField(1);

  @$pb.TagNumber(2)
  $4.Timestamp get lastEmotionUpdate => $_getN(1);
  @$pb.TagNumber(2)
  set lastEmotionUpdate($4.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastEmotionUpdate() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastEmotionUpdate() => clearField(2);
  @$pb.TagNumber(2)
  $4.Timestamp ensureLastEmotionUpdate() => $_ensure(1);
}

/// Emprempta digital del mòdul EMOMOD.
class GbSyncEmoMod extends $pb.GeneratedMessage {
  factory GbSyncEmoMod({
    $core.int? userId,
    $core.String? userLang,
    GbMoodFingerPrint? emoMood,
    GbEmotionFingerPrint? emoEmotion,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (userLang != null) {
      $result.userLang = userLang;
    }
    if (emoMood != null) {
      $result.emoMood = emoMood;
    }
    if (emoEmotion != null) {
      $result.emoEmotion = emoEmotion;
    }
    return $result;
  }
  GbSyncEmoMod._() : super();
  factory GbSyncEmoMod.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GbSyncEmoMod.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GbSyncEmoMod', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'userLang')
    ..aOM<GbMoodFingerPrint>(3, _omitFieldNames ? '' : 'emoMood', subBuilder: GbMoodFingerPrint.create)
    ..aOM<GbEmotionFingerPrint>(4, _omitFieldNames ? '' : 'emoEmotion', subBuilder: GbEmotionFingerPrint.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GbSyncEmoMod clone() => GbSyncEmoMod()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GbSyncEmoMod copyWith(void Function(GbSyncEmoMod) updates) => super.copyWith((message) => updates(message as GbSyncEmoMod)) as GbSyncEmoMod;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GbSyncEmoMod create() => GbSyncEmoMod._();
  GbSyncEmoMod createEmptyInstance() => create();
  static $pb.PbList<GbSyncEmoMod> createRepeated() => $pb.PbList<GbSyncEmoMod>();
  @$core.pragma('dart2js:noInline')
  static GbSyncEmoMod getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GbSyncEmoMod>(create);
  static GbSyncEmoMod? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userLang => $_getSZ(1);
  @$pb.TagNumber(2)
  set userLang($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserLang() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserLang() => clearField(2);

  @$pb.TagNumber(3)
  GbMoodFingerPrint get emoMood => $_getN(2);
  @$pb.TagNumber(3)
  set emoMood(GbMoodFingerPrint v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmoMood() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmoMood() => clearField(3);
  @$pb.TagNumber(3)
  GbMoodFingerPrint ensureEmoMood() => $_ensure(2);

  @$pb.TagNumber(4)
  GbEmotionFingerPrint get emoEmotion => $_getN(3);
  @$pb.TagNumber(4)
  set emoEmotion(GbEmotionFingerPrint v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasEmoEmotion() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmoEmotion() => clearField(4);
  @$pb.TagNumber(4)
  GbEmotionFingerPrint ensureEmoEmotion() => $_ensure(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
