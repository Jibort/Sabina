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
enum TaskType {
  unspecified,
  test,
  register,
  resource,
  custom,
}

// Enumeració dels estats d'una tasca.
enum TaskState {
  unspecified,
  assigned,
  finished,
  statical,
}

// Representació d'una entrada en el DsmV.
class TskTask extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  UsrUser? _therapist;
  UsrUser? _patient;
  TaskType _type = TaskType.unspecified;
  TaskState _state = TaskState.unspecified;
  String? _descKey;
  String? _desc;
  TstTest? _test;
  RegRegister? _register;
  RscResource? _resource;
  DateTime? _startDate;
  DateTime? _endDate;

  // CONSTRUCTORS ---------------------
  TskTask({
    required super.pLocalId,
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
    TaskType pTaskType = TaskType.unspecified,
    TaskState pTaskState = TaskState.unspecified,
    String? pDescKey,
    String? pDesc,
    TstTest? pTest,
    RegRegister? pRegister,
    RscResource? pResource,
    DateTime? pStartDate,
    DateTime? pEndDate,
  }) {
    _therapist = pTherapist;
    _patient = pPatient;
    _type = pTaskType;
    _state = pTaskState;
    _descKey = pDescKey;
    _desc = pDesc;
    _test = pTest;
    _register = pRegister;
    _resource = pResource;
    _startDate = pStartDate;
    _endDate = pEndDate;
  }

  TskTask.empty()
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
          pTaskType: TaskType.unspecified,
          pTaskState: TaskState.unspecified,
          pDescKey: null,
          pDesc: null,
          pTest: null,
          pRegister: null,
          pResource: null,
          pStartDate: null,
          pEndDate: null,
        );

  TskTask.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _therapist = pMap[fldTherapist];
    _patient = pMap[fldPatient];
    _type = pMap[fldTaskType];
    _state = pMap[fldTaskState];
    _descKey = pMap[fldDescKey];
    _desc = pMap[fldDesc];
    _test = pMap[fldTest];
    _register = pMap[fldRegister];
    _resource = pMap[fldResource];
    _startDate = pMap[fldStartDate];
    _endDate = pMap[fldEndDate];
  }

  TskTask.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(TskTask, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _type = dyn2TaskType(pMap[fldTaskType]);
    _state = dyn2TaskState(pMap[fldTaskState]);
    _startDate = dTimeFromSql(pMap[fldStartDate]);
    _endDate = dTimeFromSql(pMap[fldEndDate]);

    // Traduïm el desc key.
    Future<Exception?> stDesc(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _descKey = pArgs.first;
        _desc = await dbs.trans(pCtrl, pTKey: _descKey);

        // Carreguem el terapeuta.
        Future<Exception?> stTherapist(
            FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _patient = await dbs.byKey(pCtrl, UsrUser, pKey: pArgs.first);

            // Carreguem el pacient.
            Future<Exception?> stPatient(
                FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _patient = await dbs.byKey(pCtrl, UsrUser, pKey: pArgs.first);

                // Carreguem el test.
                Future<Exception?> stTest(
                    FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                  try {
                    _test = await dbs.byKey(pCtrl, TstTest, pKey: pArgs.first);

                    // Carreguem el registre, si existeix.
                    Future<Exception?> stRegister(
                        FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                      try {
                        _resource = await dbs.byKey(pCtrl, RscResource,
                            pKey: pArgs.first);

                        // Carreguem el resource, si existeix.
                        Future<Exception?> stResource(
                            FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                          try {
                            _resource = await dbs.byKey(pCtrl, RscResource,
                                pKey: pArgs.first);

                            // Carrega createdBy i updatedBy.
                            super.completeStandard(pCtrl, pMap);
                          } on Exception catch (pExc) {
                            exc = pExc;
                          }
                          return exc;
                        }

                        pCtrl.state
                            .sneakFn(stResource, pArgs: [pMap[fldResource]]);
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

            pCtrl.state.sneakFn(stPatient, pArgs: [pMap[fldPatient]]);
          } on Exception catch (pExc) {
            exc = pExc;
          }
          return exc;
        }

        pCtrl.state.sneakFn(stTherapist, pArgs: [pMap[fldTherapist]]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stDesc, pArgs: [pMap[fldDescKey]]);
  }

  // GETTERS i SETTERS ----------------
  UsrUser? get therapist => _therapist;
  set therapist(UsrUser? pTherapist) {
    if (isNull(pTherapist)) {
      throw errorFieldNotNullable("$enTskTask.set", fldTherapist);
    }
    var old = _therapist;
    _therapist = pTherapist;
    super.isUpdated = (!super.isNew) && (old != _therapist);
  }

  UsrUser? get patient => _patient;
  void setPatient(UsrUser? pPatient) {
    if (isNull(pPatient)) {
      throw errorFieldNotNullable("$enTskTask.set", fldPatient);
    }
    var old = _patient;
    _patient = pPatient;
    super.isUpdated = (!super.isNew) && (old != _patient);
  }

  TaskType get taskType => _type;
  set taskType(TaskType pType) {
    var old = _type;
    _type = pType;
    super.isUpdated = (!super.isNew) && (old != _type);
  }

  TaskState get taskState => _state;
  set taskState(TaskState pState) {
    var old = _state;
    _state = pState;
    super.isUpdated = (!super.isNew) && (old != _state);
  }

  String? get descKey => _descKey;
  String? get desc => _desc;
  void setDesc(String? pKey, String? pDesc) {
    if (isNull(pKey) && isNull(pDesc)) {
      throw errorFieldNotNullable("$enTskTask.set", fldDesc);
    }
    var oldKey = _descKey;
    _descKey = pKey;
    _desc = pDesc;
    super.isUpdated = (!super.isNew) && (oldKey != _descKey);
  }

  TstTest? get test => _test;
  void setTest(TstTest? pTest) {
    if (isNull(pTest)) {
      throw errorFieldNotNullable("$enTskTask.set", fldTest);
    }
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

  DateTime? get startDate => _startDate;
  void setStartDate(DateTime? pStartDate) {
    var old = _startDate;
    _startDate = pStartDate;
    super.isUpdated = (!super.isNew) && (old != _startDate);
  }

  DateTime? get endDate => _endDate;
  void setEndDate(DateTime? pEndDate) {
    var old = _endDate;
    _endDate = pEndDate;
    super.isUpdated = (!super.isNew) && (old != _endDate);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldTherapist: _therapist,
      fldPatient: _patient,
      fldTaskType: _type,
      fldTaskState: _state,
      fldDescKey: _descKey,
      fldDesc: _desc,
      fldTest: _test,
      fldRegister: _register,
      fldResource: _resource,
      fldStartDate: _startDate,
      fldEndDate: _endDate,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldTherapist: _therapist!.id,
      fldPatient: _patient!.id,
      fldTaskType: _type.id,
      fldTaskState: _state.id,
      fldDescKey: _descKey,
      fldTest: _test?.id,
      fldRegister: _register?.id,
      fldResource: _resource?.id,
      fldStartDate: dTimeToSql(_startDate),
      fldEndDate: dTimeToSql(_endDate),
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldTherapist,
        fldPatient,
        fldTaskType,
        fldTaskState,
        fldDescKey,
        fldTest,
        fldRegister,
        fldResource,
        fldStartDate,
        fldEndDate,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnTskTask (
      $standardHeader,
      
      $fldTherapist $dbtIntNotNull REFERENCES $tnUsrUser($fldId),
      $fldPatient   $dbtIntNotNull REFERENCES $tnUsrUser($fldId),
      $fldTaskType  $dbtIntNotNull DEFAULT 0,
      $fldTaskState $dbtIntNotNull DEFAULT 0,
      $fldDescKey   $dbtTextNotNull,
      $fldTest      $dbtIntNotNull REFERENCES $tnTstTest($fldId),
      $fldRegister  $dbtIntNotNull REFERENCES $tnRegRegister($fldId),
      $fldResource  $dbtIntNotNull REFERENCES $tnRscResource($fldId),
      $fldStartDate $dbtDateTime,
      $fldEndDate   $dbtDateTime
      );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldTherapist,
           $fldPatient,
           $fldTaskType,
           $fldTaskState,
           $fldDescKey,
           $fldTest,
           $fldRegister,
           $fldResource,
           $fldStartDate,
           $fldEndDate
    FROM   $tnTskTask
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnTskTask
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnTskTask (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldTherapist, $fldPatient, $fldTaskType, $fldTaskState,
      $fldDescKey, $fldTest, $fldRegister,
      $fldResource, $fldStartDate, $fldEndDate)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?, ?,   ?, ?, ?,   ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnTskTask
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldTherapist = ?,
        $fldPatient = ?,
        $fldTaskType = ?,
        $fldTaskState = ?,
        $fldDescKey = ?,
        $fldTest = ?,
        $fldRegister = ?,
        $fldResource = ?,
        $fldStartDate = ?,
        $fldEndDate = ?
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
        isNotNull(_descKey) &&
        isNotNull(_desc));
  }
}

// EXTENSIONS =========================
extension TaskTypeIdx on TaskType {
  // Retorna l'Id del tipus de tasca.
  int get id {
    switch (this) {
      case TaskType.unspecified:
        return 0;
      case TaskType.test:
        return 1;
      case TaskType.register:
        return 2;
      case TaskType.resource:
        return 3;
      case TaskType.custom:
        return 4;
    }
  }
}

// Retorna el tipus de tasca.
TaskType taskTypeById(int pId) {
  switch (pId) {
    case 0:
      return TaskType.unspecified;
    case 1:
      return TaskType.test;
    case 2:
      return TaskType.register;
    case 3:
      return TaskType.resource;
    case 4:
      return TaskType.custom;
    default:
      throw 'Invalid TaskType.id: $pId';
  }
}

// Retorna el tipus d'una tasca.
TaskType dyn2TaskType(dynamic pType) {
  switch (pType) {
    case TaskType type:
      return type;
    case int value:
      return taskTypeById(value);
    default:
      throw errorUnknownType("TaskType.set", fldTaskType, pType.runtimeType);
  }
}

extension TaskStateIdx on TaskState {
  // Retorna l'Id de l'estat d'una tasca.
  int get id {
    switch (this) {
      case TaskState.unspecified:
        return 0;
      case TaskState.assigned:
        return 1;
      case TaskState.finished:
        return 2;
      case TaskState.statical:
        return 3;
      default:
        throw 'Invalid TaskState.${toString()}';
    }
  }
}

// Retorna l'estat d'una tasca.
TaskState taskStateById(int pId) {
  switch (pId) {
    case 0:
      return TaskState.unspecified;
    case 1:
      return TaskState.assigned;
    case 2:
      return TaskState.finished;
    case 3:
      return TaskState.statical;
    default:
      throw 'Invalid TaskState.id: $pId';
  }
}

// Retorn l'estat d'una tasca a partir d'un dynamic.
TaskState dyn2TaskState(dynamic pState) {
  switch (pState) {
    case TaskState type:
      return type;
    case int value:
      return taskStateById(value);
    default:
      throw errorUnknownType("TaskState.set", fldTaskState, pState.runtimeType);
  }
}
