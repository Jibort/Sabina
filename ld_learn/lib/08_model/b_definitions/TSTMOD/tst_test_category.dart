// Representació d'una entrada en el DsmV.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'una entrada en el DsmV.
class TstTestCategory extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  String? _titleKey;
  String? _title;
  String? _descKey;
  String? _desc;
  TstTestCategory? _parent;

  // CONSTRUCTORS ---------------------
  TstTestCategory(
      {required super.pCore,
      String? pTitleKey,
      String? pTitle,
      String? pDescKey,
      String? pDesc,
      TstTestCategory? pParent}) {
    _titleKey = pTitleKey;
    _title = pTitle;
    _descKey = pDescKey;
    _desc = pDesc;
    _parent = pParent;
  }

  TstTestCategory.empty()
      : this(
            pCore: CoreEntity.empty(),
            pTitleKey: null,
            pTitle: null,
            pDescKey: null,
            pParent: null);

  TstTestCategory.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _titleKey = pMap[fldTitleKey];
    _title = pMap[fldTitle];
    _descKey = pMap[fldDescKey];
    _desc = pMap[fldDesc];
    _parent = pMap[fldParent];
  }

  TstTestCategory.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(TstTestCategory, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    // Traduïm el title key.
    Future<Exception?> stName(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _titleKey = pArgs.first;
        _title = await dbs.trans(pCtrl, pTKey: _titleKey);

        // Traduïm el desc key.
        Future<Exception?> stDesc(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _descKey = pArgs.first;
            _desc = await dbs.trans(pCtrl, pTKey: _descKey);

            // Obtenim la categoria pare.
            Future<Exception?> stParent(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _parent = await dbs.byKey(pCtrl, TstTestCategory, pKey: pArgs.first);

                // Carrega createdBy i updatedBy.
                super.core.completeStandard(pCtrl, pMap);
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

        pCtrl.state.sneakFn(stDesc, pArgs: [pMap[fldDescKey]]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stName, pArgs: [pMap[fldNameKey]]);
  }

  // GETTERS i SETTERS ----------------
  String? get titleKey => _titleKey;
  String? get title => _title;
  void setTitle(String? pKey, String? pTitle) {
    if (isNull(pKey) || isNull(pTitle)) {
      throw errorFieldNotNullable("$enTstTestCategory.set", fldTitle);
    }
    var oldKey = _titleKey;
    _titleKey = pKey;
    _title = pTitle;
    core.isUpdated = (!core.isNew) && (oldKey != _titleKey);
  }

  String? get descKey => _descKey;
  String? get desc => _desc;
  void setDesc(String? pKey, String? pDesc) {
    var oldKey = _descKey;
    _descKey = pKey;
    _desc = pDesc;
    core.isUpdated = (!core.isNew) && (oldKey != _descKey);
  }

  TstTestCategory? get parent => _parent;
  void setParent(TstTestCategory? pParent) {
    var oldParent = _parent;
    _parent = pParent;
    core.isUpdated = (!core.isNew) && (oldParent != _parent);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldTitleKey: _titleKey,
      fldTitle: _title,
      fldDescKey: _descKey,
      fldDesc: _desc,
      fldParent: _parent,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldTitleKey: _titleKey,
      fldDescKey: _descKey,
      fldParent: _parent?.serverId,
    });

  // STATICS --------------------------
  static final List<String> tableFields =
      EntityKeyType.standard.mainFields + [fldTitleKey, fldDescKey, fldParent];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnTstTestCategory (
      $standardHeader,
      
      $fldTitleKey $dbtTextNotNullUnique,
      $fldDescKey  $dbtText,
      $fldParent   $dbtInt REFERENCES $tnTstTestCategory($fldId)
      );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldTitleKey, $fldDescKey, $fldParent
    FROM   $tnTstTestCategory
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnTstTestCategory
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnTstTestCategory (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldTitleKey, $fldDescKey, $fldParent)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnTstTestCategory
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldTitleKey = ?,
        $fldDescKey = ?,
        $fldParent = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (isNotNull(super.core.createdBy) &&
        isNotNull(super.core.createdAt) &&
        isNotNull(_titleKey));
  }
}
