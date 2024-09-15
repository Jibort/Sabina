// Representació d'un estat d'ànim.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'un estat d'ànim.
class EmoMood extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  String? _nameKey;
  String? _name;
  String? _descKey;
  String? _desc;
  int? _value;

  // CONSTRUCTORS ---------------------
  EmoMood(
      {required super.pCore,
      String? pNameKey,
      String? pName,
      String? pDescKey,
      String? pDesc,
      int? pValue}) {
    _nameKey = pNameKey;
    _name = pName;
    _descKey = pDescKey;
    _desc = pDesc;
    _value = pValue;
  }

  EmoMood.empty()
      : this(
            pCore: CoreEntity.empty(),
            pNameKey: null,
            pName: null,
            pDescKey: null,
            pDesc: null,
            pValue: null);

  EmoMood.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _nameKey = pMap[fldNameKey] as String?;
    _name = pMap[fldName] as String?;
    _descKey = pMap[fldDescKey] as String?;
    _desc = pMap[fldDesc] as String?;
    _value = pMap[fldValue] as int?;
  }

  EmoMood.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(EmoMood, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _value = pMap[fldValue] as int?;

    // Traduïm el nom de l'estat d'ànim.
    Future<Exception?> stepName(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _nameKey = pArgs.first as String?;
        _name = await dbs.trans(pCtrl, pTKey: _nameKey);

        // Traduïm la descripció de l'estat d'ànim.
        Future<Exception?> stepDesc(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _descKey = pArgs.first as String?;
            _desc = await dbs.trans(pCtrl, pTKey: _descKey);

            // Carrega createdBy i updatedBy.
            super.core.completeStandard(pCtrl, pMap);
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
  String? get name => _name;
  set name(String? pName) {
    if (isNull(pName)) throw errorFieldNotNullable("$enEmoMood.set", fldName);
    var old = _name;
    _name = pName;
    core.isUpdated = (!core.isNew) && (old != _name);
  }

  String? get description => _desc;
  set description(String? pDesc) {
    var old = _desc;
    _desc = pDesc;
    core.isUpdated = (!core.isNew) && (old != _desc);
  }

  int? get value => _value;
  set value(int? pValue) {
    var old = _value;
    _value = pValue;
    core.isUpdated = (!core.isNew) && (old != _value);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldNameKey: _nameKey,
      fldName: _name,
      fldDescKey: _descKey,
      fldDesc: _desc,
      fldValue: _value,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldNameKey: _nameKey,
      fldDescKey: _descKey,
      fldValue: _value,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldNameKey,
        fldDescKey,
        fldValue,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnEmoMood (
      $standardHeader,

      $fldNameKey $dbtTextNotNull,
      $fldDescKey $dbtTextNotNull,
      $fldValue   $dbtIntNotNull DEFAULT 0);
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldNameKey, $fldDescKey, $fldValue
    FROM   $tnEmoMood
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnEmoMood
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnEmoMood (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldNameKey, $fldDescKey, $fldParent, $fldValue)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnEmoMood
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldNameKey = ?,   $fldDescKey = ?,
        $fldParent = ?,    $fldValue = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (isNotNull(super.core.createdBy) &&
        isNotNull(super.core.createdAt) &&
        isNotNull(_nameKey) &&
        isNotNull(_value));
  }
}
