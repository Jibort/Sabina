// Representació d'una entrada en el DsmV.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters, prefer_final_fields

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/a_user/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/08_model/c_working/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Enumeració dels tipus de tasca.
enum NotificationType {
  unspecified,
  type1,
  type2,
  type3,
}

// Enumeració dels estats d'una tasca.
enum NotificationState {
  unspecified,
  received,
  readed,
}

// Representació d'una entrada en el DsmV.
class NtfNotification extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  UsrUser? _user;
  String? _notification;
  NotificationType _type = NotificationType.unspecified;
  NotificationState _state = NotificationState.unspecified;
  TstTest? _test;
  RegRegister? _register;
  RscResource? _resource;

  // CONSTRUCTORS ---------------------
  NtfNotification({
    required super.pLocalId,
    required super.pId,
    required super.pCreatedBy,
    required super.pCreatedAt,
    required super.pUpdatedBy,
    required super.pUpdatedAt,
    super.pIsNew,
    super.pIsUpdated,
    super.pIsDeleted,
    UsrUser? pUser,
    NtfNotification? pNotification,
    NotificationType pType = NotificationType.unspecified,
    NotificationState pState = NotificationState.unspecified,
    TstTest? pTest,
    RegRegister? pRegister,
    RscResource? pResource,
  });

  NtfNotification.empty()
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
            pUser: null,
            pNotification: null,
            pType: NotificationType.unspecified,
            pState: NotificationState.unspecified,
            pTest: null,
            pRegister: null,
            pResource: null);

  NtfNotification.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _user = pMap[fldUser];
    _notification = pMap[fldNotification];
    _type = pMap[fldNotificationType];
    _state = pMap[fldNotificationState];
    _test = pMap[fldTest];
    _register = pMap[fldRegister];
    _resource = pMap[fldResource];
  }

  NtfNotification.bySQLMap(
      BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(NtfNotification, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _notification = pMap[fldNotification];
    _type = notificationTypeById(pMap[fldNotificationType]);
    _state = notificationStateById(pMap[fldNotificationState]);

    // Carreguem l'usuari.
    Future<Exception?> stTest(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _resource = await dbs.byKey(pCtrl, RscResource, pKey: pArgs.first);

        // Carreguem el test.
        Future<Exception?> stTest(
            FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _resource = await dbs.byKey(pCtrl, RscResource, pKey: pArgs.first);

            // Carreguem el registre.
            Future<Exception?> stRegister(
                FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _resource =
                    await dbs.byKey(pCtrl, RscResource, pKey: pArgs.first);

                // Carreguem el recurs.
                Future<Exception?> stResource(
                    FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                  try {
                    _resource =
                        await dbs.byKey(pCtrl, RscResource, pKey: pArgs.first);

                    // Carrega createdBy i updatedBy.
                    super.completeStandard(pCtrl, pMap);
                  } on Exception catch (pExc) {
                    exc = pExc;
                  }
                  return exc;
                }

                pCtrl.state.sneakFn(stResource, pArgs: [pMap[fldResource]]);
              } on Exception catch (pExc) {
                exc = pExc;
              }
              return exc;
            }

            pCtrl.state.sneakFn(stRegister, pArgs: [pMap[fldRegister]]);
          } on Exception catch (pExc) {
            exc = pExc;
          }
          return exc;
        }

        pCtrl.state.sneakFn(stTest, pArgs: [pMap[fldTest]]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stTest, pArgs: [pMap[fldTest]]);
  }

  // GETTERS i SETTERS ----------------
  UsrUser? get usrUser => _user;
  void setUser(UsrUser? pUser) {
    if (isNull(pUser)) {
      throw errorFieldNotNullable("$enNtfNotification.set", fldUser);
    }
    var old = _user;
    _user = pUser;
    super.isUpdated = (!super.isNew) && (old != _user);
  }

  String? get notification => _notification;
  void setNotification(String? pNotification) {
    if (isNull(pNotification)) {
      throw errorFieldNotNullable("$enNtfNotification.set", fldNotification);
    }
    var old = _notification;
    _notification = pNotification;
    super.isUpdated = (!super.isNew) && (old != _notification);
  }

  NotificationType get notificationType => _type;
  void setNotificationType(NotificationType pType) {
    if (isNull(pType)) {
      throw errorFieldNotNullable(
          "$enNtfNotification.set", fldNotificationType);
    }
    var old = _type;
    _type = pType;
    super.isUpdated = (!super.isNew) && (old != _type);
  }

  NotificationState get notificationState => _state;
  void setNotificationState(NotificationState pState) {
    if (isNull(pState)) {
      throw errorFieldNotNullable(
          "$enNtfNotification.set", fldNotificationState);
    }
    var old = _state;
    _state = pState;
    super.isUpdated = (!super.isNew) && (old != _state);
  }

  TstTest? get test => _test;
  void setTest(TstTest? pTest) {
    var old = _test;
    _test = pTest;
    super.isUpdated = (!super.isNew) && (old != _test);
  }

  RegRegister? get register => _register;
  void setRegister(RegRegister? pRegister) {
    var old = _register;
    _register = pRegister;
    super.isUpdated = (!super.isNew) && (old != _register);
  }

  RscResource? get resource => _resource;
  void setResource(RscResource? pResource) {
    var old = _resource;
    _resource = pResource;
    super.isUpdated = (!super.isNew) && (old != _resource);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldUser: _user,
      fldNotification: _notification,
      fldNotificationType: _type,
      fldNotificationState: _state,
      fldTest: _test,
      fldRegister: _register,
      fldResource: _resource,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldUser: _user!.id,
      fldNotification: _notification,
      fldNotificationType: _type.id,
      fldNotificationState: _state.id,
      fldTest: _test?.id,
      fldRegister: _register?.id,
      fldResource: _resource?.id,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldUser,
        fldNotification,
        fldNotificationType,
        fldNotificationState,
        fldTest,
        fldRegister,
        fldResource,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnNtfNotification (
      $standardHeader,
      
      $fldUser              $dbtIntNotNull REFERENCES $tnUsrUser($fldId),
      $fldNotification      $dbtTextNotNull,
      $fldNotificationType  $dbtIntNotNull DEFAULT 0,
      $fldNotificationState $dbtIntNotNull DEFAULT 0,
      $fldTest              $dbtInt REFERENCES $tnTstTest($fldId),
      $fldRegister          $dbtInt REFERENCES $tnRegRegister($fldId),
      $fldResource          $dbtInt REFERENCES $tnRscResource($fldId)
      );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldUser, $fldNotification, $fldNotificationType, $fldNotificationState,
           $fldTest, $fldRegister, $fldResource
    FROM   $tnNtfNotification
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnNtfNotification
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnNtfNotification (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldUser, $fldNotification, $fldNotificationType, $fldNotificationState,
      $fldTest, $fldRegister, $fldResource)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?, ?,   ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnNtfNotification
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldUser = ?,
        $fldNotification = ?,
        $fldNotificationType = ?,
        $fldNotificationState = ?,
        $fldTest = ?,
        $fldRegister = ?,
        $fldResource = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_user) &&
        isNotNull(_notification) &&
        isNotNull(_type) &&
        isNotNull(_state));
  }
}

// EXTENSIONS =========================
extension NotificationTypeIdx on NotificationType {
  // Retorna l'Id del tipus de notificació.
  int get id {
    switch (this) {
      case NotificationType.unspecified:
        return 0;
      case NotificationType.type1:
        return 1;
      case NotificationType.type2:
        return 2;
      case NotificationType.type3:
        return 3;
    }
  }
}

// Retorna el tipus de notificació.
NotificationType notificationTypeById(int pId) {
  switch (pId) {
    case 0:
      return NotificationType.unspecified;
    case 1:
      return NotificationType.type1;
    case 2:
      return NotificationType.type2;
    case 3:
      return NotificationType.type3;
    default:
      throw 'Invalid NotificationType.id: $pId';
  }
}

// Retorna el tipus d'una notificació.
NotificationType dyn2NotificationType(dynamic pType) {
  switch (pType) {
    case NotificationType type:
      return type;
    case int value:
      return notificationTypeById(value);
    default:
      throw errorUnknownType(
          "NotificationType.set", fldNotificationType, pType.runtimeType);
  }
}

extension NotificationStateIdx on NotificationState {
  // Retorna l'Id de l'estat d'una notificació.
  int get id {
    switch (this) {
      case NotificationState.unspecified:
        return 0;
      case NotificationState.received:
        return 1;
      case NotificationState.readed:
        return 2;
    }
  }
}

// Retorna el tipus de notificació.
NotificationState notificationStateById(int pId) {
  switch (pId) {
    case 0:
      return NotificationState.unspecified;
    case 1:
      return NotificationState.received;
    case 2:
      return NotificationState.readed;
    default:
      throw 'Invalid NotificationState.id: $pId';
  }
}

// Retorna el tipus d'una tasca.
NotificationState dyn2NotificationState(dynamic pType) {
  switch (pType) {
    case NotificationState type:
      return type;
    case int value:
      return notificationStateById(value);
    default:
      throw errorUnknownType(
          "NotificationState.set", fldNotificationState, pType.runtimeType);
  }
}
