// Representació d'una entrada en el DsmV.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'una entrada en el DsmV.
class RscPhaseResource extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  DisDisease? _disease;
  DisPhase? _phase;
  RscResource? _resource;

  // CONSTRUCTORS ---------------------
  RscPhaseResource(
      {required super.pLocalId,
      required super.pId,
      required super.pCreatedBy,
      required super.pCreatedAt,
      required super.pUpdatedBy,
      required super.pUpdatedAt,
      super.pIsNew,
      super.pIsUpdated,
      super.pIsDeleted,
      DisDisease? pDisease,
      DisPhase? pPhase,
      RscResource? pResource}) {
    _disease = pDisease;
    _phase = pPhase;
    _resource = pResource;
  }

  RscPhaseResource.empty()
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
            pDisease: null,
            pPhase: null,
            pResource: null);

  RscPhaseResource.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _disease = pMap[fldDisease];
    _phase = pMap[fldDiseasePhase];
    _resource = pMap[fldResource];
  }

  RscPhaseResource.bySQLMap(
      BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(RscPhaseResource, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    // Obtenim la malaltia.
    Future<Exception?> stDisease(
        FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _disease = await dbs.byKey(pCtrl, DisDisease, pKey: pArgs.first);

        // Obtenim la fase.
        Future<Exception?> stPhase(
            FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _phase = await dbs.byKey(pCtrl, DisPhase, pKey: pArgs.first);

            // Obtenim el recurs.
            Future<Exception?> stResource(
                FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _resource =
                    await dbs.byKey(pCtrl, RscResource, pKey: pArgs.first);

                // Carrega createdBy i updatedBy.
                super.completeStandard(pCtrl, pMap);
              } on Exception catch (pExc) {
                exc = pExc;
              }
              return exc;
            }

            pCtrl.state.sneakFn(stResource, pArgs: [pMap[fldDiseasePhase]]);
          } on Exception catch (pExc) {
            exc = pExc;
          }
          return exc;
        }

        pCtrl.state.sneakFn(stPhase, pArgs: [pMap[fldDiseasePhase]]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stDisease, pArgs: [pMap[fldDisease]]);
  }

  // GETTERS i SETTERS ----------------
  DisDisease? get disease => _disease;
  void setDisease(DisDisease? pDis) {
    if (isNull(pDis)) {
      throw errorFieldNotNullable("$enRscPhaseResource.set", fldDisease);
    }
    var old = _disease;
    _disease = pDis;
    super.isUpdated = (!super.isNew) && (old != _disease);
  }

  DisPhase? get phase => _phase;
  void setPhase(DisPhase? pPhase) {
    var old = _phase;
    _phase = pPhase;
    super.isUpdated = (!super.isNew) && (old != _phase);
  }

  RscResource? get resource => _resource;
  void setResource(RscResource? pResource) {
    if (isNull(pResource)) {
      throw errorFieldNotNullable("$enRscPhaseResource.set", fldResource);
    }
    var old = _resource;
    _resource = pResource;
    super.isUpdated = (!super.isNew) && (old != _resource);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldDisease: _disease,
      fldDiseasePhase: _phase,
      fldResource: _resource,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldDisease: _disease!.id,
      fldDiseasePhase: _phase!.id,
      fldResource: _resource!.id,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldDisease,
        fldDiseasePhase,
        fldResource,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnRscPhaseResource (
      $standardHeader,
      
      $fldDisease      $dbtIntNotNull REFERENCES $tnDisDisease($fldId),
      $fldDiseasePhase $dbtInt REFERENCES $tnDisPhase($fldId),
      $fldResource     $dbtIntNotNull REFERENCES $tnRscResource($fldId)
    );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldDisease, $fldDiseasePhase, $fldResource
    FROM   $tnRscPhaseResource
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnRscPhaseResource
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnRscPhaseResource (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldDisease, $fldDiseasePhase, $fldResource)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnRscPhaseResource
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldDisease = ?,
        $fldDiseasePhase = ?,
        $fldResource = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_disease) &&
        isNotNull(_resource));
  }
}
