// Representació de la traducció d'una cadena a l'aplicació.
// createdAt: 24/08/10 ds. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/09_tools/index.dart';
import 'package:ld_learn/10_localization/index.dart';
import 'package:ld_learn/consts.dart';

class LocTranslation extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  int? __id;
  String? _tKey;
  Locale _locale = localeES;
  String? _literal;
  int? _iteration;

  // CONSTRUCTORS (stringAB)----------
  LocTranslation(
      {required super.pId,
      super.pIsNew,
      super.pIsUpdated,
      super.pIsDeleted,
      String? pTKey,
      Locale pLocale = localeES,
      String? pLiteral,
      int pIteration = 0})
      : super(
            pLocalId: null,
            pCreatedBy: null,
            pCreatedAt: null,
            pUpdatedBy: null,
            pUpdatedAt: null) {
    _tKey = pTKey;
    _locale = pLocale;
    _literal = pLiteral;
    _iteration = pIteration;
  }

  LocTranslation.empty()
      : this(
            pId: null,
            pIsNew: true,
            pIsUpdated: false,
            pIsDeleted: false,
            pTKey: null,
            pLocale: localeES,
            pLiteral: null,
            pIteration: 0);

  LocTranslation.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    __id = pMap[fldId];
    _tKey = pMap[fldTextKey];
    _locale = pMap[fldLocale];
    _literal = pMap[fldLiteral];
    _iteration = pMap[fldIteration];
  }

  LocTranslation.bySQLMap(
      BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(LocTranslation, pMap) {
    __id = pMap[fldId];
    _tKey = pMap[fldTextKey];
    _locale = Locale(pMap[fldLocaleCode]);
    _literal = pMap[fldLiteral];
    _iteration = pMap[fldIteration];
  }

  // GETTERS/SETTERS ------------------
  @override
  int? get id => __id;
  @override
  set id(int? pId) {
    if (isNull(pId)) {
      throw errorFieldNotNullable("$tnLocTranslation.set", fldId);
    }
    var old = __id;
    __id = pId;
    isUpdated = !isNew && old != __id;
  }

  Locale get locale => _locale;
  set locale(dynamic pLoc) {
    var old = _locale;
    _locale = dyn2Locale(pLoc);
    super.isUpdated = (!super.isNew) && (old != _locale);
  }

  String get textKey => _tKey ?? unknownTextKey;
  set textKey(String pTKey) {
    var old = _tKey;
    _tKey = pTKey;
    super.isUpdated = (!super.isNew) && (old != _tKey);
  }

  String get literal => _literal ?? textKey;
  set literal(String pLiteral) {
    var old = _literal;
    _literal = pLiteral;
    super.isUpdated = (!super.isNew) && (old != _literal);
  }

  int get iteration => _iteration ?? 0;
  set iteration(int pNew) =>
      _iteration = (pNew > iteration) ? pNew : _iteration;

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => {
        fldId: __id,
        fldLocale: _locale,
        fldTextKey: _tKey,
        fldLiteral: _literal ?? textKey,
        fldIteration: _iteration,
      };

  @override
  Map<String, dynamic> toSQLMap() => {
        fldId: __id,
        fldLocaleCode: _locale.languageCode,
        fldTextKey: _tKey,
        fldLiteral: _literal,
        fldIteration: _iteration,
      };

  // STATICS --------------------------
  static final List<String> tableFields = [
    fldLocaleCode,
    fldTextKey,
    fldLiteral,
    fldIteration,
  ];

  static String get stmtCreateTable => '''
    CREATE TABLE     $tnLocTranslation (
      $fldId         $dbtIntNotNullUnique,
      $fldLocaleCode $dbtTextNotNull,
      $fldTextKey    $dbtTextNotNull,
      $fldLiteral    $dbtTextNotNull,
      $fldIteration  $dbtIntNotNull DEFAULT 0
    );
  ''';

  static List<String> get stmtAuxCreate => [
        "CREATE UNIQUE INDEX ${tnLocTranslation}_PK ON $tnLocTranslation($fldLocaleCode, $fldTextKey);",
      ];

  static String get stmtSelect => '''
    SELECT $fldLiteral, $fldIteration
    FROM   $tnLocTranslation
    WHERE  $fldTextKey = ? AND $fldLocaleCode = ?;
  ''';

  static String get stmtDelete => '''
    DELETE
    FROM  $tnLocTranslation
    WHERE $fldTextKey = ? AND $fldLocaleCode = ?;
  ''';

  static String get stmtInsert => '''
    INSERT
    INTO $tnLocTranslation ($fldId, $fldTextKey, $fldLocaleCode, $fldLiteral, $fldIteration)
    VALUES (?, ?, ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnLocTranslation
    SET $fldId = ?,
        $fldTextKey = ?,
        $fldLocaleCode = ?,
        $fldLiteral = ?,
        $fldIteration = ?
    WHERE $fldLocaleCode = ?, $fldTextKey = ?;
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_tKey) &&
        isNotNull(_tKey) &&
        isNotNull(_literal));
  }
}
