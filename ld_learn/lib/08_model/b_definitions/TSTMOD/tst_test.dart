// Fitxer de definició d'un test d'avaluació.
// createdAt: 24/09/26 dj. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/a_user/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Definició d'un test d'avaluació.
class TstTest extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  TstTestCategory? _category;
  String? _nameKey;
  String? _name;
  String? __descKey;
  String? __desc;
  String? __instrKey;
  String? __instr;
  int _vers = 0;
  TstTest? _root;
  UsrUser? _therapist;
  

  // CONSTRUCTORS ---------------------
  TstTest(
      {required super.pLocalId,
      required super.pId,
      required super.pCreatedBy,
      required super.pCreatedAt,
      required super.pUpdatedBy,
      required super.pUpdatedAt,
      super.pIsNew,
      super.pIsUpdated,
      super.pIsDeleted,
      TstTestCategory? pCategory,
      String? pNameKey,
      String? pName,
      String? pDescKey,
      String? pDesc,
      String? pInstrKey,
      String? pInstr,
      int pVers = 0,
      TstTest? pRoot,
      UsrUser? pTherapist}) {
    _category = pCategory;
    _nameKey = pNameKey;
    _name = pName;
    __descKey = pDescKey;
    __desc = pDesc;
    __instrKey = pInstrKey;
    __instr = pInstr;
    _vers = pVers;
    _root = pRoot;
    _therapist = pTherapist;
  }

  TstTest.empty()
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
            pCategory: null,
            pNameKey: null,
            pName: null,
            pDescKey: null,
            pDesc: null,
            pInstrKey: null,
            pInstr: null,
            pVers: 0,
            pRoot: null,
            pTherapist: null);

  TstTest.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _category = pMap[fldTestCategory];
    _nameKey = pMap[fldNameKey];
    _name = pMap[fldName];
    __descKey = pMap[fldDescKey];
    __desc = pMap[fldDesc];
    __instrKey = pMap[fldInstrKey];
    __instr = pMap[fldInstr];
    _vers = pMap[fldVersion];
    _root = pMap[fldRoot];
    _therapist = pMap[fldTherapist];
  }

  TstTest.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(TstTest, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _vers = pMap[fldVersion];

    // Traduïm el name key.
    Future<Exception?> stName(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _nameKey = pArgs.first;
        _name = await dbs.trans(pCtrl, pTKey: _nameKey);

        // Traduïm el desc key.
        Future<Exception?> stDesc(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            __descKey = pArgs.first;
            __desc = await dbs.trans(pCtrl, pTKey: __descKey);

            // Traduïm el instr key.
            Future<Exception?> stInstr(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                __descKey = pArgs.first;
                __desc = await dbs.trans(pCtrl, pTKey: __descKey);

                // Obtenim el dsmV.
                Future<Exception?> stRoot(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                  try {
                    _root = await dbs.byKey(pCtrl, TstTest, pKey: pArgs.first);

                    // Obtenim el terapeuta.
                    Future<Exception?> stTherapist(
                        FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                      try {
                        _therapist = await dbs.byKey(pCtrl, UsrUser, pKey: pArgs.first);

                        // Carrega createdBy i updatedBy.
                        super.completeStandard(pCtrl, pMap);
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

                pCtrl.state.sneakFn(stRoot, pArgs: [pMap[fldRoot]]);
              } on Exception catch (pExc) {
                exc = pExc;
              }
              return exc;
            }

            pCtrl.state.sneakFn(stInstr, pArgs: [pMap[fldInstrKey]]);
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
  String? get nameKey => _nameKey;
  String? get name => _name;
  void setName(String? pKey, String? pName) {
    if (isNull(pName)) {
      throw errorFieldNotNullable("$enTstTest.set", fldName);
    }
    var oldKey = _nameKey;
    _nameKey = pKey;
    _name = pName;
    super.isUpdated = (!super.isNew) && (oldKey != _nameKey);
  }

  String? get descKey => __descKey;
  String? get desc => __desc;
  void setDesc(String? pKey, String? pDesc) {
    var oldKey = __descKey;
    __descKey = pKey;
    __desc = pDesc;
    super.isUpdated = (!super.isNew) && (oldKey != __descKey);
  }

  String? get instrKey => __instrKey;
  String? get instr => __instr;
  void setInstr(String? pKey, String? pInstr) {
    var oldKey = __descKey;
    __instrKey = pKey;
    __instr = pInstr;
    super.isUpdated = (!super.isNew) && (oldKey != __instrKey);
  }

  TstTestCategory? get category => _category;
  void setCategory(TstTestCategory? pCategory) {
    if (isNull(pCategory)) {
      throw errorFieldNotNullable("$enTstTest.set", fldTestCategory);
    }
    var old = _category;
    _category = pCategory;
    super.isUpdated = (!super.isNew) && (old != _category);
  }

  int get vers => _vers;
  void setVers(int pVers) {
    var old = _vers;
    _vers = pVers;
    super.isUpdated = (!super.isNew) && (old != _vers);
  }

  TstTest? get root => _root;
  void setRoot(TstTest? pRoot) {
    var old = _root;
    _root = pRoot;
    super.isUpdated = (!super.isNew) && (old != _root);
  }

  UsrUser? get therapist => _therapist;
  void setTherapist(UsrUser? pTherapist) {
    if (isNull(pTherapist)) {
      throw errorFieldNotNullable("$enTstTest.set", fldTherapist);
    }
    var old = _therapist;
    _therapist = pTherapist;
    super.isUpdated = (!super.isNew) && (old != _therapist);
  }

  // _therapist = pTherapist;
  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldTestCategory: _category,
      fldNameKey: _nameKey,
      fldName: _name,
      fldDescKey: __descKey,
      fldDesc: __desc,
      fldInstrKey: __instrKey,
      fldInstr: __instr,
      fldVersion: _vers,
      fldRoot: _root,
      fldTherapist: _therapist,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldTestCategory: _category,
      fldNameKey: _nameKey,
      fldDescKey: __descKey,
      fldInstrKey: __instrKey,
      fldVersion: _vers,
      fldRoot: _root?.id,
      fldTherapist: _therapist!.id,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldTestCategory,
        fldNameKey,
        fldDescKey,
        fldInstrKey,
        fldVersion,
        fldRoot,
        fldTherapist,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnTstTest (
      $standardHeader,
      
      $fldTestCategory $dbtIntNotNull REFERENCES $tnTstTestCategory($fldId),
      $fldNameKey      $dbtTextNotNull,
      $fldDescKey      $dbtText,
      $fldInstrKey     $dbtText,
      $fldVersion      $dbtIntNotNull,
      $fldRoot         $dbtInt REFERENCES $tnTstTest($fldId),
      $fldTherapist    $dbtIntNotNull REFERENCES $tnUsrUser($fldId),
      );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

          $fldTestCategory,
          $fldNameKey,
          $fldDescKey,
          $fldInstrKey,
          $fldVersion,
          $fldRoot,
          $fldTherapist,
    FROM   $tnTstTest
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnTstTest
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnTstTest (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldTestCategory, $fldNameKey, $fldDescKey, $fldInstrKey,
      $fldVersion, $fldRoot, $fldTherapist)
    VALUES (?,?,?,?,?,  ?,?,?,?,  ?,?,?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnTstTest
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,
        
        $fldTestCategory = ?,
        $fldNameKey = ?,
        $fldDescKey = ?,
        $fldInstrKey = ?,
        $fldVersion = ?,
        $fldRoot = ?,
        $fldTherapist = ?)
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_category) &&
        isNotNull(_nameKey) &&
        isNotNull(_therapist));
  }
}
