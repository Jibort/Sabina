// Representació d'una entrada en el DsmV.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/08_model/c_working/index.dart';
import 'package:ld_learn/08_model/e_localization/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'una entrada en el DsmV.
class RegRegisterColumn extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  RegRegister? _register;
  TckTrackingColumn? _column;
  LstOptionEntry? _option;
  EmoEmotion? _emotion;
  EmoMood? _mood;
  String? _value;

  // CONSTRUCTORS ---------------------
  RegRegisterColumn(
      {required super.pCore,
      RegRegister? pRegister,
      TckTrackingColumn? pColumn,
      LstOptionEntry? pOption,
      EmoEmotion? pEmotion,
      EmoMood? pMood,
      String? pValue}) {
    _register = pRegister;
    _column = pColumn;
    _option = pOption;
    _emotion = pEmotion;
    _mood = pMood;
    _value = pValue;
  }

  RegRegisterColumn.empty()
      : this(
            pCore: CoreEntity.empty(),
            pRegister: null,
            pColumn: null,
            pOption: null,
            pEmotion: null,
            pMood: null,
            pValue: null);

  RegRegisterColumn.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _register = pMap[fldRegister];
    _column = pMap[fldTrackingColumn];
    _option = pMap[fldOptionEntry];
    _emotion = pMap[fldEmotion];
    _mood = pMap[fldMood];
    _value = pMap[fldValue];
  }

  RegRegisterColumn.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(RegRegisterColumn, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _value = pMap[fldValue];

    // Carreguem el registre.
    Future<Exception?> stRegister(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _register = await dbs.byKey(pCtrl, RegRegister, pKey: pArgs.first);

        // Carreguem la columna de tracking.
        Future<Exception?> stColumn(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _column = await dbs.byKey(pCtrl, TckTrackingColumn, pKey: pArgs.first);

            // Carreguem l'entrada de la llista d'opcions, si existeix.
            Future<Exception?> stOption(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _option = await dbs.byKey(pCtrl, LstOptionEntry, pKey: pArgs.first);

                // Carreguem l'emoció, si existeix.
                Future<Exception?> stEmotion(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                  try {
                    _emotion = await dbs.byKey(pCtrl, EmoEmotion, pKey: pArgs.first);

                    // Carreguem l'estat d'ànim, si existeix.
                    Future<Exception?> stMood(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                      try {
                        _mood = await dbs.byKey(pCtrl, EmoMood, pKey: pArgs.first);

                        // Carrega createdBy i updatedBy.
                        super.core.completeStandard(pCtrl, pMap);
                      } on Exception catch (pExc) {
                        exc = pExc;
                      }
                      return exc;
                    }

                    pCtrl.state.sneakFn(stMood, pArgs: [pMap[fldMood]]);
                  } on Exception catch (pExc) {
                    exc = pExc;
                  }
                  return exc;
                }

                pCtrl.state.sneakFn(stEmotion, pArgs: [pMap[fldEmotion]]);
              } on Exception catch (pExc) {
                exc = pExc;
              }
              return exc;
            }

            pCtrl.state.sneakFn(stOption, pArgs: [pMap[fldOptionEntry]]);
          } on Exception catch (pExc) {
            exc = pExc;
          }
          return exc;
        }

        pCtrl.state.sneakFn(stColumn, pArgs: [pMap[fldTrackingColumn]]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stRegister, pArgs: [pMap[fldRegister]]);
  }

  // GETTERS i SETTERS ----------------
  RegRegister? get register => _register;
  void setRegister(RegRegister? pRegister) {
    if (isNull(pRegister)) {
      throw errorFieldNotNullable("$enRegRegisterColumn.set", fldRegister);
    }
    var old = _register;
    _register = pRegister;
    core.isUpdated = (!core.isNew) && (old != _register);
  }

  TckTrackingColumn? get trackingColumn => _column;
  void setTrackingColumn(TckTrackingColumn? pColumn) {
    if (isNull(pColumn)) {
      throw errorFieldNotNullable("$enRegRegisterColumn.set", fldTrackingColumn);
    }
    var old = _column;
    _column = pColumn;
    core.isUpdated = (!core.isNew) && (old != _column);
  }

  LstOptionEntry? get optionEntry => _option;
  void setOptionEntry(LstOptionEntry? pOption) {
    var old = _option;
    _option = pOption;
    core.isUpdated = (!core.isNew) && (old != _option);
  }

  EmoEmotion? get emotion => _emotion;
  void setEmotion(EmoEmotion? pEmotion) {
    var old = _emotion;
    _emotion = pEmotion;
    core.isUpdated = (!core.isNew) && (old != _emotion);
  }

  EmoMood? get mood => _mood;
  void setMood(EmoMood? pMood) {
    var old = _mood;
    _mood = pMood;
    core.isUpdated = (!core.isNew) && (old != _mood);
  }

  String? get value => _value;
  void setValue(String? pValue) {
    var old = _value;
    _value = pValue;
    core.isUpdated = (!core.isNew) && (old != _value);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldRegister: _register,
      fldTrackingColumn: _column,
      fldOptionEntry: _option,
      fldEmotion: _emotion,
      fldMood: _mood,
      fldValue: _value,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldRegister: _register!.serverId,
      fldTrackingColumn: _column!.serverId,
      fldOptionEntry: _option?.serverId,
      fldEmotion: _emotion?.serverId,
      fldMood: _mood?.serverId,
      fldValue: _value,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldRegister,
        fldTrackingColumn,
        fldOptionEntry,
        fldEmotion,
        fldMood,
        fldValue,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnRegRegisterColumn (
      $standardHeader,
      
      $fldRegister       $dbtIntNotNull REFERENCES $tnRegRegister($fldId),
      $fldTrackingColumn $dbtIntNotNull REFERENCES $tnTckTrackingColumn($fldId),
      $fldOptionEntry    $dbtInt REFERENCES $tnLstOptionEntry($fldId),
      $fldEmotion        $dbtInt REFERENCES $tnEmoEmotion($fldId),
      $fldMood           $dbtInt REFERENCES $tnEmoMood($fldId),
      $fldValue          $dbtInt
      );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldRegister, $fldTrackingColumn, $fldOptionEntry,
           $fldEmotion, $fldMood, $fldValue
    FROM   $tnRegRegisterColumn
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnRegRegisterColumn
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnRegRegisterColumn (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldRegister, $fldTrackingColumn, $fldOptionEntry,
      $fldEmotion, $fldMood, $fldValue)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?,   ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnRegRegisterColumn
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldRegister = ?,
        $fldTrackingColumn = ?,
        $fldOptionEntry = ?,
        $fldEmotion = ?,
        $fldMood = ?,
        $fldValue = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (isNotNull(super.core.createdBy) &&
        isNotNull(super.core.createdAt) &&
        isNotNull(_register));
  }
}
