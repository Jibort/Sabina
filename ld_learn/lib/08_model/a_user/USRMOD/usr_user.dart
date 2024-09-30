// Representació d'un usuari de l'aplicació.
// createdAt: 24/08/10 ds. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'dart:ffi';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:ld_learn/01_ui/widgets/base_controller.dart';
import 'package:ld_learn/01_ui/widgets/deep_do.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/database_service.dart';
import 'package:ld_learn/09_tools/index.dart';
import 'package:ld_learn/consts.dart';

import '../index.dart';

// Enumeració de tipus d'usuari.
enum UserType {
  unspecified,
  root,
  admin,
  patient,
  therapist,
}

// Enumeració de tipus d'usuari.
enum UserState {
  unspecified,
  building,
  active,
  locked,
}

// Representació d'un usuari de l'aplicació.
class UsrUser extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  UserType _usrType = UserType.unspecified;
  UserState _usrState = UserState.unspecified;
  Uint64 _permissions = 0 as Uint64;
  String? _alias;
  Uint8List? __certificate;
  DateTime? __birthDate;
  Uint64? __firstConnKey;
  DateTime? __firstConnAt;
  Locale _locale = localeES;
  UsrUser? __therapist;
  UsrDevice? __device;

  // CONSTRUCTORS ---------------------
  UsrUser(
      {required super.pLocalId,
      required super.pId,
      required super.pCreatedBy,
      required super.pCreatedAt,
      required super.pUpdatedBy,
      required super.pUpdatedAt,
      super.pIsNew,
      super.pIsUpdated,
      super.pIsDeleted,
      UserType pUsrType = UserType.unspecified,
      UserState pUsrState = UserState.unspecified,
      Uint64? pPermissions,
      String? pAlias,
      Uint8List? pCertificate,
      DateTime? pBirthDate,
      Uint64? pFirstConnKey,
      DateTime? pFirstConnAt,
      Locale pLocale = localeES,
      UsrUser? pTherapist,
      UsrDevice? pDevice}) {
    _usrType = pUsrType;
    _usrState = pUsrState;
    _permissions = pPermissions ?? 0 as Uint64;
    _alias = pAlias;
    __certificate = pCertificate;
    __birthDate = pBirthDate;
    __firstConnKey = pFirstConnKey;
    __firstConnAt = pFirstConnAt;
    _locale = pLocale;
    __therapist = pTherapist;
    __device = pDevice;
  }

  UsrUser.empty()
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
            pUsrType: UserType.unspecified,
          pUsrState: UserState.unspecified,
          pPermissions: 0 as Uint64?,
          pAlias: null,
          pCertificate: null,
          pBirthDate: null,
          pFirstConnKey: null,
          pFirstConnAt: null,
          pLocale: localeES,
          pTherapist: null,
          pDevice: null,
        );

  UsrUser.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _usrType = userTypeById(pMap[fldUserType]);
    _usrState = userStateById(pMap[fldUserState]);
    _permissions = pMap[fldPermissions];
    _alias = pMap[fldAlias];
    __certificate = pMap[fldCertificate];
    __birthDate = pMap[fldBirthDate];
    __firstConnKey = pMap[fldFirstConnKey];
    __firstConnAt = pMap[fldFirstConnAt];
    _locale = pMap[fldLocale];
    __therapist = pMap[fldTherapist];
    __device = pMap[fldDevice];
  }

  UsrUser.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(UsrUser, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _usrType = userTypeById(pMap[fldUserType]);
    _usrState = userStateById(pMap[fldUserState]);
    _permissions = pMap[fldPermissions];
    _alias = pMap[fldAlias];
    __certificate = pMap[fldCertificate];
    __birthDate = dTimeFromSql(pMap[fldBirthDate]);
    __firstConnKey = pMap[fldFirstConnKey];
    __firstConnAt = dTimeFromSql(pMap[fldFirstConnAt]);
    _locale = Locale(pMap[fldLocaleCode] ?? localeES);

    // Carreguem el terapeuta.
    Future<Exception?> stTherapist(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        __therapist = await dbs.byKey(pCtrl, UsrUser, pKey: pArgs.first);

        // Carreguem l'últim dispositiu fet servir per l'usuari.
        Future<Exception?> stDevice(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            __device = await dbs.byKey(pCtrl, UsrDevice, pKey: pArgs.first);

            // Carrega createdBy i updatedBy.
            super.completeStandard(pCtrl, pMap);
          } on Exception catch (pExc) {
            exc = pExc;
          }
          return null;
        }

        pCtrl.state.sneakFn(stDevice, pArgs: [pMap[fldDevice]]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stTherapist, pArgs: [pMap[fldTherapist]]);
  }

  // GETTERS i SETTERS ----------------
  UserType get usrType => _usrType;
  set usrType(dynamic pType) {
    if (isNull(pType)) {
      throw errorFieldNotNullable("$enUsrUser.set", fldUserType);
    }
    var old = _usrType;
    _usrType = dyn2UserType(pType);
    isUpdated = !isNew && old != _usrType;
  }

  UserState get usrState => _usrState;
  set usrState(dynamic pState) {
    if (isNull(pState)) {
      throw errorFieldNotNullable("$enUsrUser.set", fldUserState);
    }
    var old = _usrState;
    _usrState = dyn2UserState(pState);
    isUpdated = (!isNew) && (old != _usrState);
  }

  Uint64 get permissions => _permissions;
  set permissions(Uint64 pPermissions) {
    var old = _permissions;
    _permissions = pPermissions;
    isUpdated = (!isNew) && (old != _permissions);
  }

  String? get alias => _alias;
  set alias(String? pAlias) {
    if (isNull(pAlias)) {
      throw errorArgumentNotNullable("$enUsrUser.set", fldAlias);
    }
    var old = _alias;
    _alias = pAlias;
    isUpdated = (!isNew) && (old != _alias);
  }

  Uint8List? get certificate => __certificate;
  set certificate(Uint8List? pCertificate) {
    var old = __certificate;
    __certificate = pCertificate;
    isUpdated = (!isNew) && (old != __certificate);
  }

  DateTime? get birthDate => __birthDate;
  set birthDate(dynamic pBirthDate) {
    var old = __birthDate;
    switch (pBirthDate) {
      case int? val:
        __birthDate = dTimeFromSql(val);
        break;
      case DateTime? val:
        __birthDate = val;
        break;
      default:
        throw 'Invalid UsrUser.birthDate.${pBirthDate.runtimeType}';
    }
    isUpdated = (!isNew) && (old != __birthDate);
  }

  Uint64? get firstConnKey => __firstConnKey;
  set firstConnKey(Uint64? pFirstConnKey) {
    var old = __firstConnKey;
    __firstConnKey = pFirstConnKey;
    isUpdated = (!isNew) && (old != __firstConnKey);
  }

  DateTime? get firstConnAt => __firstConnAt;
  set firstConnAt(dynamic pFirstConnAt) {
    var old = __firstConnAt;

    switch (pFirstConnAt) {
      case int? val:
        __firstConnAt = dTimeFromSql(val);
        break;
      case DateTime? val:
        __firstConnAt = val;
        break;
      default:
        throw 'Invalid UsrUser.firstConnAt.${pFirstConnAt.runtimeType}';
    }
    isUpdated = (!isNew) && (old != __firstConnAt);
  }

  UsrDevice? get device => __device;
  set device(UsrDevice? pDevice) {
    var old = __device;
    __device = pDevice;
    isUpdated = (!isNew) && (old != __device);
  }

  UsrUser? get therapist => __therapist;
  set therapist(UsrUser? pTherapist) {
    var old = __therapist;
    __therapist = pTherapist;
    isUpdated = (!isNew) && (old != __therapist);
  }

  Locale get locale => _locale;
  String get localeId => _locale.languageCode;
  set locale(dynamic pLocale) {
    if (isNull(pLocale)) {
      throw errorFieldNotNullable("$enUsrUser.set", fldLocale);
    }
    var old = _locale;
    switch (pLocale) {
      case String? val:
        _locale = (isNotNull(val)) ? Locale(val!) : localeES;
        break;
      case Locale? val:
        _locale = val ?? localeES;
        break;
      default:
        throw 'Invalid UsrUser.locale.${pLocale.runtimeType}';
    }
    isUpdated = (!isNew) && (old != _locale);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldUserType: _usrType,
      fldUserState: _usrState,
      fldPermissions: _permissions,
      fldAlias: _alias,
      fldCertificate: __certificate,
      fldBirthDate: __birthDate,
      fldFirstConnKey: __firstConnKey,
      fldFirstConnAt: __firstConnAt,
      fldDevice: __device,
      fldTherapist: __therapist,
      fldLocale: _locale,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldUserType: _usrType.id,
      fldUserState: _usrState.id,
      fldPermissions: _permissions,
      fldAlias: _alias,
      fldBirthDate: dTimeToSql(__birthDate),
      fldFirstConnKey: __firstConnKey,
      fldFirstConnAt: __firstConnAt,
      fldDevice: __device?.id,
      fldTherapist: __therapist?.id,
      fldLocaleCode: _locale.languageCode,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldUserType,
        fldUserState,
        fldPermissions,
        fldAlias,
        fldCertificate,
        fldBirthDate,
        fldFirstConnKey,
        fldFirstConnAt,
        fldDevice,
        fldTherapist,
        fldLocaleCode,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnUsrUser (
      $standardHeader,

      $fldUserType     $dbtIntNotNull,
      $fldUserState    $dbtIntNotNull,
      $fldPermissions  $dbtIntNotNull DEFAULT 0,
      $fldAlias        $dbtTextNotNull,
      $fldCertificate  $dbtText,
      $fldBirthDate    $dbtDateTime,
      $fldFirstConnKey $dbtInt,
      $fldFirstConnAt  $dbtDateTime,
      $fldLocaleCode   $dbtTextNotNull DEFAULT "es",
      $fldTherapist    $dbtInt REFERENCES $tnUsrUser($fldId)
      );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldUserType, $fldUserState, $fldPermissions,
           $fldAlias, $fldCertificate,$fldBirthDate,
           $fldFirstConnKey, $fldFirstConnAt, $fldDevice,
           $fldDevice, $fldTherapist, $fldLocaleCode
    FROM   $tnUsrUser
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnUsrUser
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnUsrUser (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldUserType, $fldUserState, $fldPermissions, $fldAlias,
      $fldCertificate, $fldBirthDate, $fldFirstConnKey,
      $fldFirstConnAt, $fldDevice, $fldTherapist, $fldLocaleCode)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?, ?,   ?, ?, ?,   ?, ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnUsrUser
    SET $fldId = ?,
        $fldCreatedBy = ?,    $fldCreatedAt = ?,
        $fldUpdatedBy = ?,    $fldUpdatedAt = ?,

        $fldUserType = ?,     $fldUserState = ?,
        $fldPermissions = ?,  $fldAlias = ?,
        $fldCertificate = ?,  $fldBirthDate = ?,
        $fldFirstConnKey = ?, $fldFirstConnAt = ?,
        $fldDevice = ?,       $fldTherapist = ?,
        $fldLocaleCode = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (isNotNull(super.createdBy) &&
        isNotNull(super.createdAt) &&
        isNotNull(_usrType) &&
        isNotNull(_usrState) &&
        isNotNull(_alias));
  }
}

// EXTENSIONS =========================
extension UserTypeIdx on UserType {
  // Retorna l'Id del tipus d'un usuari.
  int get id {
    switch (this) {
      case UserType.unspecified:
        return 0;
      case UserType.root:
        return 1;
      case UserType.admin:
        return 2;
      case UserType.patient:
        return 3;
      case UserType.therapist:
        return 4;
    }
  }
}

// Retorna el tipus d'un usuari a partir del seu Id.
UserType userTypeById(int pId) {
  switch (pId) {
    case 0:
      return UserType.unspecified;
    case 1:
      return UserType.root;
    case 2:
      return UserType.admin;
    case 3:
      return UserType.patient;
    case 4:
      return UserType.therapist;
    default:
      throw 'Invalid UserType.id';
  }
}

// Retorna el tipus d'un usuari a partir d'un dynamic.
UserType dyn2UserType(dynamic pType) {
  switch (pType) {
    case UserType type:
      return type;
    case int value:
      return userTypeById(value);
    default:
      throw errorUnknownType("UserType.set", fldUserType, pType.runtimeType);
  }
}

extension UserStateIdx on UserState {
  // Retorna l'Id de l'estat d'un usuari.
  int get id {
    switch (this) {
      case UserState.unspecified:
        return 0;
      case UserState.building:
        return 1;
      case UserState.active:
        return 2;
      case UserState.locked:
        return 3;
      default:
        throw 'Invalid UserState.${toString()}';
    }
  }
}

// Retorna l'estat d'un usuari a partir del seu Id.
UserState userStateById(int pId) {
  switch (pId) {
    case 0:
      return UserState.unspecified;
    case 1:
      return UserState.building;
    case 2:
      return UserState.active;
    case 3:
      return UserState.locked;
    default:
      throw 'Invalid UserState.id';
  }
}

// Retorna l'estat d'un usuari a partir d'un dynamic.
UserState dyn2UserState(dynamic pState) {
  switch (pState) {
    case UserState state:
      return state;
    case int value:
      return userStateById(value);
    default:
      throw errorUnknownType("UserState.set", fldUserState, pState.runtimeType);
  }
}
