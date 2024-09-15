// Representació d'una fita asolida del tractament.
// createdAt: 24/08/29 dj. JIQ

// ignore_for_file: unnecessary_getters_setters, prefer_final_fields

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/08_model/c_working/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Enumeració dels estats d'una fita de tractament.
enum AchievementState {
  unspecified,
  proposed,
  pending,
  cancelled,
  achieved,
  relapsed,
}

// Representació d'una fita asolida del tractament.
class DgnAchievement extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  DisGoal? _goal;
  DgnDiagnosisPhase? _phase;
  AchievementState _state = AchievementState.unspecified;
  DgnAchievement? _relapse;
  String? _annotations;

  // CONSTRUCTORS ---------------------
  DgnAchievement(
      {required super.pCore,
      DisGoal? pGoal,
      DgnDiagnosisPhase? pPhase,
      AchievementState pState = AchievementState.unspecified,
      DgnAchievement? pRelapse,
      String? pAnnotations}) {
    _goal = pGoal;
    _phase = pPhase;
    _state = pState;
    _relapse = pRelapse;
    _annotations = pAnnotations;
  }

  DgnAchievement.empty()
      : this(
            pCore: CoreEntity.empty(),
            pGoal: null,
            pPhase: null,
            pState: AchievementState.unspecified,
            pRelapse: null,
            pAnnotations: null);

  DgnAchievement.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _goal = pMap[fldGoal];
    _phase = pMap[fldDiagnosisPhase];
    _state = pMap[fldAchievementState];
    _relapse = pMap[fldRelapse];
    _annotations = pMap[fldAnnotations];
  }

  DgnAchievement.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(DgnAchievement, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _annotations = pMap[fldAnnotations];
    _state = dyn2AchievementState(pMap[fldAchievementState]);

    // Carreguem l'objectiu de la fita.
    Future<Exception?> stGoal(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _goal = await dbs.byKey(pCtrl, DisGoal, pKey: pArgs.first);

        // Carreguem la fase de la diagnosi on s'assoleix la fita.
        Future<Exception?> stPhase(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _phase = await dbs.byKey(pCtrl, DgnDiagnosisPhase, pKey: pArgs.first);

            // Carreguem la fita recaiguda, si existeix.
            Future<Exception?> stRelapse(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _relapse = await dbs.byKey(pCtrl, DgnAchievement, pKey: pArgs.first);

                // Carrega createdBy i updatedBy.
                super.core.completeStandard(pCtrl, pMap);
              } on Exception catch (pExc) {
                exc = pExc;
              }
              return exc;
            }

            pCtrl.state.sneakFn(stRelapse, pArgs: [pMap[fldRelapse]]);
          } on Exception catch (pExc) {
            exc = pExc;
          }
          return exc;
        }

        pCtrl.state.sneakFn(stPhase, pArgs: [pMap[fldDiagnosisPhase]]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stGoal, pArgs: [pMap[fldGoal]]);
  }

  // GETTERS i SETTERS ----------------
  DisGoal? get goal => _goal;
  void setGoal(DisGoal? pGoal) {
    if (isNull(pGoal)) {
      throw errorFieldNotNullable("$enDgnAchievement.set", fldGoal);
    }
    var old = _goal;
    _goal = pGoal;
    core.isUpdated = (!core.isNew) && (old != _goal);
  }

  DgnDiagnosisPhase? get phase => _phase;
  void setPhase(DgnDiagnosisPhase? pPhase) {
    if (isNull(pPhase)) {
      throw errorFieldNotNullable("$enDgnAchievement.set", fldDiagnosisPhase);
    }
    var old = _phase;
    _phase = pPhase;
    core.isUpdated = (!core.isNew) && (old != _phase);
  }

  DgnAchievement? get relapse => _relapse;
  void setRelapse(DgnAchievement? pRelapse) {
    var old = _relapse;
    _relapse = pRelapse;
    core.isUpdated = (!core.isNew) && (old != _relapse);
  }

  AchievementState get state => _state;
  void setState(AchievementState pState) {
    var old = _state;
    _state = pState;
    core.isUpdated = (!core.isNew) && (old != _state);
  }

  String? get annotations => _annotations;
  void setAnnotation(String? pAnnotations) {
    var old = _annotations;
    _annotations = pAnnotations;
    core.isUpdated = (!core.isNew) && (old != _annotations);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldGoal: _goal,
      fldDiagnosisPhase: _phase,
      fldRelapse: _relapse,
      fldAchievementState: _state,
      fldAnnotations: _annotations,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldGoal: _goal!.serverId,
      fldDiagnosisPhase: _phase!.serverId,
      fldRelapse: _relapse?.serverId,
      fldAchievementState: _state.id,
      fldAnnotations: _annotations,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldGoal,
        fldDiagnosisPhase,
        fldRelapse,
        fldAchievementState,
        fldAnnotations,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnDgnAchievement (
      $standardHeader,
      
      $fldGoal             $dbtIntNotNull REFERENCES $tnDisGoal($fldId),
      $fldDiagnosisPhase   $dbtIntNotNull REFERENCES $tnDgnDiagnosisPhase($fldId),
      $fldRelapse          $dbtInt REFERENCES $tnDgnAchievement($fldId),
      $fldAchievementState $dbtIntNotNull DEFAULT 0,
      $fldAnnotations      $dbtText
      );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldGoal, $fldDiagnosisPhase, $fldRelapse,
           $fldAchievementState, $fldAnnotations
    FROM   $tnDgnAchievement
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnDgnAchievement
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnDgnAchievement (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldGoal, $fldDiagnosisPhase, $fldRelapse,
      $fldAchievementState, $fldAnnotations)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?,  ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnDgnAchievement
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldGoal = ?,
        $fldDiagnosisPhase = ?,
        $fldRelapse = ?,
        $fldAchievementState = ?,
        $fldAnnotations = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (isNotNull(super.core.createdBy) &&
        isNotNull(super.core.createdAt) &&
        isNotNull(_goal) &&
        isNotNull(_phase) &&
        isNotNull(_state));
  }
}

extension AchievementStateIdx on AchievementState {
  // Retorna l'Id de l'estat d'una fita de tractament.
  int get id {
    switch (this) {
      case AchievementState.unspecified:
        return 0;
      case AchievementState.proposed:
        return 1;
      case AchievementState.pending:
        return 2;
      case AchievementState.cancelled:
        return 3;
      case AchievementState.achieved:
        return 4;
      case AchievementState.relapsed:
        return 5;
      default:
        throw 'Invalid DiagnosisState.${toString()}';
    }
  }
}

// Retorna l'estat d'una fita de tractament.
AchievementState achievementById(int pId) {
  switch (pId) {
    case 0:
      return AchievementState.unspecified;
    case 1:
      return AchievementState.proposed;
    case 2:
      return AchievementState.pending;
    case 3:
      return AchievementState.cancelled;
    case 4:
      return AchievementState.achieved;
    case 5:
      return AchievementState.relapsed;
    default:
      throw 'Invalid DeviceState.id: $pId';
  }
}

// Retorn l'estat d'una fita de tractament.
AchievementState dyn2AchievementState(dynamic pState) {
  switch (pState) {
    case AchievementState type:
      return type;
    case int value:
      return achievementById(value);
    default:
      throw errorUnknownType("$enDgnAchievement.set", fldAchievementState, pState.runtimeType);
  }
}
