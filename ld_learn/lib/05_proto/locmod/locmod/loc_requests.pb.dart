//
//  Generated code. Do not modify.
//  source: locmod/loc_requests.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Petició de traducció.
class LocReqtTranslate extends $pb.GeneratedMessage {
  factory LocReqtTranslate({
    $core.String? language,
    $core.String? textKey,
    $core.int? iteration,
  }) {
    final $result = create();
    if (language != null) {
      $result.language = language;
    }
    if (textKey != null) {
      $result.textKey = textKey;
    }
    if (iteration != null) {
      $result.iteration = iteration;
    }
    return $result;
  }
  LocReqtTranslate._() : super();
  factory LocReqtTranslate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LocReqtTranslate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LocReqtTranslate', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'language')
    ..aOS(2, _omitFieldNames ? '' : 'textKey')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'iteration', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LocReqtTranslate clone() => LocReqtTranslate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LocReqtTranslate copyWith(void Function(LocReqtTranslate) updates) => super.copyWith((message) => updates(message as LocReqtTranslate)) as LocReqtTranslate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocReqtTranslate create() => LocReqtTranslate._();
  LocReqtTranslate createEmptyInstance() => create();
  static $pb.PbList<LocReqtTranslate> createRepeated() => $pb.PbList<LocReqtTranslate>();
  @$core.pragma('dart2js:noInline')
  static LocReqtTranslate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LocReqtTranslate>(create);
  static LocReqtTranslate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get language => $_getSZ(0);
  @$pb.TagNumber(1)
  set language($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLanguage() => $_has(0);
  @$pb.TagNumber(1)
  void clearLanguage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get textKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set textKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTextKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearTextKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iteration => $_getIZ(2);
  @$pb.TagNumber(3)
  set iteration($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIteration() => $_has(2);
  @$pb.TagNumber(3)
  void clearIteration() => clearField(3);
}

/// Resposta a la petició de traducció.
class LocRespTranslate extends $pb.GeneratedMessage {
  factory LocRespTranslate({
    LocReqtTranslate? request,
    $core.String? translation,
  }) {
    final $result = create();
    if (request != null) {
      $result.request = request;
    }
    if (translation != null) {
      $result.translation = translation;
    }
    return $result;
  }
  LocRespTranslate._() : super();
  factory LocRespTranslate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LocRespTranslate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LocRespTranslate', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<LocReqtTranslate>(1, _omitFieldNames ? '' : 'request', subBuilder: LocReqtTranslate.create)
    ..aOS(2, _omitFieldNames ? '' : 'translation')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LocRespTranslate clone() => LocRespTranslate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LocRespTranslate copyWith(void Function(LocRespTranslate) updates) => super.copyWith((message) => updates(message as LocRespTranslate)) as LocRespTranslate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocRespTranslate create() => LocRespTranslate._();
  LocRespTranslate createEmptyInstance() => create();
  static $pb.PbList<LocRespTranslate> createRepeated() => $pb.PbList<LocRespTranslate>();
  @$core.pragma('dart2js:noInline')
  static LocRespTranslate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LocRespTranslate>(create);
  static LocRespTranslate? _defaultInstance;

  @$pb.TagNumber(1)
  LocReqtTranslate get request => $_getN(0);
  @$pb.TagNumber(1)
  set request(LocReqtTranslate v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequest() => clearField(1);
  @$pb.TagNumber(1)
  LocReqtTranslate ensureRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get translation => $_getSZ(1);
  @$pb.TagNumber(2)
  set translation($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTranslation() => $_has(1);
  @$pb.TagNumber(2)
  void clearTranslation() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
