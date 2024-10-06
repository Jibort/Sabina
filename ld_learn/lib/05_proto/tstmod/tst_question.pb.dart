//
//  Generated code. Do not modify.
//  source: tstmod/tst_question.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../model_entity.pb.dart' as $0;
import 'tst_question.pbenum.dart';
import 'tst_test.pb.dart' as $1;

export 'tst_question.pbenum.dart';

/// Definició d'una pregunta de Test.
class TstQuestion extends $pb.GeneratedMessage {
  factory TstQuestion({
    $0.ModelEntity? baseEntity,
    $1.TstTest? test,
    TstTestQuestionType? testQuestionType,
    TstQuestion? block,
    $core.String? question,
    $core.String? help,
    $core.bool? mandatory,
    $core.bool? custom,
  }) {
    final $result = create();
    if (baseEntity != null) {
      $result.baseEntity = baseEntity;
    }
    if (test != null) {
      $result.test = test;
    }
    if (testQuestionType != null) {
      $result.testQuestionType = testQuestionType;
    }
    if (block != null) {
      $result.block = block;
    }
    if (question != null) {
      $result.question = question;
    }
    if (help != null) {
      $result.help = help;
    }
    if (mandatory != null) {
      $result.mandatory = mandatory;
    }
    if (custom != null) {
      $result.custom = custom;
    }
    return $result;
  }
  TstQuestion._() : super();
  factory TstQuestion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TstQuestion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TstQuestion', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$0.ModelEntity>(1, _omitFieldNames ? '' : 'baseEntity', subBuilder: $0.ModelEntity.create)
    ..aOM<$1.TstTest>(2, _omitFieldNames ? '' : 'test', subBuilder: $1.TstTest.create)
    ..e<TstTestQuestionType>(3, _omitFieldNames ? '' : 'testQuestionType', $pb.PbFieldType.OE, defaultOrMaker: TstTestQuestionType.TST_TEST_QUESTION_TYPE_UNSPECIFIED, valueOf: TstTestQuestionType.valueOf, enumValues: TstTestQuestionType.values)
    ..aOM<TstQuestion>(4, _omitFieldNames ? '' : 'block', subBuilder: TstQuestion.create)
    ..aOS(5, _omitFieldNames ? '' : 'question')
    ..aOS(6, _omitFieldNames ? '' : 'help')
    ..aOB(7, _omitFieldNames ? '' : 'mandatory')
    ..aOB(8, _omitFieldNames ? '' : 'custom')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TstQuestion clone() => TstQuestion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TstQuestion copyWith(void Function(TstQuestion) updates) => super.copyWith((message) => updates(message as TstQuestion)) as TstQuestion;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TstQuestion create() => TstQuestion._();
  TstQuestion createEmptyInstance() => create();
  static $pb.PbList<TstQuestion> createRepeated() => $pb.PbList<TstQuestion>();
  @$core.pragma('dart2js:noInline')
  static TstQuestion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TstQuestion>(create);
  static TstQuestion? _defaultInstance;

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
  $1.TstTest get test => $_getN(1);
  @$pb.TagNumber(2)
  set test($1.TstTest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTest() => $_has(1);
  @$pb.TagNumber(2)
  void clearTest() => clearField(2);
  @$pb.TagNumber(2)
  $1.TstTest ensureTest() => $_ensure(1);

  @$pb.TagNumber(3)
  TstTestQuestionType get testQuestionType => $_getN(2);
  @$pb.TagNumber(3)
  set testQuestionType(TstTestQuestionType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTestQuestionType() => $_has(2);
  @$pb.TagNumber(3)
  void clearTestQuestionType() => clearField(3);

  @$pb.TagNumber(4)
  TstQuestion get block => $_getN(3);
  @$pb.TagNumber(4)
  set block(TstQuestion v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasBlock() => $_has(3);
  @$pb.TagNumber(4)
  void clearBlock() => clearField(4);
  @$pb.TagNumber(4)
  TstQuestion ensureBlock() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get question => $_getSZ(4);
  @$pb.TagNumber(5)
  set question($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasQuestion() => $_has(4);
  @$pb.TagNumber(5)
  void clearQuestion() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get help => $_getSZ(5);
  @$pb.TagNumber(6)
  set help($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasHelp() => $_has(5);
  @$pb.TagNumber(6)
  void clearHelp() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get mandatory => $_getBF(6);
  @$pb.TagNumber(7)
  set mandatory($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMandatory() => $_has(6);
  @$pb.TagNumber(7)
  void clearMandatory() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get custom => $_getBF(7);
  @$pb.TagNumber(8)
  set custom($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCustom() => $_has(7);
  @$pb.TagNumber(8)
  void clearCustom() => clearField(8);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
