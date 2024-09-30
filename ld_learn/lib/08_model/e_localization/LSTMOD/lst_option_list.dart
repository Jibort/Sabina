// Representació d'una llista d'opcions.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/e_localization/LSTMOD/lst_list_category.dart';
import 'package:ld_learn/08_model/e_localization/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'una entrada en el DsmV.
class LstOptionList extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  String? _nameKey;
  String? _name;
  String? _descKey;
  String? _desc;
  LstListCategory? _category;
  bool _isAlpha = false;

  // CONSTRUCTORS ---------------------
  LstOptionList(
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
      LstListCategory? pCategory,
      bool pIsAlpha = false}) {
    _nameKey = pNameKey;
    _name = pName;
    _descKey = pDescKey;
    _desc = pDesc;
    _category = pCategory;
    _isAlpha = pIsAlpha;
  }

  LstOptionList.empty()
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
            pCategory: null,
            pIsAlpha: false);

  LstOptionList.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _nameKey = pMap[fldNameKey];
    _name = pMap[fldName];
    _descKey = pMap[fldDescKey];
    _desc = pMap[fldDesc];
    _category = pMap[fldListCategory];
    _isAlpha = pMap[fldIsAlpha];
  }

  LstOptionList.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(LstOptionList, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _isAlpha = pMap[fldIsAlpha];

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

            // Carreguem la categoria on pertany la llista.
            Future<Exception?> stCategory(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _category = await dbs.byKey(pCtrl, LstListCategory, pKey: pArgs.first);

                // Carrega createdBy i updatedBy.
                super.completeStandard(pCtrl, pMap);
              } on Exception catch (pExc) {
                exc = pExc;
              }
              return exc;
            }

            pCtrl.state.sneakFn(stCategory, pArgs: [pMap[fldListCategory]]);
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
    if (isNull(pDescKey) || isNull(pDesc)) {
      throw errorFieldNotNullable("$enLstListCategory.set", fldDesc);
    }
    var old = _descKey;
    _descKey = pDescKey;
    _desc = pDesc;
    super.isUpdated = (!super.isNew) && (old != _descKey);
  }

  LstListCategory? get category => _category;
  void setCategory(LstListCategory? pCategory) {
    if (isNull(pCategory)) {
      throw errorFieldNotNullable("$enLstOptionList.set", fldListCategory);
    }
    var old = _category;
    _category = pCategory;
    super.isUpdated = (!super.isNew) && (old != _category);
  }

  bool get isAlpha => _isAlpha;
  void setIsAlpha(bool pIsAlpha) {
    var old = _isAlpha;
    _isAlpha = pIsAlpha;
    super.isUpdated = (!super.isNew) && (old != _isAlpha);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldNameKey: _nameKey,
      fldName: _name,
      fldDescKey: _descKey,
      fldDesc: _desc,
      fldListCategory: _category,
      fldIsAlpha: _isAlpha,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldNameKey: _nameKey,
      fldDescKey: _descKey,
      fldListCategory: _category!.id,
      fldIsAlpha: (_isAlpha ? 1 : 0),
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldNameKey,
        fldDescKey,
        fldListCategory,
        fldIsAlpha,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnLstOptionList (
      $standardHeader,
      
      $fldNameKey      $dbtTextNotNull,
      $fldDescKey      $dbtText,
      $fldListCategory $dbtIntNotNull REFERENCES $tnLstListCategory($fldId),
      $fldIsAlpha      $dbtBooleanNotNull DEFAULT 0
      );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldNameKey,
           $fldDescKey,
           $fldListCategory,
           $fldIsAlpha
    FROM   $tnLstOptionList
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnLstOptionList
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnLstOptionList (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldNameKey, $fldDescKey, $fldListCategory, $fldIsAlpha)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnLstOptionList
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldNameKey = ?,
        $fldDescKey = ?,
        $fldListCategory = ?,
        $fldIsAlpha = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_nameKey));
  }
}
