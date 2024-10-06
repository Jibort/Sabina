//
//  Generated code. Do not modify.
//  source: resmod/res_answer.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../emomod/emo_entities.pb.dart' as $4;
import '../gbl_timestamp.pb.dart' as $5;
import '../lstmod/lst_option_entry.pb.dart' as $3;
import '../model_entity.pb.dart' as $0;
import '../tstmod/tst_question.pb.dart' as $2;
import '../usrmod/usr_user.pb.dart' as $6;
import 'res_patient_test.pb.dart' as $1;

/// Resposta a les preguntes d'un test d'avaluació.
class ResAnswer extends $pb.GeneratedMessage {
  factory ResAnswer({
    $0.ModelEntity? baseEntity,
    $1.ResPatientTest? test,
    $2.TstQuestion? question,
    $core.String? answer,
    $3.LstOptionEntry? option,
    $4.EmoEmotion? emotion,
    $4.EmoMood? mood,
    $5.Timestamp? completedAt,
    $6.UsrUser? evaluatedBy,
    $5.Timestamp? evaluatedAt,
    $core.String? evaluation,
  }) {
    final $result = create();
    if (baseEntity != null) {
      $result.baseEntity = baseEntity;
    }
    if (test != null) {
      $result.test = test;
    }
    if (question != null) {
      $result.question = question;
    }
    if (answer != null) {
      $result.answer = answer;
    }
    if (option != null) {
      $result.option = option;
    }
    if (emotion != null) {
      $result.emotion = emotion;
    }
    if (mood != null) {
      $result.mood = mood;
    }
    if (completedAt != null) {
      $result.completedAt = completedAt;
    }
    if (evaluatedBy != null) {
      $result.evaluatedBy = evaluatedBy;
    }
    if (evaluatedAt != null) {
      $result.evaluatedAt = evaluatedAt;
    }
    if (evaluation != null) {
      $result.evaluation = evaluation;
    }
    return $result;
  }
  ResAnswer._() : super();
  factory ResAnswer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResAnswer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResAnswer', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$0.ModelEntity>(1, _omitFieldNames ? '' : 'baseEntity', subBuilder: $0.ModelEntity.create)
    ..aOM<$1.ResPatientTest>(2, _omitFieldNames ? '' : 'test', subBuilder: $1.ResPatientTest.create)
    ..aOM<$2.TstQuestion>(3, _omitFieldNames ? '' : 'question', subBuilder: $2.TstQuestion.create)
    ..aOS(4, _omitFieldNames ? '' : 'answer')
    ..aOM<$3.LstOptionEntry>(5, _omitFieldNames ? '' : 'option', subBuilder: $3.LstOptionEntry.create)
    ..aOM<$4.EmoEmotion>(6, _omitFieldNames ? '' : 'emotion', subBuilder: $4.EmoEmotion.create)
    ..aOM<$4.EmoMood>(7, _omitFieldNames ? '' : 'mood', subBuilder: $4.EmoMood.create)
    ..aOM<$5.Timestamp>(8, _omitFieldNames ? '' : 'completedAt', subBuilder: $5.Timestamp.create)
    ..aOM<$6.UsrUser>(9, _omitFieldNames ? '' : 'evaluatedBy', subBuilder: $6.UsrUser.create)
    ..aOM<$5.Timestamp>(10, _omitFieldNames ? '' : 'evaluatedAt', subBuilder: $5.Timestamp.create)
    ..aOS(11, _omitFieldNames ? '' : 'evaluation')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResAnswer clone() => ResAnswer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResAnswer copyWith(void Function(ResAnswer) updates) => super.copyWith((message) => updates(message as ResAnswer)) as ResAnswer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResAnswer create() => ResAnswer._();
  ResAnswer createEmptyInstance() => create();
  static $pb.PbList<ResAnswer> createRepeated() => $pb.PbList<ResAnswer>();
  @$core.pragma('dart2js:noInline')
  static ResAnswer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResAnswer>(create);
  static ResAnswer? _defaultInstance;

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
  $1.ResPatientTest get test => $_getN(1);
  @$pb.TagNumber(2)
  set test($1.ResPatientTest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTest() => $_has(1);
  @$pb.TagNumber(2)
  void clearTest() => clearField(2);
  @$pb.TagNumber(2)
  $1.ResPatientTest ensureTest() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.TstQuestion get question => $_getN(2);
  @$pb.TagNumber(3)
  set question($2.TstQuestion v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasQuestion() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuestion() => clearField(3);
  @$pb.TagNumber(3)
  $2.TstQuestion ensureQuestion() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get answer => $_getSZ(3);
  @$pb.TagNumber(4)
  set answer($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAnswer() => $_has(3);
  @$pb.TagNumber(4)
  void clearAnswer() => clearField(4);

  @$pb.TagNumber(5)
  $3.LstOptionEntry get option => $_getN(4);
  @$pb.TagNumber(5)
  set option($3.LstOptionEntry v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasOption() => $_has(4);
  @$pb.TagNumber(5)
  void clearOption() => clearField(5);
  @$pb.TagNumber(5)
  $3.LstOptionEntry ensureOption() => $_ensure(4);

  @$pb.TagNumber(6)
  $4.EmoEmotion get emotion => $_getN(5);
  @$pb.TagNumber(6)
  set emotion($4.EmoEmotion v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasEmotion() => $_has(5);
  @$pb.TagNumber(6)
  void clearEmotion() => clearField(6);
  @$pb.TagNumber(6)
  $4.EmoEmotion ensureEmotion() => $_ensure(5);

  @$pb.TagNumber(7)
  $4.EmoMood get mood => $_getN(6);
  @$pb.TagNumber(7)
  set mood($4.EmoMood v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasMood() => $_has(6);
  @$pb.TagNumber(7)
  void clearMood() => clearField(7);
  @$pb.TagNumber(7)
  $4.EmoMood ensureMood() => $_ensure(6);

  @$pb.TagNumber(8)
  $5.Timestamp get completedAt => $_getN(7);
  @$pb.TagNumber(8)
  set completedAt($5.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCompletedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearCompletedAt() => clearField(8);
  @$pb.TagNumber(8)
  $5.Timestamp ensureCompletedAt() => $_ensure(7);

  @$pb.TagNumber(9)
  $6.UsrUser get evaluatedBy => $_getN(8);
  @$pb.TagNumber(9)
  set evaluatedBy($6.UsrUser v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasEvaluatedBy() => $_has(8);
  @$pb.TagNumber(9)
  void clearEvaluatedBy() => clearField(9);
  @$pb.TagNumber(9)
  $6.UsrUser ensureEvaluatedBy() => $_ensure(8);

  @$pb.TagNumber(10)
  $5.Timestamp get evaluatedAt => $_getN(9);
  @$pb.TagNumber(10)
  set evaluatedAt($5.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasEvaluatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearEvaluatedAt() => clearField(10);
  @$pb.TagNumber(10)
  $5.Timestamp ensureEvaluatedAt() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get evaluation => $_getSZ(10);
  @$pb.TagNumber(11)
  set evaluation($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasEvaluation() => $_has(10);
  @$pb.TagNumber(11)
  void clearEvaluation() => clearField(11);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
