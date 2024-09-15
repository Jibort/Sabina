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
class TstTest extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  TstTestCategory? _category;
  String? _nameKey;
  String? _name;
  String? _descKey;
  String? _desc;
  String? _instrKey;
  String? _instr;
  int _vers = 0;
  UsrUser? _therapist;
  TstTest? _root;

  // CONSTRUCTORS ---------------------
  TstTest(
      {required super.pCore,
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
    _descKey = pDescKey;
    _desc = pDesc;
    _instrKey = pInstrKey;
    _instr = pInstr;
    _vers = pVers;
    _root = pRoot;
    _therapist = pTherapist;
  }

  TstTest.empty()
      : this(
            pCore: CoreEntity.empty(),
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
    _descKey = pMap[fldDescKey];
    _desc = pMap[fldDesc];
    _instrKey = pMap[fldInstrKey];
    _instr = pMap[fldInstr];
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
            _descKey = pArgs.first;
            _desc = await dbs.trans(pCtrl, pTKey: _descKey);

            // Traduïm el instr key.
            Future<Exception?> stInstr(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _descKey = pArgs.first;
                _desc = await dbs.trans(pCtrl, pTKey: _descKey);

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
    core.isUpdated = (!core.isNew) && (oldKey != _nameKey);
  }

  String? get descKey => _descKey;
  String? get desc => _desc;
  void setDesc(String? pKey, String? pDesc) {
    var oldKey = _descKey;
    _descKey = pKey;
    _desc = pDesc;
    core.isUpdated = (!core.isNew) && (oldKey != _descKey);
  }

  String? get instrKey => _instrKey;
  String? get instr => _instr;
  void setInstr(String? pKey, String? pInstr) {
    var oldKey = _descKey;
    _instrKey = pKey;
    _instr = pInstr;
    core.isUpdated = (!core.isNew) && (oldKey != _instrKey);
  }

  TstTestCategory? get category => _category;
  void setCategory(TstTestCategory? pCategory) {
    if (isNull(pCategory)) {
      throw errorFieldNotNullable("$enTstTest.set", fldTestCategory);
    }
    var old = _category;
    _category = pCategory;
    core.isUpdated = (!core.isNew) && (old != _category);
  }

  int get vers => _vers;
  void setVers(int pVers) {
    var old = _vers;
    _vers = pVers;
    core.isUpdated = (!core.isNew) && (old != _vers);
  }

  TstTest? get root => _root;
  void setRoot(TstTest? pRoot) {
    var old = _root;
    _root = pRoot;
    core.isUpdated = (!core.isNew) && (old != _root);
  }

  UsrUser? get therapist => _therapist;
  void setTherapist(UsrUser? pTherapist) {
    if (isNull(pTherapist)) {
      throw errorFieldNotNullable("$enTstTest.set", fldTherapist);
    }
    var old = _therapist;
    _therapist = pTherapist;
    core.isUpdated = (!core.isNew) && (old != _therapist);
  }

  // _therapist = pTherapist;
  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldTestCategory: _category,
      fldNameKey: _nameKey,
      fldName: _name,
      fldDescKey: _descKey,
      fldDesc: _desc,
      fldInstrKey: _instrKey,
      fldInstr: _instr,
      fldVersion: _vers,
      fldRoot: _root,
      fldTherapist: _therapist,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldTestCategory: _category,
      fldNameKey: _nameKey,
      fldDescKey: _descKey,
      fldInstrKey: _instrKey,
      fldVersion: _vers,
      fldRoot: _root?.serverId,
      fldTherapist: _therapist!.serverId,
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
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?, ?,  ?, ?, ?);
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
    return (isNotNull(super.core.createdBy) &&
        isNotNull(super.core.createdAt) &&
        isNotNull(_category) &&
        isNotNull(_nameKey) &&
        isNotNull(_therapist));
  }
}
