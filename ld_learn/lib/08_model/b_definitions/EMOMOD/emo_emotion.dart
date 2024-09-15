// Representació d'una emoció.
// createdAt: 24/08/10 ds. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'una emoció.
class EmoEmotion extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  String? _nameKey;
  String? _name;
  String? _descKey;
  String? _desc;
  EmoEmotion? _parent;
  int? _value;

  // CONSTRUCTORS ---------------------
  EmoEmotion(
      {required super.pCore,
      String? pNameKey,
      String? pName,
      String? pDescKey,
      String? pDesc,
      EmoEmotion? pParent,
      int? pValue}) {
    _nameKey = pNameKey;
    _name = pName;
    _descKey = pDescKey;
    _desc = pDesc;
    _parent = pParent;
    _value = pValue;
  }

  EmoEmotion.empty()
      : this(
            pCore: CoreEntity.empty(),
            pNameKey: null,
            pName: null,
            pDescKey: null,
            pDesc: null,
            pParent: null,
            pValue: null);

  EmoEmotion.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _nameKey = pMap[fldNameKey] as String?;
    _name = pMap[fldName] as String?;
    _descKey = pMap[fldDescKey] as String?;
    _desc = pMap[fldDesc] as String?;
    _parent = pMap[fldParent] as EmoEmotion?;
    _value = pMap[fldValue] as int?;
  }

  EmoEmotion.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(EmoEmotion, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _value = pMap[fldValue] as int?;

    // Traduïm el nom de l'emoció.
    Future<Exception?> stepName(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _nameKey = pArgs.first;
        _name = await dbs.trans(pCtrl, pTKey: _nameKey);

        // Traduïm la descripció de l'emoció.
        Future<Exception?> stepDesc(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _descKey = pArgs.first;
            _desc = await dbs.trans(pCtrl, pTKey: _descKey);

            // Carreguem l'l'emoció pare, si existeix.
            Future<Exception?> stepParent(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _parent = await dbs.byKey(pCtrl, EmoEmotion, pKey: pArgs.first);

                // Carrega createdBy i updatedBy.
                super.core.completeStandard(pCtrl, pMap);
              } on Exception catch (pExc) {
                exc = pExc;
              }
              return exc;
            }

            pCtrl.state.sneakFn(stepParent, pArgs: [pMap[fldParent]]);
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
    if (isNull(pName)) throw errorFieldNotNullable("$enEmoEmotion.set", fldName);
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

  EmoEmotion? get parent => _parent;
  set parent(EmoEmotion? pParent) {
    var old = _parent;
    _parent = pParent;
    core.isUpdated = (!core.isNew) && (old != _parent);
  }

  int? get value => _value;
  set value(int? pValue) {
    if (isNull(pValue)) {
      throw errorFieldNotNullable("$enEmoEmotion.set", fldValue);
    }
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
      fldParent: _parent,
      fldValue: _value,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldNameKey: _nameKey,
      fldDescKey: _descKey,
      fldParent: _parent?.serverId,
      fldValue: _value,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldNameKey,
        fldDescKey,
        fldParent,
        fldValue,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnEmoEmotion (
      $standardHeader,

      $fldNameKey $dbtTextNotNull,
      $fldDescKey $dbtText,
      $fldParent  $dbtInt REFERENCES $tnEmoEmotion($fldId),
      $fldValue   $dbtIntNotNull DEFAULT 0);
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldNameKey, $fldDescKey, $fldParent, $fldValue
    FROM   $tnEmoEmotion
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnEmoEmotion
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnEmoEmotion (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldNameKey, $fldDescKey, $fldParent, $fldValue)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnEmoEmotion
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
