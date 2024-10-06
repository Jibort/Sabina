//
//  Generated code. Do not modify.
//  source: locmod/loc_services.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'loc_translation.pb.dart' as $1;

/// Emprempta digital de string.
class GbTextKeyFingerPrint extends $pb.GeneratedMessage {
  factory GbTextKeyFingerPrint({
    $core.int? lastTextKeyId,
  }) {
    final $result = create();
    if (lastTextKeyId != null) {
      $result.lastTextKeyId = lastTextKeyId;
    }
    return $result;
  }
  GbTextKeyFingerPrint._() : super();
  factory GbTextKeyFingerPrint.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GbTextKeyFingerPrint.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GbTextKeyFingerPrint', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'lastTextKeyId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GbTextKeyFingerPrint clone() => GbTextKeyFingerPrint()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GbTextKeyFingerPrint copyWith(void Function(GbTextKeyFingerPrint) updates) => super.copyWith((message) => updates(message as GbTextKeyFingerPrint)) as GbTextKeyFingerPrint;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GbTextKeyFingerPrint create() => GbTextKeyFingerPrint._();
  GbTextKeyFingerPrint createEmptyInstance() => create();
  static $pb.PbList<GbTextKeyFingerPrint> createRepeated() => $pb.PbList<GbTextKeyFingerPrint>();
  @$core.pragma('dart2js:noInline')
  static GbTextKeyFingerPrint getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GbTextKeyFingerPrint>(create);
  static GbTextKeyFingerPrint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get lastTextKeyId => $_getIZ(0);
  @$pb.TagNumber(1)
  set lastTextKeyId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastTextKeyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastTextKeyId() => clearField(1);
}

/// Emprempta digital de LocLocale.
class GbLocaleFingerPrint extends $pb.GeneratedMessage {
  factory GbLocaleFingerPrint({
    $core.int? lastLocationId,
  }) {
    final $result = create();
    if (lastLocationId != null) {
      $result.lastLocationId = lastLocationId;
    }
    return $result;
  }
  GbLocaleFingerPrint._() : super();
  factory GbLocaleFingerPrint.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GbLocaleFingerPrint.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GbLocaleFingerPrint', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'lastLocationId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GbLocaleFingerPrint clone() => GbLocaleFingerPrint()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GbLocaleFingerPrint copyWith(void Function(GbLocaleFingerPrint) updates) => super.copyWith((message) => updates(message as GbLocaleFingerPrint)) as GbLocaleFingerPrint;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GbLocaleFingerPrint create() => GbLocaleFingerPrint._();
  GbLocaleFingerPrint createEmptyInstance() => create();
  static $pb.PbList<GbLocaleFingerPrint> createRepeated() => $pb.PbList<GbLocaleFingerPrint>();
  @$core.pragma('dart2js:noInline')
  static GbLocaleFingerPrint getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GbLocaleFingerPrint>(create);
  static GbLocaleFingerPrint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get lastLocationId => $_getIZ(0);
  @$pb.TagNumber(1)
  set lastLocationId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastLocationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastLocationId() => clearField(1);
}

/// Emprempta digital de LocTranslation.
class GbTranslationFingerPrint extends $pb.GeneratedMessage {
  factory GbTranslationFingerPrint({
    $core.int? lastTranslationId,
  }) {
    final $result = create();
    if (lastTranslationId != null) {
      $result.lastTranslationId = lastTranslationId;
    }
    return $result;
  }
  GbTranslationFingerPrint._() : super();
  factory GbTranslationFingerPrint.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GbTranslationFingerPrint.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GbTranslationFingerPrint', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'lastTranslationId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GbTranslationFingerPrint clone() => GbTranslationFingerPrint()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GbTranslationFingerPrint copyWith(void Function(GbTranslationFingerPrint) updates) => super.copyWith((message) => updates(message as GbTranslationFingerPrint)) as GbTranslationFingerPrint;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GbTranslationFingerPrint create() => GbTranslationFingerPrint._();
  GbTranslationFingerPrint createEmptyInstance() => create();
  static $pb.PbList<GbTranslationFingerPrint> createRepeated() => $pb.PbList<GbTranslationFingerPrint>();
  @$core.pragma('dart2js:noInline')
  static GbTranslationFingerPrint getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GbTranslationFingerPrint>(create);
  static GbTranslationFingerPrint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get lastTranslationId => $_getIZ(0);
  @$pb.TagNumber(1)
  set lastTranslationId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastTranslationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastTranslationId() => clearField(1);
}

/// Emprempta digital del mòdul LOCMOD.
class GbSyncLocMod extends $pb.GeneratedMessage {
  factory GbSyncLocMod({
    $core.int? fingerId,
    GbTextKeyFingerPrint? locTextKey,
    GbLocaleFingerPrint? locLocale,
    GbTranslationFingerPrint? locTranslation,
  }) {
    final $result = create();
    if (fingerId != null) {
      $result.fingerId = fingerId;
    }
    if (locTextKey != null) {
      $result.locTextKey = locTextKey;
    }
    if (locLocale != null) {
      $result.locLocale = locLocale;
    }
    if (locTranslation != null) {
      $result.locTranslation = locTranslation;
    }
    return $result;
  }
  GbSyncLocMod._() : super();
  factory GbSyncLocMod.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GbSyncLocMod.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GbSyncLocMod', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'fingerId', $pb.PbFieldType.O3)
    ..aOM<GbTextKeyFingerPrint>(2, _omitFieldNames ? '' : 'locTextKey', subBuilder: GbTextKeyFingerPrint.create)
    ..aOM<GbLocaleFingerPrint>(3, _omitFieldNames ? '' : 'locLocale', subBuilder: GbLocaleFingerPrint.create)
    ..aOM<GbTranslationFingerPrint>(4, _omitFieldNames ? '' : 'locTranslation', subBuilder: GbTranslationFingerPrint.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GbSyncLocMod clone() => GbSyncLocMod()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GbSyncLocMod copyWith(void Function(GbSyncLocMod) updates) => super.copyWith((message) => updates(message as GbSyncLocMod)) as GbSyncLocMod;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GbSyncLocMod create() => GbSyncLocMod._();
  GbSyncLocMod createEmptyInstance() => create();
  static $pb.PbList<GbSyncLocMod> createRepeated() => $pb.PbList<GbSyncLocMod>();
  @$core.pragma('dart2js:noInline')
  static GbSyncLocMod getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GbSyncLocMod>(create);
  static GbSyncLocMod? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get fingerId => $_getIZ(0);
  @$pb.TagNumber(1)
  set fingerId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFingerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFingerId() => clearField(1);

  @$pb.TagNumber(2)
  GbTextKeyFingerPrint get locTextKey => $_getN(1);
  @$pb.TagNumber(2)
  set locTextKey(GbTextKeyFingerPrint v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocTextKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocTextKey() => clearField(2);
  @$pb.TagNumber(2)
  GbTextKeyFingerPrint ensureLocTextKey() => $_ensure(1);

  @$pb.TagNumber(3)
  GbLocaleFingerPrint get locLocale => $_getN(2);
  @$pb.TagNumber(3)
  set locLocale(GbLocaleFingerPrint v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLocLocale() => $_has(2);
  @$pb.TagNumber(3)
  void clearLocLocale() => clearField(3);
  @$pb.TagNumber(3)
  GbLocaleFingerPrint ensureLocLocale() => $_ensure(2);

  @$pb.TagNumber(4)
  GbTranslationFingerPrint get locTranslation => $_getN(3);
  @$pb.TagNumber(4)
  set locTranslation(GbTranslationFingerPrint v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasLocTranslation() => $_has(3);
  @$pb.TagNumber(4)
  void clearLocTranslation() => clearField(4);
  @$pb.TagNumber(4)
  GbTranslationFingerPrint ensureLocTranslation() => $_ensure(3);
}

/// Petició d'una traducció.
class PrtDownloadTranslation extends $pb.GeneratedMessage {
  factory PrtDownloadTranslation({
    $core.int? userId,
    $core.String? langId,
    $core.String? tkeyId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (langId != null) {
      $result.langId = langId;
    }
    if (tkeyId != null) {
      $result.tkeyId = tkeyId;
    }
    return $result;
  }
  PrtDownloadTranslation._() : super();
  factory PrtDownloadTranslation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PrtDownloadTranslation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PrtDownloadTranslation', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'langId')
    ..aOS(3, _omitFieldNames ? '' : 'tkeyId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PrtDownloadTranslation clone() => PrtDownloadTranslation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PrtDownloadTranslation copyWith(void Function(PrtDownloadTranslation) updates) => super.copyWith((message) => updates(message as PrtDownloadTranslation)) as PrtDownloadTranslation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrtDownloadTranslation create() => PrtDownloadTranslation._();
  PrtDownloadTranslation createEmptyInstance() => create();
  static $pb.PbList<PrtDownloadTranslation> createRepeated() => $pb.PbList<PrtDownloadTranslation>();
  @$core.pragma('dart2js:noInline')
  static PrtDownloadTranslation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PrtDownloadTranslation>(create);
  static PrtDownloadTranslation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get langId => $_getSZ(1);
  @$pb.TagNumber(2)
  set langId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLangId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLangId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tkeyId => $_getSZ(2);
  @$pb.TagNumber(3)
  set tkeyId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTkeyId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTkeyId() => clearField(3);
}

/// Resposta a una petició d'una traducció.
class PrtTranslation extends $pb.GeneratedMessage {
  factory PrtTranslation({
    $core.String? locale,
    $core.String? textKey,
    $1.LocTranslation? translation,
  }) {
    final $result = create();
    if (locale != null) {
      $result.locale = locale;
    }
    if (textKey != null) {
      $result.textKey = textKey;
    }
    if (translation != null) {
      $result.translation = translation;
    }
    return $result;
  }
  PrtTranslation._() : super();
  factory PrtTranslation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PrtTranslation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PrtTranslation', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'locale')
    ..aOS(2, _omitFieldNames ? '' : 'textKey')
    ..aOM<$1.LocTranslation>(3, _omitFieldNames ? '' : 'translation', subBuilder: $1.LocTranslation.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PrtTranslation clone() => PrtTranslation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PrtTranslation copyWith(void Function(PrtTranslation) updates) => super.copyWith((message) => updates(message as PrtTranslation)) as PrtTranslation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrtTranslation create() => PrtTranslation._();
  PrtTranslation createEmptyInstance() => create();
  static $pb.PbList<PrtTranslation> createRepeated() => $pb.PbList<PrtTranslation>();
  @$core.pragma('dart2js:noInline')
  static PrtTranslation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PrtTranslation>(create);
  static PrtTranslation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get locale => $_getSZ(0);
  @$pb.TagNumber(1)
  set locale($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocale() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocale() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get textKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set textKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTextKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearTextKey() => clearField(2);

  @$pb.TagNumber(3)
  $1.LocTranslation get translation => $_getN(2);
  @$pb.TagNumber(3)
  set translation($1.LocTranslation v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTranslation() => $_has(2);
  @$pb.TagNumber(3)
  void clearTranslation() => clearField(3);
  @$pb.TagNumber(3)
  $1.LocTranslation ensureTranslation() => $_ensure(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
