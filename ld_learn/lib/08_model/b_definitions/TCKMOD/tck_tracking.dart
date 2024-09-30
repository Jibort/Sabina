// Representació d'una entrada en el DsmV.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/a_user/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'una entrada en el DsmV.
class TckTracking extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  String? _nameKey;
  String? _name;
  String? _descKey;
  String? _desc;
  int _vers = 0;
  UsrUser? _therapist;
  TckTracking? _root;

  // CONSTRUCTORS ---------------------
  TckTracking({
    required super.pLocalId,
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
    int pVersion = 0,
    UsrUser? pTherapist,
    TckTracking? pRoot,
  }) {
    _nameKey = pNameKey;
    _name = pName;
    _descKey = pDescKey;
    _desc = pDesc;
    _vers = pVersion;
    _therapist = pTherapist;
    _root = pRoot;
  }

  TckTracking.empty()
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
            pVersion: 0,
            pTherapist: null,
            pRoot: null);

  TckTracking.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _nameKey = pMap[fldNameKey];
    _name = pMap[fldName];
    _descKey = pMap[fldDescKey];
    _desc = pMap[fldDesc];
    _vers = pMap[fldVersion] ?? 0;
    _therapist = pMap[fldTherapist];
    _root = pMap[fldRoot];
  }

  TckTracking.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(TckTracking, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _vers = pMap[fldVersion];

    // Traduïm el name key.
    Future<Exception?> stName(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _nameKey = pArgs.first;
        _name = await dbs.trans(pCtrl, pTKey: _nameKey);

        // Traduïm el desc key.
        Future<Exception?> stDesc(
            FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _descKey = pArgs.first;
            _desc = await dbs.trans(pCtrl, pTKey: _descKey);

            // Carreguem el terapeuta.
            Future<Exception?> stTherapist(
                FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _therapist = await dbs.byKey(pCtrl, UsrUser, pKey: pArgs.first);

                // Carreguem l'arrel.
                Future<Exception?> stRoot(
                    FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                  try {
                    _root =
                        await dbs.byKey(pCtrl, TckTracking, pKey: pArgs.first);

                    // Carrega createdBy i updatedBy.
                    super.completeStandard(pCtrl, pMap);
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

            pCtrl.state.sneakFn(stTherapist, pArgs: [pMap[fldTherapist]]);
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
      throw errorFieldNotNullable("$enTckTracking.set", fldName);
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

  int get vers => _vers;
  void setVers(int pVers) {
    var old = _vers;
    _vers = pVers;
    super.isUpdated = (!super.isNew) && (old != _vers);
  }

  UsrUser? get theraphist => _therapist;
  void setPhase(UsrUser? pTherapist) {
    if (isNull(pTherapist)) {
      throw errorFieldNotNullable("TckTracking.set", fldTherapist);
    }
    var oldTherapist = _therapist;
    _therapist = pTherapist;
    super.isUpdated = (!super.isNew) && (oldTherapist != _therapist);
  }

  TckTracking? get root => _root;
  void setRoot(TckTracking? pTracking) {
    var oldRoot = _root;
    _root = pTracking;
    super.isUpdated = (!super.isNew) && (oldRoot != _root);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldNameKey: _nameKey,
      fldName: _name,
      fldDescKey: _descKey,
      fldDesc: _desc,
      fldVersion: _vers,
      fldTherapist: _therapist,
      fldRoot: _root,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldNameKey: _nameKey,
      fldDescKey: _descKey,
      fldVersion: _vers,
      fldTherapist: _therapist!.id,
      fldRoot: _root!.id,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldNameKey,
        fldDescKey,
        fldVersion,
        fldTherapist,
        fldRoot,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnTckTracking (
      $standardHeader,
      
      $fldNameKey   $dbtTextNotNull,
      $fldDescKey   $dbtTextNotNull,
      $fldVersion   $dbtIntNotNull DEFAULT 0,
      $fldTherapist $dbtIntNotNull REFERENCES $tnUsrUser($fldId),
      $fldRoot      $dbtIntNotNull REFERENCES $tnTckTracking($fldId),
    );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldNameKey,
           $fldDescKey,
           $fldVersion,
           $fldTherapist,
           $fldRoot
    FROM   $tnTckTracking
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnTckTracking
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnTckTracking (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldNameKey, $fldDescKey, $fldVersion, $fldTherapist, $fldRoot)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnTckTracking
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldNameKey = ?,
        $fldDescKey = ?,
        $fldVersion = ?,
        $fldTherapist = ?,
        $fldRoot = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_nameKey) &&
        isNotNull(_therapist));
  }
}
