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
  String? __descKey;
  String? __desc;
  EmoEmotion? __parent;
  int? _value;

  // CONSTRUCTORS ---------------------
  EmoEmotion(
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
      EmoEmotion? pParent,
      int? pValue}) {
    _nameKey = pNameKey;
    _name = pName;
    __descKey = pDescKey;
    __desc = pDesc;
    __parent = pParent;
    _value = pValue;
  }

  EmoEmotion.empty()
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
            pParent: null,
            pValue: null);

  EmoEmotion.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _nameKey = pMap[fldNameKey] as String?;
    _name = pMap[fldName] as String?;
    __descKey = pMap[fldDescKey] as String?;
    __desc = pMap[fldDesc] as String?;
    __parent = pMap[fldParent] as EmoEmotion?;
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
            __descKey = pArgs.first;
            __desc = await dbs.trans(pCtrl, pTKey: __descKey);

            // Carreguem l'l'emoció pare, si existeix.
            Future<Exception?> stepParent(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                __parent = await dbs.byKey(pCtrl, EmoEmotion, pKey: pArgs.first);

                // Carrega createdBy i updatedBy.
                super.completeStandard(pCtrl, pMap);
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
    super.isUpdated = (!super.isNew) && (old != _name);
  }

  String? get description => __desc;
  set description(String? pDesc) {
    var old = __desc;
    __desc = pDesc;
    super.isUpdated = (!super.isNew) && (old != __desc);
  }

  EmoEmotion? get parent => __parent;
  set parent(EmoEmotion? pParent) {
    var old = __parent;
    __parent = pParent;
    super.isUpdated = (!super.isNew) && (old != __parent);
  }

  int? get value => _value;
  set value(int? pValue) {
    if (isNull(pValue)) {
      throw errorFieldNotNullable("$enEmoEmotion.set", fldValue);
    }
    var old = _value;
    _value = pValue;
    super.isUpdated = (!super.isNew) && (old != _value);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldNameKey: _nameKey,
      fldName: _name,
      fldDescKey: __descKey,
      fldDesc: __desc,
      fldParent: __parent,
      fldValue: _value,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldNameKey: _nameKey,
      fldDescKey: __descKey,
      fldParent: __parent?.id,
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
    return (super.isCompleted() &&
        isNotNull(_nameKey) &&
        isNotNull(_value));
  }
}
