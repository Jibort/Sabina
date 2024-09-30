// Representació d'una entrada en el DsmV.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters, prefer_final_fields

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/a_user/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Enumeració dels tipus de tasca.
enum VisitType {
  unspecified,
  face2face,
  online,
}

// Enumeració dels estats d'una tasca.
enum VisitState {
  unspecified,
  stablished,
  finnished,
  cancelled,
  nulled,
}

// Representació d'una entrada en el DsmV.
class VisVisit extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  UsrUser? _therapist;
  UsrUser? _patient;
  bool _isFirst = false;
  DateTime? _dateTime;
  VisitType _type = VisitType.unspecified;
  VisitState _state = VisitState.unspecified;

  // CONSTRUCTORS ---------------------
  VisVisit(
      {required super.pLocalId,
    required super.pId,
    required super.pCreatedBy,
    required super.pCreatedAt,
    required super.pUpdatedBy,
    required super.pUpdatedAt,
    super.pIsNew,
    super.pIsUpdated,
    super.pIsDeleted,
      UsrUser? pTherapist,
      UsrUser? pPatient,
      bool pIsFirst = false,
      DateTime? pDateTime,
      VisitType pType = VisitType.unspecified,
      VisitState pState = VisitState.unspecified});

  VisVisit.empty()
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
            pTherapist: null,
            pPatient: null,
            pIsFirst: false,
            pDateTime: null,
            pType: VisitType.unspecified,
            pState: VisitState.unspecified);

  VisVisit.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _therapist = pMap[fldTherapist];
    _patient = pMap[fldPatient];
    _isFirst = pMap[fldIsFirst];
    _dateTime = pMap[fldDateTime];
    _type = pMap[fldVisitType];
    _state = pMap[fldVisitState];
  }

  VisVisit.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(VisVisit, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _isFirst = (pMap[fldIsFirst] == 1);
    _dateTime = dTimeFromSql(pMap[fldDateTime]);
    _type = dyn2VisitType(pMap[fldVisitType]);
    _state = dyn2VisitState(pMap[fldVisitState]);

    // Carreguem el terapeuta.
    Future<Exception?> stTherapist(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _patient = await dbs.byKey(pCtrl, UsrUser, pKey: pArgs.first);

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

    pCtrl.state.sneakFn(stTherapist, pArgs: [pMap[fldTherapist]]);
  }

  // GETTERS i SETTERS ----------------
  UsrUser? get therapist => _therapist;
  void setTherapist(UsrUser? pTherapist) {
    if (isNull(pTherapist)) {
      throw errorFieldNotNullable("$enVisVisit.set", fldTherapist);
    }
    var old = _therapist;
    _therapist = pTherapist;
    super.isUpdated = (!super.isNew) && (old != _therapist);
  }

  UsrUser? get patient => _patient;
  void setPatient(UsrUser? pPatient) {
    if (isNull(pPatient)) {
      throw errorFieldNotNullable("$enVisVisit.set", fldPatient);
    }
    var old = _patient;
    _patient = pPatient;
    super.isUpdated = (!super.isNew) && (old != _patient);
  }

  bool get isFirst => _isFirst;
  void setIsFirst(bool pIsFirst) {
    var old = _isFirst;
    _isFirst = pIsFirst;
    super.isUpdated = (!super.isNew) && (old != _isFirst);
  }

  DateTime? get dateTime => _dateTime;
  void setDateTime(DateTime? pDateTime) {
    if (isNull(pDateTime)) {
      throw errorFieldNotNullable("$enVisVisit.set", fldDateTime);
    }
    var old = _dateTime;
    _dateTime = pDateTime;
    super.isUpdated = (!super.isNew) && (old != _dateTime);
  }

  VisitType get visitType => _type;
  void setVisitType(VisitType pType) {
    if (isNull(pType)) {
      throw errorFieldNotNullable("$enVisVisit.set", fldVisitType);
    }
    var old = _type;
    _type = pType;
    super.isUpdated = (!super.isNew) && (old != _type);
  }

  VisitState get visitState => _state;
  void setVisitState(VisitState pState) {
    if (isNull(pState)) {
      throw errorFieldNotNullable("$enVisVisit.set", fldVisitState);
    }
    var old = _state;
    _state = pState;
    super.isUpdated = (!super.isNew) && (old != _state);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldTherapist: _therapist,
      fldPatient: _patient,
      fldIsFirst: _isFirst,
      fldDateTime: _dateTime,
      fldVisitType: _type,
      fldVisitState: _state,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldTherapist: _therapist!.id,
      fldPatient: _patient!.id,
      fldIsFirst: (_isFirst ? 1 : 0),
      fldDateTime: dTimeToSql(_dateTime),
      fldVisitType: _type.id,
      fldVisitState: _state.id,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldTherapist,
        fldPatient,
        fldIsFirst,
        fldDateTime,
        fldVisitType,
        fldVisitState,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnVisVisit (
      $standardHeader,
      
      $fldTherapist  $dbtIntNotNull REFERENCES $tnUsrUser($fldId),
      $fldPatient    $dbtIntNotNull REFERENCES $tnUsrUser($fldId),
      $fldIsFirst    $dbtBooleanNotNull DEAFALUT 0,
      $fldDateTime   $dbtDateTimeNotNull,
      $fldVisitType  $dbtIntNotNull DEFAULT 0,
      $fldVisitState $dbtIntNotNull DEFAULT 0
    );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldTherapist, $fldPatient, $fldIsFirst,
           $fldDateTime, $fldVisitType, $fldVisitState
    FROM   $tnVisVisit
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnVisVisit
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnVisVisit (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldTherapist, $fldPatient, $fldIsFirst,
      $fldDateTime, $fldVisitType, $fldVisitState)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?,   ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnVisVisit
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldTherapist = ?,
        $fldPatient = ?,
        $fldIsFirst = ?,
        $fldDateTime = ?,
        $fldVisitType = ?,
        $fldVisitState = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_therapist) &&
        isNotNull(_patient) &&
        isNotNull(_type) &&
        isNotNull(_state) &&
        isNotNull(_dateTime));
  }
}

// EXTENSIONS =========================
extension VisitTypeIdx on VisitType {
  // Retorna l'Id del tipus de tasca.
  int get id {
    switch (this) {
      case VisitType.unspecified:
        return 0;
      case VisitType.face2face:
        return 1;
      case VisitType.online:
        return 2;
    }
  }
}

// Retorna el tipus de tasca.
VisitType visitTypeById(int pId) {
  switch (pId) {
    case 0:
      return VisitType.unspecified;
    case 1:
      return VisitType.face2face;
    case 2:
      return VisitType.online;
    default:
      throw 'Invalid VisitType.id: $pId';
  }
}

// Retorna el tipus d'una tasca.
VisitType dyn2VisitType(dynamic pType) {
  switch (pType) {
    case VisitType type:
      return type;
    case int value:
      return visitTypeById(value);
    default:
      throw errorUnknownType("VisitType.set", fldVisitType, pType.runtimeType);
  }
}

extension VisitStateIdx on VisitState {
  // Retorna l'Id del tipus de tasca.
  int get id {
    switch (this) {
      case VisitState.unspecified:
        return 0;
      case VisitState.stablished:
        return 1;
      case VisitState.finnished:
        return 2;
      case VisitState.cancelled:
        return 3;
      case VisitState.nulled:
        return 4;
    }
  }
}

// Retorna el tipus de tasca.
VisitState visitStateById(int pId) {
  switch (pId) {
    case 0:
      return VisitState.unspecified;
    case 1:
      return VisitState.stablished;
    case 2:
      return VisitState.finnished;
    case 3:
      return VisitState.cancelled;
    case 4:
      return VisitState.nulled;
    default:
      throw 'Invalid VisitState.id: $pId';
  }
}

// Retorna el tipus d'una tasca.
VisitState dyn2VisitState(dynamic pType) {
  switch (pType) {
    case VisitState type:
      return type;
    case int value:
      return visitStateById(value);
    default:
      throw errorUnknownType("VisitState.set", fldVisitState, pType.runtimeType);
  }
}
