// Representació d'un dispositiu d'usuari de l'aplicació.
// createdAt: 24/08/11 dg. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/09_tools/index.dart';

import 'package:ld_learn/05_proto/model_entity.pb.dart' as $pb_glb;
import 'package:ld_learn/05_proto/usrmod/usr_device.pb.dart' as $pb_dev;

import '../index.dart';

// Enumeració dels tipus de dispositius.
enum DeviceType {
  unspecified,
  androidMobile,
  androidTablet,
  iOSMobile,
  iOSTablet,
  windows,
  macOS,
  linux,
}

// Enumeració dels estats del dispositiu.
enum DeviceState {
  unspecified,
  enabled,
  disabled,
}

// Representació d'un usuari de l'aplicació.
class UsrDevice extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  DeviceType _devType = DeviceType.unspecified;
  DeviceState _devState = DeviceState.unspecified;
  String? __desc;
  String? _token;
  UsrUser? _owner;

  // CONSTRUCTORS ---------------------
  // Constructor per defecte.
  UsrDevice(
      {required super.pLocalId,
      required super.pId,
      required super.pCreatedBy,
      required super.pCreatedAt,
      required super.pUpdatedBy,
      required super.pUpdatedAt,
      super.pIsNew,
      super.pIsUpdated,
      super.pIsDeleted,
      DeviceType pDevType = DeviceType.unspecified,
      DeviceState pDevState = DeviceState.unspecified,
      String? pDesc,
      String? pToken,
      UsrUser? pOwner}) {
    _devType = pDevType;
    _devState = pDevState;
    _token = pToken;
    __desc = pDesc;
    _owner = pOwner;
  }

  // Constructor buït
  UsrDevice.empty()
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
            pDevType: DeviceType.unspecified,
            pDevState: DeviceState.unspecified,
            pDesc: null,
            pToken: null,
            pOwner: null);

  // Constructor a partir d'un mapa JSON.
  UsrDevice.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _devType = deviceTypeById(pMap[fldDeviceType]);
    _devState = deviceStateById(pMap[fldDeviceState]);
    __desc = pMap[fldDesc];
    _token = pMap[fldToken];
    _owner = pMap[fldOwner];
  }

  // Constructor a partir d'una consulta SQL
  UsrDevice.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(UsrUser, pMap) {
    _devType = deviceTypeById(pMap[fldDeviceType]);
    _devState = deviceStateById(pMap[fldDeviceState]);
    __desc = pMap[fldDesc];
    _token = pMap[fldToken];

    _foreignKeys(pCtrl, pMap);
  }

  // Constructor a partir d'una instància gRPC
  UsrDevice.byGrpc(BaseController<DeepDo> pCtrl, $pb_dev.UsrDevice pGRPC)
      : super.byGRPC(UsrDevice, pGRPC.baseEntity) {
    _devType = dyn2DeviceType(pGRPC.type);
    _devState = dyn2DeviceState(pGRPC.state);
    __desc = pGRPC.desc;
    _token = pGRPC.token;

    _foreignKeys(pCtrl, {
      fldCreatedBy: pGRPC.baseEntity.createdBy,
      fldUpdatedBy: pGRPC.baseEntity.updatedBy,
      fldOwner: pGRPC.owner,
    });
  }

  // Càrrega controlada dels registres d'entitats referides.
  void _foreignKeys(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;
    
    // Carreguem el propietari del dispositiu.
    Future<Exception?> stepOwner(
        FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _owner = await dbs.byKey(pCtrl, UsrUser, pKey: pArgs.first);

        // Carrega createdBy i updatedBy.
        completeStandard(pCtrl, pMap);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stepOwner, pArgs: [pMap[fldOwner]]);
  }

  // GRPC -----------------------------
  // Funció per convertir l'objecte a format gRPC
  $pb_dev.UsrDevice toGrpc() {
    return $pb_dev.UsrDevice(
      baseEntity: $pb_glb.ModelEntity(
        id: id,
        localId: localId,
        createdBy: createdBy?.id,
        createdAt: dTtimeToTStamp(createdAt),
        updatedBy: updatedBy?.id,
        updatedAt: dTtimeToTStamp(updatedAt),
      ),
      desc: __desc,
      type: $pb_dev.UsrDeviceType.valueOf(_devType.id),
      state: $pb_dev.UsrDeviceState.valueOf(_devState.id),
      token: _token,
      owner: _owner?.id,
    );
  }

  // GETTERS i SETTERS ----------------
  DeviceType? get devType => _devType;
  set devType(dynamic pType) {
    if (isNull(pType)) {
      throw errorFieldNotNullable("$enUsrDevice.set", fldDeviceType);
    }
    var old = _devType;
    _devType = dyn2DeviceType(pType);
    isUpdated = (!isNew) && (old != _devType);
  }

  DeviceState? get devState => _devState;
  set devState(dynamic pState) {
    if (isNull(pState)) {
      throw errorFieldNotNullable("$enUsrDevice.set", fldDeviceState);
    }
    var old = _devState;
    _devState = dyn2DeviceState(pState);
    isUpdated = (!isNew) && (old != _devState);
  }

  String? get token => _token;
  set token(String? pToken) {
    if (isNull(pToken)) {
      throw errorFieldNotNullable("$enUsrDevice.set", fldToken);
    }
    var old = _token;
    _token = pToken;
    isUpdated = (!isNew) && (old != _token);
  }

  String? get desc => __desc;
  void setDesc(String? pDesc) {
    var old = __desc;
    __desc = pDesc;
    super.isUpdated = (!super.isNew) && (old != __desc);
  }

  UsrUser? get owner => _owner;
  set owner(UsrUser? pOwner) {
    if (isNull(pOwner)) {
      throw errorFieldNotNullable("$enUsrDevice.set", fldOwner);
    }
    var old = _owner;
    _owner = pOwner;
    isUpdated = (!isNew) && (old != _owner);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldDeviceType: _devType,
      fldDeviceState: _devState,
      fldDesc: __desc,
      fldToken: _token,
      fldOwner: _owner,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldDeviceType: _devType.id,
      fldDeviceState: _devState.id,
      fldToken: _token,
      fldOwner: _owner!.id,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldDeviceType,
        fldDeviceState,
        fldPermissions,
        fldToken,
        fldDesc,
        fldOwner,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnUsrDevice (
      $standardHeader,

      $fldDeviceType  $dbtIntNotNull,
      $fldDeviceState $dbtIntNotNull,
      $fldDescKey     $dbtText,
      $fldToken       $dbtTextNotNull UNIQUE,
      $fldDesc        $dbtText,
      $fldOwner       $dbtIntNotNull REFERENCES $tnUsrUser($fldId));
  ''';

  static List<String> get stmtAuxCreate => [
        '''
    ALTER TABLE $tnUsrUser ADD COLUMN $fldDevice $dbtInt REFERENCES $tnUsrDevice($fldId);
  ''',
        '''
    INSERT INTO $tnUsrUser (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldUserType, $fldUserState, $fldPermissions, $fldAlias,
      $fldCertificate, $fldBirthDate, $fldFirstConnKey,
      $fldFirstConnAt, $fldLocaleCode, $fldDevice, $fldTherapist)
    VALUES (0, 0, ${dTimeToSql(DateTime.now())}, ?, ?,  
            ${UserType.root}, ${UserState.active}, 0xffffffffffffffff, 'root',
            null, null, null,
            null, 'ca', null, null);
  '''
      ];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldDeviceType, $fldDeviceState, $fldDesc, $fldToken, $fldOwner
    FROM   $tnUsrDevice
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnUsrDevice
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnUsrDevice (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldDeviceType, $fldDeviceState, $fldDesc, $fldToken, $fldOwner)
    VALUES (?,?,?,?,?,   ?,?,?,?,?s);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnUsrDevice
    SET $fldId = ?,
        $fldCreatedBy = ?,  $fldCreatedAt = ?,
        $fldUpdatedBy = ?,  $fldUpdatedAt = ?,

        $fldDeviceType = ?, $fldDeviceState = ?,
        $fldDesc = ?,       $fldToken = ?,
        $fldOwner = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_devType) &&
        isNotNull(_devState) &&
        isNotNull(_token) &&
        isNotNull(_owner));
  }
}

// EXTENSIONS =========================
extension DeviceTypeIdx on DeviceType {
  // Retorna l'Id del tipus de dispositiu d'un usuari.
  int get id {
    switch (this) {
      case DeviceType.unspecified:
        return 0;
      case DeviceType.androidMobile:
        return 1;
      case DeviceType.androidTablet:
        return 2;
      case DeviceType.iOSMobile:
        return 3;
      case DeviceType.iOSTablet:
        return 4;
      case DeviceType.windows:
        return 5;
      case DeviceType.macOS:
        return 6;
      case DeviceType.linux:
        return 7;
    }
  }
}

// Retorna el tipus de dispositiu d'usuari a partir del seu Id.
DeviceType deviceTypeById(int pId) {
  switch (pId) {
    case 0:
      return DeviceType.unspecified;
    case 1:
      return DeviceType.androidMobile;
    case 2:
      return DeviceType.androidTablet;
    case 3:
      return DeviceType.iOSMobile;
    case 4:
      return DeviceType.iOSTablet;
    case 5:
      return DeviceType.windows;
    case 6:
      return DeviceType.macOS;
    case 7:
      return DeviceType.linux;
    default:
      throw 'Invalid DeviceType.id: $pId';
  }
}

// Retorna l'estat d'un dispositu a partir d'un dynamic.
DeviceType dyn2DeviceType(dynamic pType) {
  switch (pType) {
    case DeviceType type:
      return type;
    case int value:
      return deviceTypeById(value);
    default:
      throw errorUnknownType(
          "DeviceType.set", fldDeviceType, pType.runtimeType);
  }
}

extension DeviceStateIdx on DeviceState {
  // Retorna l'Id de l'estat d'un dispositiu.
  int get id {
    switch (this) {
      case DeviceState.unspecified:
        return 0;
      case DeviceState.enabled:
        return 1;
      case DeviceState.disabled:
        return 2;
      default:
        throw 'Invalid DeviceState.${toString()}';
    }
  }
}

// Retorna l'estat d'un dispositiu d'usuari a partir del seu Id.
DeviceState deviceStateById(int pId) {
  switch (pId) {
    case 0:
      return DeviceState.unspecified;
    case 1:
      return DeviceState.enabled;
    case 2:
      return DeviceState.disabled;
    default:
      throw 'Invalid DeviceState.id: $pId';
  }
}

// Retorn l'estat d'un dispositiu d'usuari a partir d'un dynamic.
DeviceState dyn2DeviceState(dynamic pState) {
  switch (pState) {
    case DeviceState type:
      return type;
    case int value:
      return deviceStateById(value);
    default:
      throw errorUnknownType(
          "DeviceState.set", fldDeviceState, pState.runtimeType);
  }
}
