// Representació de la resposta dels pacients als test d'avaluació.
// createdAt: 24/08/27 dv. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/a_user/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació de la resposta dels pacients als test d'avaluació.
class ResPatientTest extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  TstTest? _test;
  UsrUser? _therapist;
  UsrUser? _patient;
  DateTime? _assignedAt;
  DateTime? _completedAt;
  UsrUser? _evaluatedBy;
  DateTime? __evaluatedAt;  
  String? __evaluation;

  // CONSTRUCTORS ---------------------
  ResPatientTest(
      {required super.pLocalId,
      required super.pId,
      required super.pCreatedBy,
      required super.pCreatedAt,
      required super.pUpdatedBy,
      required super.pUpdatedAt,
      super.pIsNew,
      super.pIsUpdated,
      super.pIsDeleted,
      UsrUser? pTherapist,
      UsrUser? pPatient,
      DateTime? pAssignedAt,
      DateTime? pCompletedAt,
      UsrUser? pEvaluatedBy,
      DateTime? pEvaluatedAt,
      String? pEvaluation}) {
    _therapist = pTherapist;
    _patient = pPatient;
    _assignedAt = pAssignedAt;
    _completedAt = pCompletedAt;
    _evaluatedBy = pEvaluatedBy;
    __evaluatedAt = pEvaluatedAt;
    __evaluation = pEvaluation;
  }

  ResPatientTest.empty()
      : this(
            pLocalId: null,
            pId: null,
            pCreatedBy: null,
            pCreatedAt: null,
            pUpdatedBy: null,
            pUpdatedAt: null,
            pIsNew: true,
            pIsUpdated: false,
            pIsDeleted: false,
            pTherapist: null,
            pPatient: null,
            pAssignedAt: null,
            pCompletedAt: null,
            pEvaluatedBy: null,
            pEvaluatedAt: null,
            pEvaluation: null);

  ResPatientTest.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _therapist = pMap[fldTherapist];
    _patient = pMap[fldPatient];
    _assignedAt = pMap[fldAssignedAt];
    _completedAt = pMap[fldCompletedAt];
    _evaluatedBy = pMap[fldEvaluatedBy];
    __evaluatedAt = pMap[fldEvaluatedAt];
    __evaluation = pMap[fldEvaluation];
  }

  ResPatientTest.bySQLMap(
      BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(ResPatientTest, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _assignedAt = pMap[fldAssignedAt];
    _completedAt = pMap[fldCompletedAt];
    __evaluatedAt = pMap[fldEvaluatedAt];
    __evaluation = pMap[fldEvaluation];

    // Carreguem el terapeuta.
    Future<Exception?> stTherapist(
        FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _evaluatedBy = await dbs.byKey(pCtrl, UsrUser, pKey: pArgs.first);

        // Carreguem el pacient.
        Future<Exception?> stPatient(
            FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _evaluatedBy = await dbs.byKey(pCtrl, UsrUser, pKey: pArgs.first);

            // Carreguem el terapeuta avaluador.
            Future<Exception?> stEvalBy(
                FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _evaluatedBy =
                    await dbs.byKey(pCtrl, UsrUser, pKey: pArgs.first);

                // Carrega createdBy i updatedBy.
                super.completeStandard(pCtrl, pMap);
              } on Exception catch (pExc) {
                exc = pExc;
              }
              return exc;
            }

            pCtrl.state.sneakFn(stEvalBy, pArgs: [pMap[fldEvaluatedBy]]);
          } on Exception catch (pExc) {
            exc = pExc;
          }
          return exc;
        }

        pCtrl.state.sneakFn(stPatient, pArgs: [pMap[fldPatient]]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stTherapist, pArgs: [pMap[fldTherapist]]);
  }

  // GETTERS i SETTERS ----------------
  UsrUser? get therapist => _therapist;
  void setTherapist(UsrUser? pTherapist) {
    if (isNull(pTherapist)) {
      throw errorFieldNotNullable("$enResPatientTest.set", fldTherapist);
    }
    var old = _therapist;
    _therapist = pTherapist;
    super.isUpdated = (!super.isNew) && (old != _therapist);
  }

  UsrUser? get patient => _patient;
  void setPatient(UsrUser? pPatient) {
    if (isNull(pPatient)) {
      throw errorFieldNotNullable("$enResPatientTest.set", fldPatient);
    }
    var old = _patient;
    _patient = pPatient;
    super.isUpdated = (!super.isNew) && (old != _patient);
  }

  DateTime? get assignedAt => _assignedAt;
  void setAssignedAt(DateTime? pAssignedAt) {
    var old = _assignedAt;
    _assignedAt = pAssignedAt;
    super.isUpdated = (!super.isNew) && (old != _assignedAt);
  }

  DateTime? get completedAt => _completedAt;
  void setCompletedAt(DateTime? pCompletedAt) {
    var old = _completedAt;
    _completedAt = pCompletedAt;
    super.isUpdated = (!super.isNew) && (old != _completedAt);
  }

  UsrUser? get evaluatedBy => _evaluatedBy;

  DateTime? get evaluatedAt => __evaluatedAt;
  void setEvaluatedAt(DateTime? pEvaluatedAt) {
    var old = _completedAt;
    __evaluatedAt = pEvaluatedAt;
    super.isUpdated = (!super.isNew) && (old != __evaluatedAt);
  }

  String? get evaluation => __evaluation;
  void setEvaluation(String? pEvaluation) {
    var old = __evaluation;
    __evaluation = pEvaluation;
    super.isUpdated = (!super.isNew) && (old != __evaluation);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldTherapist: _therapist,
      fldPatient: _patient,
      fldAssignedAt: _assignedAt,
      fldCompletedAt: _completedAt,
      fldEvaluatedBy: _evaluatedBy,
      fldEvaluatedAt: __evaluatedAt,
      fldEvaluation: __evaluation,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldTherapist: _therapist!.id,
      fldPatient: _patient!.id,
      fldAssignedAt: dTimeToSql(_assignedAt),
      fldCompletedAt: dTimeToSql(_completedAt),
      fldEvaluatedBy: _evaluatedBy?.id,
      fldEvaluatedAt: dTimeToSql(__evaluatedAt),
      fldEvaluation: __evaluation,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldTherapist,
        fldPatient,
        fldAssignedAt,
        fldCompletedAt,
        fldEvaluatedBy,
        fldEvaluatedAt,
        fldEvaluation,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnResPatientTest (
      $standardHeader,
      
      $fldTest        $dbtIntNotNull REFERENCES $tnTstTest($fldId),
      $fldTherapist   $dbtIntNotNull REFERENCES $tnUsrUser($fldId),
      $fldPatient     $dbtIntNotNull REFERENCES $tnUsrUser($fldId),
      $fldAssignedAt  $dbtDateTimeNotNull,
      $fldCompletedAt $dbtDateTime,
      $fldEvaluatedBy $dbtInt REFERENCES $tnUsrUser($fldId),
      $fldEvaluatedAt $dbtDateTime,
      $fldEvaluation  $dbtText
    );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldTherapist,
           $fldPatient,
           $fldAssignedAt,
           $fldCompletedAt,
           $fldEvaluatedBy,
           $fldEvaluatedAt,
           $fldEvaluation
    FROM   $tnResPatientTest
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnResPatientTest
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnResPatientTest (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldTherapist, $fldPatient, $fldAssignedAt, $fldCompletedAt,
      $fldEvaluatedBy, $fldEvaluatedAt, $fldEvaluation)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?, ?,   ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnResPatientTest
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldTherapist = ?,
        $fldPatient = ?,
        $fldAssignedAt = ?,
        $fldCompletedAt = ?,
        $fldEvaluatedBy = ?,
        $fldEvaluatedAt = ?,
        $fldEvaluation = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_therapist) &&
        isNotNull(_patient));
  }
}
