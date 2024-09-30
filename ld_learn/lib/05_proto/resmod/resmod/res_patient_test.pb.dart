//
//  Generated code. Do not modify.
//  source: resmod/res_patient_test.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../gbl_timestamp.pb.dart' as $3;
import '../model_entity.pb.dart' as $0;
import '../tstmod/tst_test.pb.dart' as $1;
import '../usrmod/usr_user.pb.dart' as $2;

/// Registre de compliment del test.
class ResPatientTest extends $pb.GeneratedMessage {
  factory ResPatientTest({
    $0.ModelEntity? baseEntity,
    $1.TstTest? test,
    $2.UsrUser? therapist,
    $2.UsrUser? patient,
    $3.Timestamp? assignedAt,
    $3.Timestamp? completedAt,
    $2.UsrUser? evaluatedBy,
    $3.Timestamp? evaluatedAt,
    $core.String? evaluation,
  }) {
    final $result = create();
    if (baseEntity != null) {
      $result.baseEntity = baseEntity;
    }
    if (test != null) {
      $result.test = test;
    }
    if (therapist != null) {
      $result.therapist = therapist;
    }
    if (patient != null) {
      $result.patient = patient;
    }
    if (assignedAt != null) {
      $result.assignedAt = assignedAt;
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
  ResPatientTest._() : super();
  factory ResPatientTest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResPatientTest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResPatientTest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$0.ModelEntity>(1, _omitFieldNames ? '' : 'baseEntity', subBuilder: $0.ModelEntity.create)
    ..aOM<$1.TstTest>(2, _omitFieldNames ? '' : 'test', subBuilder: $1.TstTest.create)
    ..aOM<$2.UsrUser>(3, _omitFieldNames ? '' : 'therapist', subBuilder: $2.UsrUser.create)
    ..aOM<$2.UsrUser>(4, _omitFieldNames ? '' : 'patient', subBuilder: $2.UsrUser.create)
    ..aOM<$3.Timestamp>(5, _omitFieldNames ? '' : 'assignedAt', subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(6, _omitFieldNames ? '' : 'completedAt', subBuilder: $3.Timestamp.create)
    ..aOM<$2.UsrUser>(7, _omitFieldNames ? '' : 'evaluatedBy', subBuilder: $2.UsrUser.create)
    ..aOM<$3.Timestamp>(8, _omitFieldNames ? '' : 'evaluatedAt', subBuilder: $3.Timestamp.create)
    ..aOS(9, _omitFieldNames ? '' : 'evaluation')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResPatientTest clone() => ResPatientTest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResPatientTest copyWith(void Function(ResPatientTest) updates) => super.copyWith((message) => updates(message as ResPatientTest)) as ResPatientTest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResPatientTest create() => ResPatientTest._();
  ResPatientTest createEmptyInstance() => create();
  static $pb.PbList<ResPatientTest> createRepeated() => $pb.PbList<ResPatientTest>();
  @$core.pragma('dart2js:noInline')
  static ResPatientTest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResPatientTest>(create);
  static ResPatientTest? _defaultInstance;

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
  $2.UsrUser get therapist => $_getN(2);
  @$pb.TagNumber(3)
  set therapist($2.UsrUser v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTherapist() => $_has(2);
  @$pb.TagNumber(3)
  void clearTherapist() => clearField(3);
  @$pb.TagNumber(3)
  $2.UsrUser ensureTherapist() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.UsrUser get patient => $_getN(3);
  @$pb.TagNumber(4)
  set patient($2.UsrUser v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPatient() => $_has(3);
  @$pb.TagNumber(4)
  void clearPatient() => clearField(4);
  @$pb.TagNumber(4)
  $2.UsrUser ensurePatient() => $_ensure(3);

  @$pb.TagNumber(5)
  $3.Timestamp get assignedAt => $_getN(4);
  @$pb.TagNumber(5)
  set assignedAt($3.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasAssignedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearAssignedAt() => clearField(5);
  @$pb.TagNumber(5)
  $3.Timestamp ensureAssignedAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $3.Timestamp get completedAt => $_getN(5);
  @$pb.TagNumber(6)
  set completedAt($3.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCompletedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCompletedAt() => clearField(6);
  @$pb.TagNumber(6)
  $3.Timestamp ensureCompletedAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $2.UsrUser get evaluatedBy => $_getN(6);
  @$pb.TagNumber(7)
  set evaluatedBy($2.UsrUser v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasEvaluatedBy() => $_has(6);
  @$pb.TagNumber(7)
  void clearEvaluatedBy() => clearField(7);
  @$pb.TagNumber(7)
  $2.UsrUser ensureEvaluatedBy() => $_ensure(6);

  @$pb.TagNumber(8)
  $3.Timestamp get evaluatedAt => $_getN(7);
  @$pb.TagNumber(8)
  set evaluatedAt($3.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasEvaluatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearEvaluatedAt() => clearField(8);
  @$pb.TagNumber(8)
  $3.Timestamp ensureEvaluatedAt() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.String get evaluation => $_getSZ(8);
  @$pb.TagNumber(9)
  set evaluation($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasEvaluation() => $_has(8);
  @$pb.TagNumber(9)
  void clearEvaluation() => clearField(9);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
