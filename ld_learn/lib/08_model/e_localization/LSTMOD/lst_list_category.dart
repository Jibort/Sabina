// Representació d'una entrada en el DsmV.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'una entrada en el DsmV.
class LstListCategory extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  String? _nameKey;
  String? _name;
  String? _descKey;
  String? _desc;
  LstListCategory? _parent;

  // CONSTRUCTORS ---------------------
  LstListCategory(
      {required super.pLocalId,
    required super.pId,
    required super.pCreatedBy,
    required super.pCreatedAt,
    required super.pUpdatedBy,
    required super.pUpdatedAt,
    super.pIsNew,
    super.pIsUpdated,
    super.pIsDeleted,
      String? pNameKey,
      String? pName,
      String? pDescKey,
      String? pDesc,
      LstListCategory? pParent}) {
    _nameKey = pNameKey;
    _name = pName;
    _descKey = pDescKey;
    _desc = pDesc;
    _parent = pParent;
  }

  LstListCategory.empty()
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
            pParent: null);

  LstListCategory.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _nameKey = pMap[fldNameKey];
    _name = pMap[fldName];
    _descKey = pMap[fldDescKey];
    _desc = pMap[fldDesc];
    _parent = pMap[fldParent];
  }

  LstListCategory.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(LstListCategory, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    // Traduïm el nom de la categoria de llistes.
    Future<Exception?> stepName(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _nameKey = pArgs.first as String?;
        _name = await dbs.trans(pCtrl, pTKey: _nameKey);

        // Traduïm la descripció de la categoria, si existeix.
        Future<Exception?> stepDesc(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _descKey = pArgs.first as String?;
            _desc = await dbs.trans(pCtrl, pTKey: _descKey);

            // Carreguem la categoria pare, si existeix.
            Future<Exception?> stParent(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _parent = await dbs.byKey(pCtrl, LstListCategory, pKey: pArgs.first);

                // Carrega createdBy i updatedBy.
                super.completeStandard(pCtrl, pMap);
              } on Exception catch (pExc) {
                exc = pExc;
              }
              return exc;
            }

            pCtrl.state.sneakFn(stParent, pArgs: [pMap[fldParent]]);
          } on Exception catch (pExc) {
            exc = pExc;
          }
          return exc;
        }

        pCtrl.state.sneakFn(stepDesc, pArgs: [pMap[fldDescKey]]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stepName, pArgs: [pMap[fldNameKey]]);
  }

  // GETTERS i SETTERS ----------------
  String? get nameKey => _nameKey;
  String? get name => _name;
  void setName(String? pNameKey, String? pName) {
    if (isNull(pNameKey) || isNull(pName)) {
      throw errorFieldNotNullable("$enLstListCategory.set", fldName);
    }
    var old = _nameKey;
    _nameKey = pNameKey;
    _name = pName;
    super.isUpdated = (!super.isNew) && (old != _nameKey);
  }

  String? get descKey => _descKey;
  String? get desc => _desc;
  void setDesc(String? pDescKey, String? pDesc) {
    var old = _descKey;
    _descKey = pDescKey;
    _desc = pDesc;
    super.isUpdated = (!super.isNew) && (old != _descKey);
  }

  LstListCategory? get parent => _parent;
  void setParent(LstListCategory? pParent) {
    var old = _parent;
    _parent = pParent;
    super.isUpdated = (!super.isNew) && (old != _parent);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldNameKey: _nameKey,
      fldName: _name,
      fldDescKey: _descKey,
      fldDesc: _desc,
      fldParent: _parent,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldNameKey: _nameKey,
      fldDescKey: _descKey,
      fldParent: _parent?.id,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldNameKey,
        fldDescKey,
        fldParent,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnLstListCategory (
      $standardHeader,
      
      $fldNameKey $dbtTextNotNullUnique,
      $fldDescKey $dbtText,
      $fldParent  $dbtInt REFERENCES $tnLstListCategory($fldId),
    );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldNameKey,
           $fldDescKey,
           $fldParent
    FROM   $tnLstListCategory
    WHERE  $fldId = ?;
  ''';

  // OVERRIDES ------------------------
  static String get stmtDelete => '''
    DELETE FROM $tnLstListCategory
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnLstListCategory (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldNameKey, $fldDescKey, $fldParent)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnLstListCategory
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldNameKey = ?,
        $fldDescKey = ?,
        $fldParent = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_nameKey));
  }
}
