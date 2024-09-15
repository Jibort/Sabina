// Representació d'una entrada en el DsmV.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/a_user/index.dart';
import 'package:ld_learn/08_model/b_definitions/DISMOD/dis_disease.dart';
import 'package:ld_learn/09_tools/index.dart';

// Enumeració dels estats d'un diagnòstic.
enum DiagnosisState {
  unspecified,
  stablished,
  cancelled,
  cured,
  chronicled,
}

// Representació d'una entrada en el DsmV.
class DgnDiagnosis extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  DisDisease? _disease;
  UsrUser? _therapist;
  DiagnosisState _state = DiagnosisState.unspecified;
  String? _annotations;

  // CONSTRUCTORS ---------------------
  DgnDiagnosis(
      {required super.pCore,
      DisDisease? pDisease,
      UsrUser? pTherapist,
      DiagnosisState pState = DiagnosisState.unspecified,
      String? pAnnotations}) {
    _disease = pDisease;
    _therapist = pTherapist;
    _state = pState;
    _annotations = pAnnotations;
  }

  DgnDiagnosis.empty()
      : this(
            pCore: CoreEntity.empty(),
            pDisease: null,
            pTherapist: null,
            pState: DiagnosisState.unspecified,
            pAnnotations: null);

  DgnDiagnosis.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _disease = pMap[fldDisease];
    _therapist = pMap[fldTherapist];
    _state = pMap[fldDiagnosisState];
    _annotations = pMap[fldAnnotations];
  }

  DgnDiagnosis.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(DgnDiagnosis, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _state = pMap[fldDiagnosisState];
    _annotations = pMap[fldAnnotations];

    // Carreguem la malaltia.
    Future<Exception?> stDisease(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _disease = await dbs.byKey(pCtrl, DisDisease, pKey: pArgs.first);

        // Carreguem el terapeuta.
        Future<Exception?> stTherapist(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _therapist = await dbs.byKey(pCtrl, UsrUser, pKey: pArgs.first);

            // Carrega createdBy i updatedBy.
            super.core.completeStandard(pCtrl, pMap);
          } on Exception catch (pExc) {
            exc = pExc;
          }
          return exc;
        }

        pCtrl.state.sneakFn(stTherapist, pArgs: [pMap[fldTherapist]]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stDisease, pArgs: [pMap[fldDisease]]);
  }

  // GETTERS i SETTERS ----------------
  DisDisease? get disease => _disease;
  void setDisease(DisDisease? pDisease) {
    if (isNull(pDisease)) {
      throw errorFieldNotNullable("$enDgnDiagnosis.set", fldDisease);
    }
    var old = _disease;
    _disease = pDisease;
    core.isUpdated = (!core.isNew) && (old != _disease);
  }

  UsrUser? get therapist => _therapist;
  void setTherapist(UsrUser? pTherapist) {
    if (isNull(pTherapist)) {
      throw errorFieldNotNullable("$enDgnDiagnosis.set", fldTherapist);
    }
    var old = _therapist;
    _therapist = pTherapist;
    core.isUpdated = (!core.isNew) && (old != _therapist);
  }

  DiagnosisState get state => _state;
  void setState(DiagnosisState pState) {
    if (pState == DiagnosisState.unspecified) {
      throw errorFieldNotNullable("$enDgnDiagnosis.set", fldDiagnosisState);
    }
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
      fldDisease: _disease,
      fldTherapist: _therapist,
      fldDiagnosisState: _state,
      fldAnnotations: _annotations,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldDisease: _disease!.serverId,
      fldTherapist: _therapist!.serverId,
      fldDiagnosisState: _state.id,
      fldAnnotations: _annotations,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldDisease,
        fldTherapist,
        fldDiagnosisState,
        fldAnnotations,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnDgnDiagnosis (
      $standardHeader,
      
      $fldDisease        $dbtIntNotNull REFERENCES $tnDisDisease($fldId),
      $fldTherapist      $dbtIntNotNull REFERENCES $tnUsrUser($fldId),
      $fldDiagnosisState $dbtIntNotNull DEFAULT 0,
      $fldAnnotations    $dbtText
      );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldDisease, $fldTherapist, $fldDiagnosisState, $fldAnnotations
    FROM   $tnDgnDiagnosis
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnDgnDiagnosis
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnDgnDiagnosis (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldDisease, $fldTherapist, $fldDiagnosisState, $fldAnnotations)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnDgnDiagnosis
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldDisease = ?,
        $fldTherapist = ?,
        $fldDiagnosisState = ?,
        $fldAnnotations = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (isNotNull(super.core.createdBy) &&
        isNotNull(super.core.createdAt) &&
        isNotNull(_disease) &&
        isNotNull(_therapist) &&
        isNotNull(_state));
  }
}

extension DiagnosisStateIdx on DiagnosisState {
  // Retorna l'Id de l'estat del diagnòstic.
  int get id {
    switch (this) {
      case DiagnosisState.unspecified:
        return 0;
      case DiagnosisState.stablished:
        return 1;
      case DiagnosisState.cancelled:
        return 2;
      case DiagnosisState.cured:
        return 3;
      case DiagnosisState.chronicled:
        return 4;
      default:
        throw 'Invalid DiagnosisState.${toString()}';
    }
  }
}

// Retorna l'estat d'un diagnòstic a partir del seu Id.
DiagnosisState diagnosisStateById(int pId) {
  switch (pId) {
    case 0:
      return DiagnosisState.unspecified;
    case 1:
      return DiagnosisState.stablished;
    case 2:
      return DiagnosisState.cancelled;
    case 3:
      return DiagnosisState.cured;
    case 4:
      return DiagnosisState.chronicled;
    default:
      throw 'Invalid DeviceState.id: $pId';
  }
}

// Retorn l'estat d'un diagnòstic a partir d'un dynamic.
DiagnosisState dyn2DiagnosisState(dynamic pState) {
  switch (pState) {
    case DiagnosisState type:
      return type;
    case int value:
      return diagnosisStateById(value);
    default:
      throw errorUnknownType("DiagnosisState.set", fldDiagnosisState, pState.runtimeType);
  }
}
