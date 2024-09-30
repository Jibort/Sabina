// Representació d'una entrada en el DsmV.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters, prefer_final_fields

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/a_user/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Enumeració dels estats d'un registre de pacient.
enum RegisterState {
  unspecified,
  assigned,
  statical,
  cancelled,
}

// Representació d'una entrada en el DsmV.
class RegRegister extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  TckTracking? _tracking;
  UsrUser? _patient;
  DateTime? _firstDate;
  DateTime? _lastDate;
  RegisterState _state = RegisterState.unspecified;

  // CONSTRUCTORS ---------------------
  RegRegister(
      {required super.pLocalId,
      required super.pId,
      required super.pCreatedBy,
      required super.pCreatedAt,
      required super.pUpdatedBy,
      required super.pUpdatedAt,
      super.pIsNew,
      super.pIsUpdated,
      super.pIsDeleted,
      TckTracking? pTracking,
      UsrUser? pPatient,
      DateTime? pFirstDate,
      DateTime? pLastDate,
      RegisterState pState = RegisterState.unspecified}) {
    _tracking = pTracking;
    _patient = pPatient;
    _firstDate = pFirstDate;
    _lastDate = pLastDate;
    _state = pState;
  }

  RegRegister.empty()
      : this(pLocalId: null,
            pId: null,
            pCreatedBy: null,
            pCreatedAt: null,
            pUpdatedBy: null,
            pUpdatedAt: null,
            pIsNew: true,
            pIsUpdated: false,
            pIsDeleted: false,
            pTracking: null,
            pPatient: null,
            pFirstDate: null,
            pLastDate: null,
            pState: RegisterState.unspecified);

  RegRegister.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _tracking = pMap[fldTracking];
    _patient = pMap[fldPatient];
    _firstDate = pMap[fldFirstDate];
    _lastDate = pMap[fldLastDate];
    _state = pMap[fldRegisterState];
  }

  RegRegister.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(RegRegister, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _firstDate = dTimeFromSql(pMap[fldFirstDate]);
    _lastDate = dTimeFromSql(pMap[fldLastDate]);
    _state = pMap[fldRegisterState];

    // Carreguem el tracking.
    Future<Exception?> stTracking(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _tracking = await dbs.byKey(pCtrl, TckTracking, pKey: pArgs.first);

        // Carreguem el pacient.
        Future<Exception?> stPatient(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _patient = await dbs.byKey(pCtrl, UsrUser, pKey: pArgs.first);

            // Carrega createdBy i updatedBy.
            super.completeStandard(pCtrl, pMap);
          } on Exception catch (pExc) {
            exc = pExc;
          }
          return exc;
        }

        pCtrl.state.sneakFn(stPatient, pArgs: [pMap[fldPatient]]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stTracking, pArgs: [pMap[fldTracking]]);
  }

  // GETTERS i SETTERS ----------------
  TckTracking? get tracking => _tracking;
  void setTracking(TckTracking? pTracking) {
    if (isNull(pTracking)) {
      throw errorFieldNotNullable("$enRegRegister.set", fldTracking);
    }
    var old = _tracking;
    _tracking = pTracking;
    super.isUpdated = (!super.isNew) && (old != _tracking);
  }

  UsrUser? get patient => _patient;
  void setPatient(UsrUser? pPatient) {
    if (isNull(pPatient)) {
      throw errorFieldNotNullable("$enRegRegister.set", fldPatient);
    }
    var old = _patient;
    _patient = pPatient;
    super.isUpdated = (!super.isNew) && (old != _patient);
  }

  DateTime? get firstDate => _firstDate;
  void setFirstDate(DateTime? pFirstDate) {
    var old = _firstDate;
    _firstDate = pFirstDate;
    super.isUpdated = (!super.isNew) && (old != _firstDate);
  }

  DateTime? get lastDate => _lastDate;
  void setLastDate(DateTime? pLastDate) {
    var old = _lastDate;
    _lastDate = pLastDate;
    super.isUpdated = (!super.isNew) && (old != _lastDate);
  }

  RegisterState get state => _state;
  void setState(RegisterState pState) {
    var old = _state;
    _state = pState;
    super.isUpdated = (!super.isNew) && (old != _state);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldTracking: _tracking,
      fldPatient: _patient,
      fldFirstDate: _firstDate,
      fldLastDate: _lastDate,
      fldRegisterState: _state,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldTracking: _tracking!.id,
      fldPatient: _patient!.id,
      fldFirstDate: dTimeToSql(_firstDate),
      fldLastDate: dTimeToSql(_lastDate),
      fldRegisterState: _state.id,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [fldTracking, fldPatient, fldFirstDate, fldLastDate, fldRegisterState];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnRegRegister (
      $standardHeader,
      
      $fldTracking      $dbtIntNotNull REFERENCES $tnTckTracking($fldId),
      $fldPatient       $dbtIntNotNull REFERENCES $tnUsrUser($fldId),
      $fldFirstDate     $dbtDateTime,
      $fldLastDate      $dbtDateTime,
      $fldRegisterState $dbtIntNotNull DEFAULT 0
      );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldTracking, $fldPatient,
           $fldFirstDate, $fldLastDate,
          $fldRegisterState
    FROM   $tnRegRegister
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnRegRegister
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnRegRegister (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldTracking, $fldPatient, $fldFirstDate,
      $fldLastDate, $fldRegisterState)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?,  ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnRegRegister
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldTracking = ?,
        $fldPatient = ?,
        $fldFirstDate = ?,
        $fldLastDate = ?,
        $fldRegisterState = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_tracking) &&
        isNotNull(_patient) &&
        isNotNull(_state));
  }
}

extension RegisterStateIdx on RegisterState {
  // Retorna l'Id de l'estat d'un registre de pacient.
  int get id {
    switch (this) {
      case RegisterState.unspecified:
        return 0;
      case RegisterState.assigned:
        return 1;
      case RegisterState.statical:
        return 2;
      case RegisterState.cancelled:
        return 3;
      default:
        throw 'Invalid RegisterState.${toString()}';
    }
  }
}

// Retorna l'estat d'un registre de pacient.
RegisterState deviceStateById(int pId) {
  switch (pId) {
    case 0:
      return RegisterState.unspecified;
    case 1:
      return RegisterState.assigned;
    case 2:
      return RegisterState.statical;
    case 3:
      return RegisterState.cancelled;
    default:
      throw 'Invalid RegisterState.id: $pId';
  }
}

// Retorn l'estat d'un dispositiu d'usuari a partir d'un dynamic.
RegisterState dyn2RegisterState(dynamic pState) {
  switch (pState) {
    case RegisterState type:
      return type;
    case int value:
      return deviceStateById(value);
    default:
      throw errorUnknownType("RegisterState.set", fldRegisterState, pState.runtimeType);
  }
}
