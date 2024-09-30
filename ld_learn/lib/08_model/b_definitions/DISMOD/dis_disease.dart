// Representació d'una patologia.
// createdAt: 24/08/20 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/a_user/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'una patologia.
class DisDisease extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  String? _nameKey;
  String? _name;
  String? _descKey;
  String? _desc;
  DisDsmV? _dsmV;
  UsrUser? _therapist;

  // CONSTRUCTORS ---------------------
  DisDisease({required super.pLocalId,
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
    DisDsmV? pDsmV,
    UsrUser? pTherapist,
  }) {
    _nameKey = pNameKey;
    _name = pName;
    _descKey = pDescKey;
    _desc = pDesc;
    _dsmV = pDsmV;
    _therapist = pTherapist;
  }

  DisDisease.empty()
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
          pDsmV: null,
          pTherapist: null,
        );

  DisDisease.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _nameKey = pMap[fldNameKey];
    _name = pMap[fldName];
    _descKey = pMap[fldDescKey];
    _desc = pMap[fldDesc];
    _dsmV = pMap[fldDsmV];
    _therapist = pMap[fldTherapist];
  }

  DisDisease.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(DisDisease, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

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

            // Obtenim el dsmV.
            Future<Exception?> stDsmV(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _dsmV = await dbs.byKey(pCtrl, DisDsmV, pKey: pArgs.first);

                // Obtenim el terapeuta.
                Future<Exception?> stTherapist(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                  int? fkId;
                  try {
                    fkId = pArgs.first as int?;
                    _therapist = await dbs.byKey(pCtrl, UsrUser, pKey: fkId!);

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

            pCtrl.state.sneakFn(stDsmV, pArgs: [pMap[fldDsmV]]);
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
    if (isNull(pKey)) {
      throw errorFieldNotNullable("$enDisDisease.set", fldName);
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

  DisDsmV? get dsmV => _dsmV;
  void setDsmV(DisDsmV? pDsmV) {
    if (isNull(pDsmV)) {
      throw errorFieldNotNullable("$enDisDisease.set", fldDsmV);
    }
    var oldDsmV = _dsmV;
    _dsmV = pDsmV;
    super.isUpdated = (!super.isNew) && (oldDsmV != _dsmV);
  }

  UsrUser? get therapist => _therapist;
  void setTherapist(UsrUser? pTherapist) {
    if (isNull(pTherapist)) {
      throw errorFieldNotNullable("$enDisDisease.set", fldTherapist);
    }
    var oldTherapist = _therapist;
    _therapist = pTherapist;
    super.isUpdated = (!super.isNew) && (oldTherapist != _therapist);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldNameKey: _nameKey,
      fldName: _name,
      fldDescKey: _descKey,
      fldDesc: _desc,
      fldDsmV: _dsmV,
      fldTherapist: _therapist,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldNameKey: _nameKey,
      fldDescKey: _descKey,
      fldDsmV: _dsmV!.id,
      fldTherapist: _therapist!.id,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldNameKey,
        fldDescKey,
        fldDsmV,
        fldTherapist,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnDisDisease (
      $standardHeader,
      
      $fldNameKey   $dbtTextNotNullUnique,
      $fldDescKey   $dbtTextNotNull,
      $fldDsmV      $dbtIntNotNull REFERENCES $tnDisDsmV($fldId),
      $fldTherapist $dbtIntNotNull REFERENCES $tnUsrUser($fldId)
    );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, 
           $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

           $fldNameKey , $fldDescKey, $fldDsmV, $fldTherapist
    FROM   $tnDisDisease
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnDisDisease
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnDisDisease (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldNameKey , $fldDescKey, $fldDsmV, $fldTherapist)
    VALUES (?, ?, ?, ?, ?,  ?, ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnDisDisease
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldNameKey  = ?,
        $fldDescKey = ?,
        $fldDsmV = ?, 
        $fldTherapist = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_nameKey) &&
        isNotNull(_descKey) &&
        isNotNull(_dsmV) &&
        isNotNull(_therapist));
  }
}
