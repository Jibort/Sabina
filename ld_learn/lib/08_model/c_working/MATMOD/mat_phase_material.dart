// Representació d'una entrada en el DsmV.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/a_user/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'una entrada en el DsmV.
class MatMaterialPhase extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  UsrUser? _patient;
  RscPhaseResource? _phase;

  // CONSTRUCTORS ---------------------
  MatMaterialPhase(
      {required super.pLocalId,
      required super.pId,
      required super.pCreatedBy,
      required super.pCreatedAt,
      required super.pUpdatedBy,
      required super.pUpdatedAt,
      super.pIsNew,
      super.pIsUpdated,
      super.pIsDeleted,
      UsrUser? pPatient,
      RscPhaseResource? pPhase}) {
    _patient = pPatient;
    _phase = pPhase;
  }

  MatMaterialPhase.empty()
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
            pPatient: null,
            pPhase: null);

  MatMaterialPhase.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _patient = pMap[fldPatient];
    _phase = pMap[fldPhaseResource];
  }

  MatMaterialPhase.bySQLMap(
      BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(MatMaterialPhase, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    // Càrrega del pacient.
    Future<Exception?> stPatient(
        FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _patient = await dbs.byKey(pCtrl, UsrUser, pKey: pArgs.first);

        // Càrrega del recurs de la fase.
        Future<Exception?> stPhase(
            FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _phase =
                await dbs.byKey(pCtrl, RscPhaseResource, pKey: pArgs.first);

            // Carrega createdBy i updatedBy.
            super.completeStandard(pCtrl, pMap);
          } on Exception catch (pExc) {
            exc = pExc;
          }
          return exc;
        }

        pCtrl.state.sneakFn(stPhase, pArgs: [pMap[fldPhaseResource]]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stPatient, pArgs: [pMap[fldPatient]]);
  }

  // GETTERS i SETTERS ----------------
  UsrUser? get patient => _patient;
  void setPatient(UsrUser? pPatient) {
    if (isNull(pPatient)) {
      throw errorFieldNotNullable("$enMatPhaseMaterial.set", fldPatient);
    }
    var old = _patient;
    _patient = pPatient;
    super.isUpdated = (!super.isNew) && (old != _patient);
  }

  RscPhaseResource? get phase => _phase;
  void setPhase(RscPhaseResource? pPhase) {
    if (isNull(pPhase)) {
      throw errorFieldNotNullable("$enMatPhaseMaterial.set", fldPhaseResource);
    }
    var old = _phase;
    _phase = pPhase;
    super.isUpdated = (!super.isNew) && (old != _phase);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldPatient: _patient,
      fldPhaseResource: _phase,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldPatient: _patient!.id,
      fldPhaseResource: _phase!.id,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldPatient,
        fldPhaseResource,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnMatPhaseMaterial (
      $standardHeader,
      
      $fldPatient       $dbtIntNotNull REFERENCES $tnUsrUser($fldId),
      $fldPhaseResource $dbtIntNotNull REFERENCES $tnRscPhaseResource($fldId)
      );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldPatient      
           $fldPhaseResource
    FROM   $tnMatPhaseMaterial
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnMatPhaseMaterial
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnMatPhaseMaterial (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldPatient, $fldPhaseResource)
    VALUES (?, ?, ?, ?, ?,   ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnMatPhaseMaterial
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldPatient = ?,
        $fldPhaseResource = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_patient) &&
        isNotNull(_phase));
  }
}
