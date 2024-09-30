// Representació d'una entrada en el DsmV.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/e_localization/LSTMOD/lst_option_list.dart';
import 'package:ld_learn/08_model/e_localization/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'una entrada en el DsmV.
class LstOptionEntry extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  LstOptionList? _list;
  int? _idx;
  String? _optionKey;
  String? _option;
  String? _descKey;
  String? _desc;

  // CONSTRUCTORS ---------------------
  LstOptionEntry(
      {required super.pLocalId,
      required super.pId,
      required super.pCreatedBy,
      required super.pCreatedAt,
      required super.pUpdatedBy,
      required super.pUpdatedAt,
      super.pIsNew,
      super.pIsUpdated,
      super.pIsDeleted,
      LstOptionList? pList,
      int? pIdx,
      String? pOptionKey,
      String? pOption,
      String? pDescKey,
      String? pDesc}) {
    _list = pList;
    _idx = pIdx;
    _optionKey = pOptionKey;
    _option = pOption;
    _descKey = pDescKey;
    _desc = pDesc;
  }

  LstOptionEntry.empty()
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
            pList: null,
            pIdx: null,
            pOptionKey: null,
            pOption: null,
            pDescKey: null,
            pDesc: null);

  LstOptionEntry.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _list = pMap[fldList];
    _idx = pMap[fldIdx];
    _optionKey = pMap[fldOptionKey];
    _option = pMap[fldOption];
    _descKey = pMap[fldDescKey];
    _desc = pMap[fldDesc];
    _descKey = pMap[fldDescKey];
  }

  LstOptionEntry.bySQLMap(
      BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(LstOptionEntry, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _idx = pMap[fldIdx];

    // Traduïm la descripció de l'opció, si existeix.
    Future<Exception?> stepDesc(
        FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _descKey = pArgs.first as String?;
        _desc = await dbs.trans(pCtrl, pTKey: _descKey);

        // Traduïm l'opció.
        Future<Exception?> stOption(
            FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _optionKey = pArgs.first as String?;
            _option = await dbs.trans(pCtrl, pTKey: _optionKey);

            // Carreguem l'opció.
            Future<Exception?> stList(
                FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _list =
                    await dbs.byKey(pCtrl, LstOptionList, pKey: pArgs.first);

                // Carrega createdBy i updatedBy.
                super.completeStandard(pCtrl, pMap);
              } on Exception catch (pExc) {
                exc = pExc;
              }
              return exc;
            }

            pCtrl.state.sneakFn(stList, pArgs: [pMap[fldList]]);
          } on Exception catch (pExc) {
            exc = pExc;
          }
          return exc;
        }

        pCtrl.state.sneakFn(stOption, pArgs: [pMap[fldOptionKey]]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stepDesc, pArgs: [pMap[fldDescKey]]);
  }

  // GETTERS i SETTERS ----------------
  LstOptionList? get list => _list;
  void setList(LstOptionList? pList) {
    if (isNull(pList)) {
      throw errorFieldNotNullable("$enLstOptionEntry.set", fldOptionEntry);
    }
    var old = _list;
    _list = pList;
    super.isUpdated = (!super.isNew) && (old != _list);
  }

  int? get idx => _idx;
  void setIdx(int? pIdx) {
    if (isNull(pIdx)) {
      throw errorFieldNotNullable("$enLstOptionEntry.set", fldIdx);
    }
    var old = _idx;
    _idx = pIdx;
    super.isUpdated = (!super.isNew) && (old != _idx);
  }

  String? get optionKey => _optionKey;
  String? get option => _option;
  void setOption(String? pOptionKey, String? pOption) {
    if (isNull(pOption)) {
      throw errorFieldNotNullable("$enLstOptionEntry.set", fldOption);
    }
    var old = _optionKey;
    _optionKey = pOptionKey;
    _option = pOption;
    super.isUpdated = (!super.isNew) && (old != _optionKey);
  }

  String? get descKey => _descKey;
  String? get desc => _desc;
  void setDesc(String? pDescKey, String? pDesc) {
    if (isNull(pDesc)) {
      throw errorFieldNotNullable("$enLstOptionEntry.set", fldDesc);
    }
    var old = _descKey;
    _descKey = pDescKey;
    _desc = pDesc;
    super.isUpdated = (!super.isNew) && (old != _descKey);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldList: _list,
      fldIdx: _idx,
      fldOptionKey: _optionKey,
      fldOption: _option,
      fldDescKey: _descKey,
      fldDesc: _desc
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldList: _list,
      fldIdx: _idx,
      fldOptionKey: _optionKey,
      fldDescKey: _descKey
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [fldList, fldIdx, fldOptionKey, fldDescKey, fldIsAlpha];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnLstOptionEntry (
      $standardHeader,
      
      $fldList      $dbtIntNotNull REFERENCES $tnLstOptionList, 
      $fldIdx       $dbtIntNotNull DEFAULT 0, 
      $fldOptionKey $dbtTextNotNull, 
      $fldDescKey   $dbtTextNotNull
    );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldList, $fldIdx, 
           $fldOptionKey, $fldDescKey
    FROM   $tnLstOptionEntry
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnLstOptionEntry
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnLstOptionEntry (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldList, $fldIdx,
      $fldOptionKey, $fldDescKey)
    VALUES (?, ?, ?, ?, ?,   ?, ?,   ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnLstOptionEntry
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldList = ?,
        $fldIdx = ?,
        $fldOptionKey = ?,
        $fldDescKey = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_list) &&
        isNotNull(_idx) &&
        isNotNull(_optionKey) &&
        isNotNull(_option));
  }
}
