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
  late String? _tKey;
  late Locale _locale = localeES;
  late String? _literal;
  late int? _iteration;

  // CONSTRUCTORS (stringAB)----------
  LocTranslation(
      {required super.pCore,
      String? pTKey,
      Locale pLocale = localeES,
      String? pLiteral,
      int pIteration = 0}) {
    _tKey = pTKey;
    _locale = pLocale;
    _literal = pLiteral;
    _iteration = pIteration;
  }

  LocTranslation.empty()
      : this(
            pCore: CoreEntity.empty(),
            pTKey: null,
            pLocale: localeES,
            pLiteral: null,
            pIteration: 0);

  LocTranslation.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _tKey = pMap[fldTextKey];
    _locale = pMap[fldLocale];
    _literal = pMap[fldLiteral];
    _iteration = pMap[fldIteration];
  }

  LocTranslation.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(LocTranslation, pMap) {
    _tKey = pMap[fldTextKey];
    _locale = Locale(pMap[fldLocaleCode]);
    _literal = pMap[fldLiteral];
    _iteration = pMap[fldIteration];
  }

  // LocTranslation.byProto(prts.LocTranslation pProto, IncrFuture? pToDo)
  //     : super.byProto(pProto, pToDo) {
  //   locale = pProto.locale.toModel(pToDo);
  //   textKey = pProto.textKey.toModel(pToDo);
//
  //   lang = locale!.lang;
  //   literal = pProto.literal;
  // }

  // GETTERS/SETTERS ------------------
  Locale get locale => _locale;
  set locale(dynamic pLoc) {
    var old = _locale;
    _locale = dyn2Locale(pLoc);
    core.isUpdated = (!core.isNew) && (old != _locale);
  }

  String get textKey => _tKey ?? unknownTextKey;
  set textKey(String pTKey) {
    var old = _tKey;
    _tKey = pTKey;
    core.isUpdated = (!core.isNew) && (old != _tKey);
  }

  String get literal => _literal ?? textKey;
  set literal(String pLiteral) {
    var old = _literal;
    _literal = pLiteral;
    core.isUpdated = (!core.isNew) && (old != _literal);
  }

  int get iteration => _iteration ?? 0;
  set iteration(int pNew) => _iteration = (pNew > iteration) ? pNew : _iteration;

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => {
        fldLocale: _locale,
        fldTextKey: _tKey,
        fldLiteral: _literal ?? textKey,
        fldIteration: _iteration,
      };

  @override
  Map<String, dynamic> toSQLMap() => {
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
    WHERE  $fldLocaleCode = ?, $fldTextKey = ?;
  ''';

  static String get stmtDelete => '''
    DELETE
    FROM  $tnLocTranslation
    WHERE $fldLocaleCode = ?, $fldTextKey = ?;
  ''';

  static String get stmtInsert => '''
    INSERT
    INTO $tnLocTranslation ($fldLocaleCode, $fldTextKey, $fldLiteral, $fldIteration)
    VALUES (?, ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnLocTranslation
    SET $fldLocaleCode = ?,
        $fldTextKey = ?,
        $fldLiteral = ?,
        $fldIteration = ?
    WHERE $fldLocaleCode = ?, $fldTextKey = ?;
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (isNotNull(super.core.createdBy) &&
        isNotNull(super.core.createdAt) &&
        isNotNull(_tKey) &&
        isNotNull(_tKey) &&
        isNotNull(_literal));
  }
}
