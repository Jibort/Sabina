// Representació d'una entrada en el DsmV.
// createdAt: 24/08/22 dj. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'una entrada en el DsmV.
class TckPhaseTracking extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  DisPhase? _phase;
  TckTracking? _tracking;

  // CONSTRUCTORS ---------------------
  TckPhaseTracking(
      {required super.pLocalId,
      required super.pId,
      required super.pCreatedBy,
      required super.pCreatedAt,
      required super.pUpdatedBy,
      required super.pUpdatedAt,
      super.pIsNew,
      super.pIsUpdated,
      super.pIsDeleted,
      DisPhase? pPhase,
      TckTracking? pTracking}) {
    _phase = pPhase;
    _tracking = pTracking;
  }

  TckPhaseTracking.empty()
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
            pPhase: null,
            pTracking: null);

  TckPhaseTracking.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _phase = pMap[fldDiseasePhase];
    _tracking = pMap[fldTracking];
  }

  TckPhaseTracking.bySQLMap(
      BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(TckPhaseTracking, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    // Obtenim el tracking.
    Future<Exception?> stTracking(
        FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _tracking = await dbs.byKey(pCtrl, TckTracking, pKey: pArgs.first);

        // Obtenim la fase de la malaltia.
        Future<Exception?> stPhase(
            FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _phase = await dbs.byKey(pCtrl, DisPhase, pKey: pArgs.first);

            // Carrega createdBy i updatedBy.
            super.completeStandard(pCtrl, pMap);
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

    pCtrl.state.sneakFn(stTracking, pArgs: [pMap[fldTracking]]);
  }

  // GETTERS i SETTERS ----------------
  DisPhase? get phase => _phase;
  void setPhase(DisPhase? pPhase) {
    if (isNull(pPhase)) {
      throw errorFieldNotNullable("$fldTracking.set", fldDiseasePhase);
    }
    var old = _phase;
    _phase = pPhase;
    super.isUpdated = (!super.isNew) && (old != _phase);
  }

  TckTracking? get tracking => _tracking;
  void setTracking(TckTracking? pTracking) {
    if (isNull(pTracking)) {
      throw errorFieldNotNullable("$fldTracking.set", fldTracking);
    }
    var old = _tracking;
    _tracking = pTracking;
    super.isUpdated = (!super.isNew) && (old != _tracking);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldDiseasePhase: _phase,
      fldTracking: _tracking,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldDiseasePhase: _phase!.id,
      fldTracking: _tracking!.id,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldDiseasePhase,
        fldTracking,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnTckPhaseTracking (
      $standardHeader,,
      
      $fldDiseasePhase $dbtIntNotNull REFERENCES $tnDisPhase($fldId),
      $fldTracking     $dbtIntNotNull REFERENCES $tnTckTracking($fldId)
      );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldDiseasePhase, $fldTracking
    FROM   $tnTckPhaseTracking
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnTckPhaseTracking
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnTckPhaseTracking (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldDiseasePhase, $fldTracking)
    VALUES (?, ?, ?, ?, ?,   ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnTckPhaseTracking
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldDiseasePhase = ?,
        $fldTracking = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_tracking) &&
        isNotNull(_phase));
  }
}
