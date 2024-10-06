//
//  Generated code. Do not modify.
//  source: emomod/emo_entities.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../gbl_global.pb.dart' as $1;
import '../model_entity.pb.dart' as $0;

/// Definició d'una emoció.
class EmoEmotion extends $pb.GeneratedMessage {
  factory EmoEmotion({
    $0.ModelEntity? baseEntity,
    $core.String? nameKey,
    $core.String? descKey,
    EmoEmotion? parent,
    $core.int? value,
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
    if (parent != null) {
      $result.parent = parent;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  EmoEmotion._() : super();
  factory EmoEmotion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmoEmotion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EmoEmotion', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$0.ModelEntity>(1, _omitFieldNames ? '' : 'baseEntity', subBuilder: $0.ModelEntity.create)
    ..aOS(2, _omitFieldNames ? '' : 'nameKey')
    ..aOS(3, _omitFieldNames ? '' : 'descKey')
    ..aOM<EmoEmotion>(4, _omitFieldNames ? '' : 'parent', subBuilder: EmoEmotion.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'value', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmoEmotion clone() => EmoEmotion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmoEmotion copyWith(void Function(EmoEmotion) updates) => super.copyWith((message) => updates(message as EmoEmotion)) as EmoEmotion;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmoEmotion create() => EmoEmotion._();
  EmoEmotion createEmptyInstance() => create();
  static $pb.PbList<EmoEmotion> createRepeated() => $pb.PbList<EmoEmotion>();
  @$core.pragma('dart2js:noInline')
  static EmoEmotion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmoEmotion>(create);
  static EmoEmotion? _defaultInstance;

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
  EmoEmotion get parent => $_getN(3);
  @$pb.TagNumber(4)
  set parent(EmoEmotion v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasParent() => $_has(3);
  @$pb.TagNumber(4)
  void clearParent() => clearField(4);
  @$pb.TagNumber(4)
  EmoEmotion ensureParent() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get value => $_getIZ(4);
  @$pb.TagNumber(5)
  set value($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearValue() => clearField(5);
}

class EmoEmotions extends $pb.GeneratedMessage {
  factory EmoEmotions({
    $1.GbError? error,
    $core.Iterable<EmoEmotion>? emotions,
  }) {
    final $result = create();
    if (error != null) {
      $result.error = error;
    }
    if (emotions != null) {
      $result.emotions.addAll(emotions);
    }
    return $result;
  }
  EmoEmotions._() : super();
  factory EmoEmotions.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmoEmotions.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EmoEmotions', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$1.GbError>(1, _omitFieldNames ? '' : 'error', subBuilder: $1.GbError.create)
    ..pc<EmoEmotion>(2, _omitFieldNames ? '' : 'emotions', $pb.PbFieldType.PM, subBuilder: EmoEmotion.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmoEmotions clone() => EmoEmotions()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmoEmotions copyWith(void Function(EmoEmotions) updates) => super.copyWith((message) => updates(message as EmoEmotions)) as EmoEmotions;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmoEmotions create() => EmoEmotions._();
  EmoEmotions createEmptyInstance() => create();
  static $pb.PbList<EmoEmotions> createRepeated() => $pb.PbList<EmoEmotions>();
  @$core.pragma('dart2js:noInline')
  static EmoEmotions getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmoEmotions>(create);
  static EmoEmotions? _defaultInstance;

  @$pb.TagNumber(1)
  $1.GbError get error => $_getN(0);
  @$pb.TagNumber(1)
  set error($1.GbError v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);
  @$pb.TagNumber(1)
  $1.GbError ensureError() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<EmoEmotion> get emotions => $_getList(1);
}

class EmoModuleLists extends $pb.GeneratedMessage {
  factory EmoModuleLists({
    $1.GbError? error,
    EmoMoods? moods,
    EmoEmotions? emotions,
  }) {
    final $result = create();
    if (error != null) {
      $result.error = error;
    }
    if (moods != null) {
      $result.moods = moods;
    }
    if (emotions != null) {
      $result.emotions = emotions;
    }
    return $result;
  }
  EmoModuleLists._() : super();
  factory EmoModuleLists.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmoModuleLists.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EmoModuleLists', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$1.GbError>(1, _omitFieldNames ? '' : 'error', subBuilder: $1.GbError.create)
    ..aOM<EmoMoods>(2, _omitFieldNames ? '' : 'moods', subBuilder: EmoMoods.create)
    ..aOM<EmoEmotions>(3, _omitFieldNames ? '' : 'emotions', subBuilder: EmoEmotions.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmoModuleLists clone() => EmoModuleLists()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmoModuleLists copyWith(void Function(EmoModuleLists) updates) => super.copyWith((message) => updates(message as EmoModuleLists)) as EmoModuleLists;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmoModuleLists create() => EmoModuleLists._();
  EmoModuleLists createEmptyInstance() => create();
  static $pb.PbList<EmoModuleLists> createRepeated() => $pb.PbList<EmoModuleLists>();
  @$core.pragma('dart2js:noInline')
  static EmoModuleLists getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmoModuleLists>(create);
  static EmoModuleLists? _defaultInstance;

  @$pb.TagNumber(1)
  $1.GbError get error => $_getN(0);
  @$pb.TagNumber(1)
  set error($1.GbError v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);
  @$pb.TagNumber(1)
  $1.GbError ensureError() => $_ensure(0);

  @$pb.TagNumber(2)
  EmoMoods get moods => $_getN(1);
  @$pb.TagNumber(2)
  set moods(EmoMoods v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMoods() => $_has(1);
  @$pb.TagNumber(2)
  void clearMoods() => clearField(2);
  @$pb.TagNumber(2)
  EmoMoods ensureMoods() => $_ensure(1);

  @$pb.TagNumber(3)
  EmoEmotions get emotions => $_getN(2);
  @$pb.TagNumber(3)
  set emotions(EmoEmotions v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmotions() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmotions() => clearField(3);
  @$pb.TagNumber(3)
  EmoEmotions ensureEmotions() => $_ensure(2);
}

/// Definició d'un estat d'ànim.
class EmoMood extends $pb.GeneratedMessage {
  factory EmoMood({
    $0.ModelEntity? baseEntity,
    $core.String? nameKey,
    $core.String? descKey,
    $core.int? value,
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
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  EmoMood._() : super();
  factory EmoMood.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmoMood.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EmoMood', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$0.ModelEntity>(1, _omitFieldNames ? '' : 'baseEntity', subBuilder: $0.ModelEntity.create)
    ..aOS(2, _omitFieldNames ? '' : 'nameKey')
    ..aOS(3, _omitFieldNames ? '' : 'descKey')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'value', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmoMood clone() => EmoMood()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmoMood copyWith(void Function(EmoMood) updates) => super.copyWith((message) => updates(message as EmoMood)) as EmoMood;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmoMood create() => EmoMood._();
  EmoMood createEmptyInstance() => create();
  static $pb.PbList<EmoMood> createRepeated() => $pb.PbList<EmoMood>();
  @$core.pragma('dart2js:noInline')
  static EmoMood getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmoMood>(create);
  static EmoMood? _defaultInstance;

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
  $core.int get value => $_getIZ(3);
  @$pb.TagNumber(4)
  set value($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearValue() => clearField(4);
}

class EmoMoods extends $pb.GeneratedMessage {
  factory EmoMoods({
    $1.GbError? error,
    $core.Iterable<EmoMood>? moods,
  }) {
    final $result = create();
    if (error != null) {
      $result.error = error;
    }
    if (moods != null) {
      $result.moods.addAll(moods);
    }
    return $result;
  }
  EmoMoods._() : super();
  factory EmoMoods.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmoMoods.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EmoMoods', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$1.GbError>(1, _omitFieldNames ? '' : 'error', subBuilder: $1.GbError.create)
    ..pc<EmoMood>(2, _omitFieldNames ? '' : 'moods', $pb.PbFieldType.PM, subBuilder: EmoMood.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmoMoods clone() => EmoMoods()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmoMoods copyWith(void Function(EmoMoods) updates) => super.copyWith((message) => updates(message as EmoMoods)) as EmoMoods;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmoMoods create() => EmoMoods._();
  EmoMoods createEmptyInstance() => create();
  static $pb.PbList<EmoMoods> createRepeated() => $pb.PbList<EmoMoods>();
  @$core.pragma('dart2js:noInline')
  static EmoMoods getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmoMoods>(create);
  static EmoMoods? _defaultInstance;

  @$pb.TagNumber(1)
  $1.GbError get error => $_getN(0);
  @$pb.TagNumber(1)
  set error($1.GbError v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);
  @$pb.TagNumber(1)
  $1.GbError ensureError() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<EmoMood> get moods => $_getList(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
