// Representació d'una entrada en el DsmV.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/08_model/c_working/index.dart';
import 'package:ld_learn/08_model/d_administration/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Enumeració dels estats d'una fase de la diagnosi.
enum DiagnosisPhaseState {
  unspecified,
  opened,
  achieved,
  relapsed,
  chronicled,
}

// Representació d'una entrada en el DsmV.
class DgnDiagnosisPhase extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  DgnDiagnosis? _diagnosis;
  DisPhase? _phase;
  VisVisit? _visit;
  DiagnosisPhaseState _state = DiagnosisPhaseState.unspecified;
  DgnDiagnosisPhase? _relapse;
  String? _annotations;

  // CONSTRUCTORS ---------------------
  DgnDiagnosisPhase(
      {required super.pCore,
      DgnDiagnosis? pDiagnosis,
      DisPhase? pPhase,
      VisVisit? pVisit,
      DiagnosisPhaseState pState = DiagnosisPhaseState.unspecified,
      DgnDiagnosisPhase? pRelapse,
      String? pAnnotations}) {
    _diagnosis = pDiagnosis;
    _phase = pPhase;
    _visit = pVisit;
    _state = pState;
    _relapse = pRelapse;
    _annotations = pAnnotations;
  }

  DgnDiagnosisPhase.empty()
      : this(
            pCore: CoreEntity.empty(),
            pDiagnosis: null,
            pPhase: null,
            pVisit: null,
            pState: DiagnosisPhaseState.unspecified,
            pRelapse: null,
            pAnnotations: null);

  DgnDiagnosisPhase.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _diagnosis = pMap[fldDiagnosis];
    _phase = pMap[fldDiseasePhase];
    _visit = pMap[fldVisit];
    _state = pMap[fldDiagnosisPhaseState];
    _relapse = pMap[fldRelapse];
    _annotations = pMap[fldAnnotations];
  }

  DgnDiagnosisPhase.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(DgnDiagnosisPhase, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _annotations = pMap[fldAnnotations];
    _state = diagnosisPhaseStateById(pMap[fldDiagnosisPhaseState]);

    // Carreguem la diagnosi.
    Future<Exception?> stDiagnosis(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _diagnosis = await dbs.byKey(pCtrl, DgnDiagnosis, pKey: pArgs.first);

        // Carreguem la fase.
        Future<Exception?> stPhase(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _phase = await dbs.byKey(pCtrl, DgnDiagnosisPhase, pKey: pArgs.first);

            // Carreguem la visita.
            Future<Exception?> stVisit(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _phase = await dbs.byKey(pCtrl, DgnDiagnosisPhase, pKey: pArgs.first);

                // Carreguem la recaiguda.
                Future<Exception?> stRelapse(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                  try {
                    _relapse = await dbs.byKey(pCtrl, DgnDiagnosisPhase, pKey: pArgs.first);

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

            pCtrl.state.sneakFn(stVisit, pArgs: [pMap[fldVisit]]);
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

    pCtrl.state.sneakFn(stDiagnosis, pArgs: [pMap[fldDiagnosis]]);
  }

  // GETTERS i SETTERS ----------------
  DgnDiagnosis? get diagnosis => _diagnosis;
  void setDiagnosis(DgnDiagnosis? pDiagnosis) {
    if (isNull(pDiagnosis)) {
      throw errorFieldNotNullable("$enDgnDiagnosisPhase.set", fldDiagnosis);
    }
    var old = _diagnosis;
    _diagnosis = pDiagnosis;
    core.isUpdated = (!core.isNew) && (old != _diagnosis);
  }

  DisPhase? get diseasePhase => _phase;
  void setDiseasePhase(DisPhase? pPhase) {
    if (isNull(pPhase)) {
      throw errorFieldNotNullable("$enDgnDiagnosisPhase.set", fldDiseasePhase);
    }
    var old = _phase;
    _phase = pPhase;
    core.isUpdated = (!core.isNew) && (old != _phase);
  }

  VisVisit? get visit => _visit;
  void setVisit(VisVisit? pVisit) {
    if (isNull(pVisit)) {
      throw errorFieldNotNullable("$enDgnDiagnosisPhase.set", fldVisit);
    }
    var old = _visit;
    _visit = pVisit;
    core.isUpdated = (!core.isNew) && (old != _visit);
  }

  DiagnosisPhaseState? get state => _state;
  void setState(DiagnosisPhaseState pState) {
    var old = _state;
    _state = pState;
    core.isUpdated = (!core.isNew) && (old != _state);
  }

  DgnDiagnosisPhase? get relapse => _relapse;
  void setRelapse(DgnDiagnosisPhase? pRelapse) {
    var old = _relapse;
    _relapse = pRelapse;
    core.isUpdated = (!core.isNew) && (old != _relapse);
  }

  String? get annotations => _annotations;
  void setAnnotations(String? pAnnotations) {
    var old = _annotations;
    _annotations = pAnnotations;
    core.isUpdated = (!core.isNew) && (old != _annotations);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldDiagnosis: _diagnosis,
      fldDiseasePhase: _phase,
      fldVisit: _visit,
      fldDiagnosisPhaseState: _state,
      fldRelapse: _relapse,
      fldAnnotations: _annotations,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldDiagnosis: _diagnosis!.serverId,
      fldDiseasePhase: _phase!.serverId,
      fldVisit: _visit!.serverId,
      fldDiagnosisPhaseState: _state.id,
      fldRelapse: _relapse?.serverId,
      fldAnnotations: _annotations,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldDiagnosis,
        fldDiseasePhase,
        fldVisit,
        fldDiagnosisPhaseState,
        fldRelapse,
        fldAnnotations,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnDgnDiagnosisPhase (
      $standardHeader,
      
      $fldDiagnosis           $dbtIntNotNull REFERENCES $tnDgnDiagnosis($fldId),
      $fldDiseasePhase        $dbtIntNotNull REFERENCES $tnDisPhase($fldId),
      $fldVisit               $dbtIntNotNull REFERENCES $tnVisVisit($fldId),
      $fldDiagnosisPhaseState $dbtIntNotNull DEFAULT 0,
      $fldRelapse             $dbtInt REFERENCES $tnDgnDiagnosisPhase($fldId),
      $fldAnnotations         $dbtText
    );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldDiagnosis, $fldDiseasePhase, $fldVisit,
           $fldDiagnosisPhaseState, $fldRelapse, $fldAnnotations

    FROM   $tnDgnDiagnosisPhase
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnDgnDiagnosisPhase
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnDgnDiagnosisPhase (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldDiagnosis, $fldDiseasePhase, $fldVisit,
      $fldDiagnosisPhaseState, $fldRelapse, $fldAnnotations)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?,  ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnDgnDiagnosisPhase
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldDiagnosis = ?,
        $fldDiseasePhase = ?,
        $fldVisit = ?,
        $fldDiagnosisPhaseState = ?,
        $fldRelapse = ?,
        $fldAnnotations = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (isNotNull(super.core.createdBy) &&
        isNotNull(super.core.createdAt) &&
        isNotNull(_diagnosis) &&
        isNotNull(_phase) &&
        isNotNull(_visit) &&
        isNotNull(_state));
  }
}

extension DiagnosisPhaseStateIdx on DiagnosisPhaseState {
  // Retorna l'Id de l'estat de la fase d'un diagnòstic.
  int get id {
    switch (this) {
      case DiagnosisPhaseState.unspecified:
        return 0;
      case DiagnosisPhaseState.opened:
        return 1;
      case DiagnosisPhaseState.achieved:
        return 2;
      case DiagnosisPhaseState.relapsed:
        return 3;
      case DiagnosisPhaseState.chronicled:
        return 4;
      default:
        throw 'Invalid DiagnosisPhaseState.${toString()}';
    }
  }
}

// Retorna l'estat de la fase d'un diagnòstic a partir del seu Id.
DiagnosisPhaseState diagnosisPhaseStateById(int pId) {
  switch (pId) {
    case 0:
      return DiagnosisPhaseState.unspecified;
    case 1:
      return DiagnosisPhaseState.opened;
    case 2:
      return DiagnosisPhaseState.achieved;
    case 3:
      return DiagnosisPhaseState.relapsed;
    case 4:
      return DiagnosisPhaseState.chronicled;
    default:
      throw 'Invalid DeviceState.id: $pId';
  }
}

// Retorn l'estat de la fase d'un diagnòstic a partir d'un dynamic.
DiagnosisPhaseState dyn2DiagnosisPhaseState(dynamic pState) {
  switch (pState) {
    case DiagnosisPhaseState type:
      return type;
    case int value:
      return diagnosisPhaseStateById(value);
    default:
      throw errorUnknownType("DeviceState.set", fldDeviceState, pState.runtimeType);
  }
}
