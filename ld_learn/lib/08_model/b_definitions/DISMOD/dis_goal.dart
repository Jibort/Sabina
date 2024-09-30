// Representació d'un objectiu d'etapa.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/b_definitions/DISMOD/dis_phase.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'un objectiu d'etapa.
class DisGoal extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  int? _idx;
  String? _nameKey;
  String? _name;
  String? _descKey;
  String? _desc;
  DisPhase? _phase;

  // CONSTRUCTORS ---------------------
  DisGoal(
      {required super.pLocalId,
      required super.pId,
      required super.pCreatedBy,
      required super.pCreatedAt,
      required super.pUpdatedBy,
      required super.pUpdatedAt,
      super.pIsNew,
      super.pIsUpdated,
      super.pIsDeleted,
      int? pIdx,
      String? pNameKey,
      String? pName,
      String? pDescKey,
      String? pDesc,
      DisPhase? pPhase}) {
    _idx = pIdx;
    _nameKey = pNameKey;
    _name = pName;
    _descKey = pDescKey;
    _desc = pDesc;
    _phase = pPhase;
  }

  DisGoal.empty()
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
            pNameKey: null,
            pName: null,
            pDescKey: null,
            pDesc: null,
            pPhase: null);

  DisGoal.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _idx = pMap[fldIdx];
    _nameKey = pMap[fldNameKey];
    _name = pMap[fldName];
    _descKey = pMap[fldDescKey];
    _desc = pMap[fldDesc];
    _phase = pMap[fldDiseasePhase];
  }

  DisGoal.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(DisGoal, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _idx = pMap[fldIdx];
    _descKey = pMap[fldDescKey];

    // Traduïm el name key.
    Future<Exception?> stName(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _nameKey = pArgs.first;
        _name = await dbs.trans(pCtrl, pTKey: _nameKey);

        // Traduïm el desc key.
        Future<Exception?> stDesc(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _desc = await dbs.trans(pCtrl, pTKey: pArgs.first);

            // Obtenim la fase.
            Future<Exception?> stPhase(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
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

        pCtrl.state.sneakFn(stDesc, pArgs: [_descKey]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stName, pArgs: [pMap[fldNameKey]]);
  }

  // GETTERS i SETTERS ----------------
  int? get idx => _idx;
  set idx(int? pIdx) {
    if (isNull(pIdx)) {
      throw errorFieldNotNullable("$enDisGoal.set", fldIdx);
    }
    var old = _idx;
    _idx = pIdx;
    super.isUpdated = (!super.isNew) && (old != _idx);
  }

  String? get nameKey => _nameKey;
  String? get name => _name;
  void setName(String? pKey, String? pName) {
    if (isNull(pName)) {
      throw errorFieldNotNullable("$enDisGoal.set", fldName);
    }
    var oldKey = _nameKey;
    _nameKey = pKey;
    _name = pName;
    super.isUpdated = (!super.isNew) && (oldKey != _nameKey);
  }

  String? get descKey => _descKey;
  String? get desc => _desc;
  void setDesc(String? pKey, String? pDesc) {
    var oldKey = _descKey;
    _descKey = pKey;
    _desc = pDesc;
    super.isUpdated = (!super.isNew) && (oldKey != _descKey);
  }

  DisPhase? get phase => _phase;
  void setPhase(DisPhase? pPhase) {
    if (isNull(pPhase)) {
      throw errorFieldNotNullable("$enDisGoal.set", fldDiseasePhase);
    }
    var oldPhase = _phase;
    _phase = pPhase;
    super.isUpdated = (!super.isNew) && (oldPhase != _phase);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldIdx: _idx,
      fldNameKey: _nameKey,
      fldName: _name,
      fldDescKey: _descKey,
      fldDesc: _desc,
      fldDiseasePhase: _phase,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldIdx: _idx,
      fldNameKey: _nameKey,
      fldDescKey: _descKey,
      fldDiseasePhase: _phase!.id,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldIdx,
        fldNameKey,
        fldDescKey,
        fldDiseasePhase,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnDisGoal (
      $standardHeader,
      
      $fldIdx          $dbtIntNotNull,
      $fldNameKey      $dbtTextNotNull,
      $fldDescKey      $dbtTextNotNull,
      $fldDiseasePhase $dbtIntNotNull REFERENCES $tnDisPhase($fldId)
      );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldNameKey, $fldDescKey, $fldDiseasePhase   
    FROM   $tnDisGoal
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnDisGoal
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnDisGoal (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldIdx, $fldNameKey, $fldDescKey, $fldDiseasePhase)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnDisGoal
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldIdx = ?,
        $fldNameKey = ?,
        $fldDescKey = ?,
        $fldDiseasePhase = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_idx) &&
        isNotNull(_nameKey) &&
        isNotNull(_descKey) &&
        isNotNull(_phase));
  }
}
