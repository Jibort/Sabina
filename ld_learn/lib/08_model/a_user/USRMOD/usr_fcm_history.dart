// Històric de token FCM per a un dispositiu donat.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters, prefer_final_fields, avoid_init_to_null

// Històric de token FCM per a un dispositiu donat.
import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/09_tools/index.dart';

import '../index.dart';

class UsrFcmHistory extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  String? _fcmToken;
  UsrDevice? _device;
  DateTime? __since;
  bool _lastOne = false;

  // CONSTRUCTORS ---------------------
  UsrFcmHistory({
    required super.pCore,
    String? pToken,
    UsrDevice? pDevice,
    DateTime? pSince,
    bool pLastOne = false,
  }) {
    _fcmToken = pToken;
    _device = pDevice;
    __since = pSince;
    _lastOne = pLastOne;
    _device = pDevice;
  }

  UsrFcmHistory.empty()
      : this(pCore: CoreEntity.empty(), pToken: null, pSince: null, pDevice: null);

  UsrFcmHistory.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _fcmToken = pMap[fldToken];
    _device = pMap[fldDevice] as UsrDevice;
    __since = pMap[fldSince] as DateTime;
    _lastOne = pMap[fldLastOne] ?? false;
  }

  UsrFcmHistory.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(UsrUser, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc = null;

    _fcmToken = pMap[fldId];
    __since = pMap[fldSince] as DateTime;
    _lastOne = (pMap[fldLastOne] == 1);

    Future<Exception?> stepD(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      int? fkDevice;
      try {
        fkDevice = pArgs.first as int?;
        _device = (isNotNull(fkDevice)) ? await dbs.byKey(pCtrl, UsrDevice, pKey: fkDevice) : null;

        Future<Exception?> stepC(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          int? fkCreatedBy;
          try {
            fkCreatedBy = pArgs.first as int?;
            core.createdBy = await dbs.byKey(pCtrl, UsrUser, pKey: fkCreatedBy);

            Future<Exception?> stepU(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              int? fkUpdatedBy;
              try {
                fkUpdatedBy = pArgs.first as int?;
                core.updatedBy = (isNotNull(fkUpdatedBy))
                    ? await dbs.byKey(pCtrl, UsrDevice, pKey: fkUpdatedBy)
                    : null;
              } on Exception catch (pExc) {
                exc = pExc;
              }
              return null;
            }

            pCtrl.state.sneakFn(stepU,
                pArgs: [pMap[fldUpdatedBy]], pLoadStep: null, pOnExc: null, pThen: null);
          } on Exception catch (pExc) {
            exc = pExc;
          }
          return exc;
        }

        pCtrl.state.sneakFn(stepC,
            pArgs: [pMap[fldCreatedAt]], pLoadStep: null, pOnExc: null, pThen: null);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state
        .sneakFn(stepD, pArgs: [pMap[fldDevice]], pLoadStep: null, pOnExc: null, pThen: null);
  }

  // GETTERS i SETTERS ----------------
  String? get fcmToken => _fcmToken;
  set fcmToken(String? pToken) {
    if (isNull(pToken)) {
      throw errorFieldNotNullable("$enUsrFcmHistory.set", fldToken);
    }
    var old = fcmToken;
    _fcmToken = pToken;
    core.isUpdated = !core.isNew && old != pToken;
  }

  UsrDevice? get device => _device;
  set device(UsrDevice? pDevice) {
    if (isNull(pDevice)) throw errorFieldNotNullable("$enUsrFcmHistory.set", fldDevice);
    var old = _device;
    _device = pDevice;
    core.isUpdated = !core.isNew && old != _device;
  }

  DateTime? get since => __since;
  set since(DateTime? pSince) {
    var old = __since;
    __since = pSince;
    core.isUpdated = !core.isNew && old != __since;
  }

  bool get lastOne => _lastOne;
  set lastOne(bool pLast) {
    var old = _lastOne;
    _lastOne = pLast;
    core.isUpdated = !core.isNew && old != _lastOne;
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldToken: _fcmToken,
      fldSince: __since,
      fldLastOne: _lastOne,
      fldDevice: _device,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toMap()
    ..addAll({
      fldToken: _fcmToken,
      fldSince: dTimeToSql(__since),
      fldLastOne: _lastOne ? 1 : 0,
      fldDevice: _device!.serverId,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.stringA.mainFields +
      [
        fldToken,
        fldSince,
        fldLastOne,
        fldDevice,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnUsrFcmHistory (
      $standardHeader,

      $fldToken   $dbtTextNotNull UNIQUE,
      $fldSince   $dbtDateTimeNotNull,
      $fldLastOne $dbtIntNotNull DEFAULT 0,
      $fldDevice  $dbtInt REFERENCES $tnUsrDevice($fldId));
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldToken, $fldSince, $fldLastOne, $fldDevice
    FROM   $tnUsrUser
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnUsrFcmHistory
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnUsrFcmHistory (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldToken, $fldSince, $fldLastOne, $fldDevice)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnUsrUser
    SET $fldId = ?,
        $fldCreatedBy = ?,    $fldCreatedAt = ?,
        $fldUpdatedBy = ?,    $fldUpdatedAt = ?,

        $fldSince = ?,     $fldLastOne = ?, $fldDevice = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (isNotNull(super.core.createdBy) &&
        isNotNull(super.core.createdAt) &&
        isNotNull(_fcmToken) &&
        isNotNull(_device));
  }
}
