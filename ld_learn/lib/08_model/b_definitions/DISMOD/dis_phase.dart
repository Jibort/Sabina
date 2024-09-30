// Representació d'una fase de malaltia.
// createdAt: 24/08/20 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'una fase de malaltia.
class DisPhase extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  int? _idx;
  String? _nameKey;
  String? _name;
  String? _descKey;
  String? _desc;
  DisDisease? _disease;

  // CONSTRUCTORS ---------------------
  DisPhase(
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
      DisDisease? pDisease}) {
    _idx = pIdx;
    _nameKey = pNameKey;
    _name = pName;
    _descKey = pDescKey;
    _desc = pDesc;
    _disease = pDisease;
  }

  DisPhase.empty()
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
            pDisease: null);

  DisPhase.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _idx = pMap[fldIdx];
    _nameKey = pMap[fldNameKey];
    _name = pMap[fldName];
    _descKey = pMap[fldDescKey];
    _desc = pMap[fldDesc];
    _disease = pMap[fldDisease];
  }

  DisPhase.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(DisPhase, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _idx = pMap[fldIdx];
    _nameKey = pMap[fldNameKey];
    _descKey = pMap[fldDescKey];

    // Traduïm el name key.
    Future<Exception?> stName(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _name = await dbs.trans(pCtrl, pTKey: pArgs.first);

        // Traduïm el desc key.
        Future<Exception?> stDesc(
            FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _desc = await dbs.trans(pCtrl, pTKey: pArgs.first);

            // Obtenim la malaltia.
            Future<Exception?> stDisease(
                FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _disease =
                    await dbs.byKey(pCtrl, DisDisease, pKey: pArgs.first);

                // Carrega createdBy i updatedBy.
                super.completeStandard(pCtrl, pMap);
              } on Exception catch (pExc) {
                exc = pExc;
              }
              return exc;
            }

            pCtrl.state.sneakFn(stDisease, pArgs: [pMap[fldDisease]]);
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

    pCtrl.state.sneakFn(stName, pArgs: [_nameKey]);
  }

  // GETTERS i SETTERS ----------------
  int? get idx => _idx;
  set idx(int? pIdx) {
    if (isNull(pIdx)) {
      throw errorFieldNotNullable("$enDisPhase.set", fldIdx);
    }
    var old = _idx;
    _idx = pIdx;
    super.isUpdated = (!super.isNew) && (old != _idx);
  }

  String? get nameKey => _nameKey;
  String? get name => _name;
  void setName(String? pNameKey, String? pName) {
    if (isNull(pNameKey) || isNull(pName)) {
      throw errorFieldNotNullable("$enDisPhase.set", fldName);
    }
    var oldKey = _nameKey;
    _nameKey = pNameKey;
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

  DisDisease? get disease => _disease;
  void setDisease(DisDisease? pDisease) {
    var oldDisease = _disease;
    _disease = pDisease;
    super.isUpdated = (!super.isNew) && (oldDisease != _disease);
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
      fldDisease: _disease,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldIdx: _idx,
      fldNameKey: _nameKey,
      fldDescKey: _descKey,
      fldDisease: _disease!.id,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldIdx,
        fldNameKey,
        fldDescKey,
        fldDisease,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnDisPhase (
      $standardHeader,
      
      $fldIdx     $dbtIntNotNull,
      $fldNameKey $dbtTextNotNull,
      $fldDescKey $dbtTextNotNull,
      $fldDisease $dbtIntNotNull REFERENCES $tnDisDisease($fldId)
    );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldIdx, $fldNameKey, $fldDescKey, $fldDisease
    FROM   $tnDisPhase
    WHERE  $fldId = ?;
  ''';
  static String get stmtDelete => '''
    DELETE FROM $tnDisPhase
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnDisPhase (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldIdx, $fldNameKey, $fldDescKey, $fldDisease)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnDisPhase
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldIdx = ?,
        $fldNameKey = ?,
        $fldDescKey = ?,
        $fldDisease = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_idx) &&
        isNotNull(_nameKey) &&
        isNotNull(_descKey) &&
        isNotNull(_disease));
  }
}
