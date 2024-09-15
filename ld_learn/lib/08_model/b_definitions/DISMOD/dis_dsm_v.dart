// Representació d'una entrada en el DsmV.
// createdAt: 24/08/20 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'una entrada en el DsmV.
class DisDsmV extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  late String? _name;
  late String? _icd10;

  // CONSTRUCTORS ---------------------
  DisDsmV({required super.pCore, String? pName, String? pIcd10}) {
    _name = pName;
    _icd10 = pIcd10;
  }

  DisDsmV.empty() : this(pCore: CoreEntity.empty(), pName: null, pIcd10: null);

  DisDsmV.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _name = pMap[fldName];
    _icd10 = pMap[fldIcd10];
  }

  DisDsmV.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(DisDsmV, pMap) {
    _name = pMap[fldName];
    _icd10 = pMap[fldIcd10];
  }

  // GETTERS i SETTERS ----------------
  String? get name => _name;
  set name(String? pName) {
    if (isNull(pName)) throw errorFieldNotNullable("$enDisDsmV.set", fldName);
    var old = _name;
    _name = pName;
    core.isUpdated = (!core.isNew) && (old != _name);
  }

  String? get icd10 => _icd10;
  void setIcd10(String? pIcd10) {
    if (isNull(pIcd10)) throw errorFieldNotNullable("$enDisDsmV.set", fldIcd10);
    var old = _icd10;
    _icd10 = pIcd10;
    core.isUpdated = (!core.isNew) && (old != _icd10);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldName: _name,
      fldIcd10: _icd10,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldName: _name,
      fldIcd10: _icd10,
    });

  // STATICS --------------------------
  static final List<String> tableFields = [
    fldIdLocal,
    fldId,
    fldName,
    fldIcd10,
  ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnDisDsmV (
      $fldIdLocal $dbtIntID,
      $fldId      $dbtIntNotNullUnique,
      
      $fldName  $dbtTextNotNullUnique,
      $fldIcd10 $dbtTextNotNull
      );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId,

           $fldName, $fldIcd10
    FROM   $tnDisDsmV
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnDisDsmV
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnDisDsmV (
      $fldId, 
      $fldName, $fldIcd10
      )
    VALUES (?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnDisDsmV
    SET $fldId = ?,

        $fldName = ?,
        $fldIcd10 = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (isNotNull(_name) && isNotNull(_icd10));
  }
}
