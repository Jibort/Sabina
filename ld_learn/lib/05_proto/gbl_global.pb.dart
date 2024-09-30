//
//  Generated code. Do not modify.
//  source: gbl_global.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'gbl_enumerations.pbenum.dart' as $0;

/// Representació d'un error amb codi i missatge opcional.
class GbError extends $pb.GeneratedMessage {
  factory GbError({
    $0.GbErrorCode? code,
    $core.String? message,
  }) {
    final $result = create();
    if (code != null) {
      $result.code = code;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  GbError._() : super();
  factory GbError.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GbError.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GbError', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..e<$0.GbErrorCode>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: $0.GbErrorCode.GB_ERROR_CODE_UNSPECIFIED, valueOf: $0.GbErrorCode.valueOf, enumValues: $0.GbErrorCode.values)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GbError clone() => GbError()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GbError copyWith(void Function(GbError) updates) => super.copyWith((message) => updates(message as GbError)) as GbError;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GbError create() => GbError._();
  GbError createEmptyInstance() => create();
  static $pb.PbList<GbError> createRepeated() => $pb.PbList<GbError>();
  @$core.pragma('dart2js:noInline')
  static GbError getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GbError>(create);
  static GbError? _defaultInstance;

  @$pb.TagNumber(1)
  $0.GbErrorCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code($0.GbErrorCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

/// Representació d'una resposta de 'rebut' amb codi i missatge d'error.
class GbRespAcknoledge extends $pb.GeneratedMessage {
  factory GbRespAcknoledge({
    GbError? error,
  }) {
    final $result = create();
    if (error != null) {
      $result.error = error;
    }
    return $result;
  }
  GbRespAcknoledge._() : super();
  factory GbRespAcknoledge.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GbRespAcknoledge.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GbRespAcknoledge', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<GbError>(1, _omitFieldNames ? '' : 'error', subBuilder: GbError.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GbRespAcknoledge clone() => GbRespAcknoledge()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GbRespAcknoledge copyWith(void Function(GbRespAcknoledge) updates) => super.copyWith((message) => updates(message as GbRespAcknoledge)) as GbRespAcknoledge;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GbRespAcknoledge create() => GbRespAcknoledge._();
  GbRespAcknoledge createEmptyInstance() => create();
  static $pb.PbList<GbRespAcknoledge> createRepeated() => $pb.PbList<GbRespAcknoledge>();
  @$core.pragma('dart2js:noInline')
  static GbRespAcknoledge getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GbRespAcknoledge>(create);
  static GbRespAcknoledge? _defaultInstance;

  @$pb.TagNumber(1)
  GbError get error => $_getN(0);
  @$pb.TagNumber(1)
  set error(GbError v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);
  @$pb.TagNumber(1)
  GbError ensureError() => $_ensure(0);
}

/// Representació de la cerca pel seu identificador únic.
class GbReqtInstanceById extends $pb.GeneratedMessage {
  factory GbReqtInstanceById({
    $core.int? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GbReqtInstanceById._() : super();
  factory GbReqtInstanceById.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GbReqtInstanceById.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GbReqtInstanceById', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GbReqtInstanceById clone() => GbReqtInstanceById()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GbReqtInstanceById copyWith(void Function(GbReqtInstanceById) updates) => super.copyWith((message) => updates(message as GbReqtInstanceById)) as GbReqtInstanceById;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GbReqtInstanceById create() => GbReqtInstanceById._();
  GbReqtInstanceById createEmptyInstance() => create();
  static $pb.PbList<GbReqtInstanceById> createRepeated() => $pb.PbList<GbReqtInstanceById>();
  @$core.pragma('dart2js:noInline')
  static GbReqtInstanceById getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GbReqtInstanceById>(create);
  static GbReqtInstanceById? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

/// Representació de la cerca d'instàncies d'entitat per una cadena de caràcters.
class GbReqtInstanceByString extends $pb.GeneratedMessage {
  factory GbReqtInstanceByString({
    $core.String? str,
  }) {
    final $result = create();
    if (str != null) {
      $result.str = str;
    }
    return $result;
  }
  GbReqtInstanceByString._() : super();
  factory GbReqtInstanceByString.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GbReqtInstanceByString.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GbReqtInstanceByString', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'str')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GbReqtInstanceByString clone() => GbReqtInstanceByString()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GbReqtInstanceByString copyWith(void Function(GbReqtInstanceByString) updates) => super.copyWith((message) => updates(message as GbReqtInstanceByString)) as GbReqtInstanceByString;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GbReqtInstanceByString create() => GbReqtInstanceByString._();
  GbReqtInstanceByString createEmptyInstance() => create();
  static $pb.PbList<GbReqtInstanceByString> createRepeated() => $pb.PbList<GbReqtInstanceByString>();
  @$core.pragma('dart2js:noInline')
  static GbReqtInstanceByString getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GbReqtInstanceByString>(create);
  static GbReqtInstanceByString? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get str => $_getSZ(0);
  @$pb.TagNumber(1)
  set str($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStr() => $_has(0);
  @$pb.TagNumber(1)
  void clearStr() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
