// Representació d'una entrada en el DsmV.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/a_user/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'una entrada en el DsmV.
class ResPatientTest extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  UsrUser? _therapist; // NOT NULL
  UsrUser? _patient; // NOT NULL
  DateTime? _assignAt;
  DateTime? _completedAt;
  UsrUser? _evaluatedBy;
  DateTime? _evaluatedAt;
  String? _evaluation;

  // CONSTRUCTORS ---------------------
  ResPatientTest(
      {required super.pCore,
      UsrUser? pTherapist,
      UsrUser? pPatient,
      DateTime? pAssignAt,
      DateTime? pCompletedAt,
      UsrUser? pEvaluatedBy,
      DateTime? pEvaluatedAt,
      String? pEvaluation}) {
    _therapist = pTherapist;
    _patient = pPatient;
    _assignAt = pAssignAt;
    _completedAt = pCompletedAt;
    _evaluatedBy = pEvaluatedBy;
    _evaluatedAt = pEvaluatedAt;
    _evaluation = pEvaluation;
  }

  ResPatientTest.empty()
      : this(
            pCore: CoreEntity.empty(),
            pTherapist: null,
            pPatient: null,
            pAssignAt: null,
            pCompletedAt: null,
            pEvaluatedBy: null,
            pEvaluatedAt: null,
            pEvaluation: null);

  ResPatientTest.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _therapist = pMap[fldTherapist];
    _patient = pMap[fldPatient];
    _assignAt = pMap[fldAssignedAt];
    _completedAt = pMap[fldCompletedAt];
    _evaluatedBy = pMap[fldEvaluatedBy];
    _evaluatedAt = pMap[fldEvaluatedAt];
    _evaluation = pMap[fldEvaluation];
  }

  ResPatientTest.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(ResPatientTest, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _assignAt = pMap[fldAssignedAt];
    _completedAt = pMap[fldCompletedAt];
    _evaluatedAt = pMap[fldEvaluatedAt];
    _evaluation = pMap[fldEvaluation];

    // Carreguem el terapeuta.
    Future<Exception?> stTherapist(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _evaluatedBy = await dbs.byKey(pCtrl, UsrUser, pKey: pArgs.first);

        // Carreguem el pacient.
        Future<Exception?> stPatient(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _evaluatedBy = await dbs.byKey(pCtrl, UsrUser, pKey: pArgs.first);

            // Carreguem el terapeuta avaluador.
            Future<Exception?> stEvalBy(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _evaluatedBy = await dbs.byKey(pCtrl, UsrUser, pKey: pArgs.first);

                // Carrega createdBy i updatedBy.
                super.core.completeStandard(pCtrl, pMap);
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
    core.isUpdated = (!core.isNew) && (old != _therapist);
  }

  UsrUser? get patient => _patient;
  void setPatient(UsrUser? pPatient) {
    if (isNull(pPatient)) {
      throw errorFieldNotNullable("$enResPatientTest.set", fldPatient);
    }
    var old = _patient;
    _patient = pPatient;
    core.isUpdated = (!core.isNew) && (old != _patient);
  }

  DateTime? get assignAt => _assignAt;
  void setAssignAt(DateTime? pAssignAt) {
    var old = _assignAt;
    _assignAt = pAssignAt;
    core.isUpdated = (!core.isNew) && (old != _assignAt);
  }

  DateTime? get completedAt => _completedAt;
  void setCompletedAt(DateTime? pCompletedAt) {
    var old = _completedAt;
    _completedAt = pCompletedAt;
    core.isUpdated = (!core.isNew) && (old != _completedAt);
  }

  UsrUser? get evaluatedBy => _evaluatedBy;

  DateTime? get evaluatedAt => _evaluatedAt;
  void setEvaluatedAt(DateTime? pEvaluatedAt) {
    var old = _completedAt;
    _evaluatedAt = pEvaluatedAt;
    core.isUpdated = (!core.isNew) && (old != _evaluatedAt);
  }

  String? get evaluation => _evaluation;
  void setEvaluation(String? pEvaluation) {
    var old = _evaluation;
    _evaluation = pEvaluation;
    core.isUpdated = (!core.isNew) && (old != _evaluation);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldTherapist: _therapist,
      fldPatient: _patient,
      fldAssignedAt: _assignAt,
      fldCompletedAt: _completedAt,
      fldEvaluatedBy: _evaluatedBy,
      fldEvaluatedAt: _evaluatedAt,
      fldEvaluation: _evaluation,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldTherapist: _therapist!.serverId,
      fldPatient: _patient!.serverId,
      fldAssignedAt: dTimeToSql(_assignAt),
      fldCompletedAt: dTimeToSql(_completedAt),
      fldEvaluatedBy: _evaluatedBy?.serverId,
      fldEvaluatedAt: dTimeToSql(_evaluatedAt),
      fldEvaluation: _evaluation,
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
      
      $fldTherapist   $dbtIntNotNull REFERENCES $tnUsrUser($fldId),
      $fldPatient     $dbtIntNotNull REFERENCES $tnUsrUser($fldId),
      $fldAssignedAt  $dbtDateTime,
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
    return (isNotNull(super.core.createdBy) &&
        isNotNull(super.core.createdAt) &&
        isNotNull(_therapist) &&
        isNotNull(_patient));
  }
}
