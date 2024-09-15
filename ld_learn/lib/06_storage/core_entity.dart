// Representació del nucli d'una entitat de dades.
// @createdAt: 2024-06-22 ds: JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/database_service.dart';
import 'package:ld_learn/09_tools/index.dart';
import 'package:ld_learn/08_model/a_user/index.dart';

// enum CoreEntityType {
//   both,
//   none,
//   created,
//   updated,
// }

// Representació del nucli d'una entitat de dades.
class CoreEntity {
  // MEMBERS --------------------------
  late int? _localId;
  // late EntityKey? _key;
  late int? _id;
  late UsrUser? _createdBy;
  late DateTime? _createdAt;
  late UsrUser? __updatedBy;
  late DateTime? __updatedAt;

  late bool _isNew;
  late bool _isUpdated;
  late bool _isDeleted;

  // BUILDERS -------------------------
  CoreEntity(
      {required int? pLocalKey,
      // required EntityKey? pKey,
      required int? pId,
      required UsrUser? pCreatedBy,
      required DateTime? pCreatedAt,
      required UsrUser? pUpdatedBy,
      required DateTime? pUpdatedAt,
      bool pIsNew = true,
      bool pIsUpdated = false,
      bool pIsDeleted = false}) {
    _localId = pLocalKey;
    // _key = pKey;
    _id = pId;
    _createdBy = pCreatedBy;
    _createdAt = pCreatedAt;
    __updatedBy = pUpdatedBy;
    __updatedAt = pUpdatedAt;

    _isNew = pIsNew;
    _isUpdated = pIsUpdated;
    _isDeleted = pIsDeleted;
  }

  CoreEntity.empty() {
    _localId = null;
    // _key = null;
    _id = null;
    _createdBy = null;
    _createdAt = null;
    __updatedBy = null;
    __updatedAt = null;

    _isNew = true;
    _isUpdated = false;
    _isDeleted = false;
  }

  CoreEntity.byMap(Map<String, dynamic> pMap) {
    // _key = pMap[fldEntityKey] as EntityKey?;
    _localId = pMap[fldIdLocal];
    _id = pMap[fldId];
    _createdBy = pMap[fldCreatedBy];
    _createdAt = dTimeFromSql(pMap[fldCreatedAt]);
    __updatedBy = pMap[fldCreatedBy];
    __updatedAt = dTimeFromSql(pMap[fldUpdatedAt]);
    _isNew = pMap[fldIsNew] ?? false;
    _isUpdated = pMap[fldIsUpdated] ?? false;
    _isDeleted = pMap[fldIsDeleted] ?? false;
  }

  CoreEntity.bySqlMap(Type pType, Map<String, dynamic> pMap) {
    _id = pMap[fldId];
    _localId = pMap[fldIdLocal];
    _createdAt = dTimeFromSql(pMap[fldCreatedAt]);
    __updatedAt = dTimeFromSql(pMap[fldUpdatedAt]);
    _isNew = pMap[fldIsNew] ?? false;
    _isUpdated = pMap[fldIsUpdated] ?? false;
    _isDeleted = pMap[fldIsDeleted] ?? false;
  }

  // GETTERS i SETTERS ------------------
  Future<Exception?> completeStandard(
      BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap) async {
    Exception? exc;

    // Obtenim createdBy i UpdatedBy.
    try {
      Future<Exception?> stCreatedBy(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
        String? fkId;
        try {
          fkId = pArgs.first;
          createdBy =
              (isNotNull(fkId)) ? await DatabaseService.to.byKey(pCtrl, UsrUser, pKey: fkId) : null;

          Future<Exception?> stUpdatedBy(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
            String? fkId;
            try {
              fkId = pArgs.first;
              updatedBy = await DatabaseService.to.byKey(pCtrl, UsrUser, pKey: fkId);
            } on Exception catch (pExc) {
              exc = pExc;
            }
            return null;
          }

          pCtrl.state.sneakFn(stUpdatedBy, pArgs: [pMap[fldUpdatedBy]]);
        } on Exception catch (pExc) {
          exc = pExc;
        }
        return exc;
      }

      pCtrl.state.sneakFn(stCreatedBy, pArgs: [pMap[fldCreatedBy]]);
    } on Exception catch (pExc) {
      exc = pExc;
    }
    return exc;
  }

  // Keys...
  int? get localId => _localId;
  set localId(int? pLocalId) => (isNull(pLocalId))
      ? _localId = pLocalId
      : throw errorEntityNullKey("CoreEntity.set localId", "EntityName");

  int? get id => _id;
  set id(int? pId) => (_id = pId);

  UsrUser? get createdBy => _createdBy;
  set createdBy(UsrUser? pCreatedBy) {
    if (isNull(pCreatedBy)) {
      errorFieldNotNullable("CoreEntity.set.createdBy", "createdBy");
    }
    _createdBy = pCreatedBy;
    _isUpdated = !_isNew;
  }

  // CreatedAt...
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? pCreatedAt) {
    (isNull(pCreatedAt))
        ? () {
            _createdAt = pCreatedAt;
            _isUpdated = !_isNew;
          }()
        : errorFieldNotNullable("CoreEntity.set.createdAt", "createdAt");
  }

  // UpdatedBy...
  UsrUser? get updatedBy => __updatedBy;
  set updatedBy(UsrUser? pUpdatedBy) {
    __updatedBy = pUpdatedBy;
    _isUpdated = !_isNew;
  }

  // UpdatedAt...
  DateTime? get updatedAt => __updatedAt;
  set updatedAt(DateTime? pUpdatedAt) {
    __updatedAt = pUpdatedAt;
    _isUpdated = !_isNew;
  }

  // IsNew...
  bool get isNew => _isNew;
  set isNew(bool pNew) {
    _isNew = pNew;
    if (_isNew) {
      _isUpdated = false;
      _isDeleted = false;
    }
  }

  // IsUpdated...
  bool get isUpdated => _isUpdated;
  set isUpdated(bool pUpdated) {
    _isUpdated = pUpdated;
    if (_isUpdated) {
      _isNew = false;
      _isDeleted = false;
    }
  }

  // IsDeleted...
  bool get isDeleted => _isDeleted;
  set isDeleted(bool pDeleted) {
    _isDeleted = pDeleted;
    if (_isDeleted) {
      _isNew = false;
      _isUpdated = false;
    }
  }

  // Conversions de claus -------------
  // String buildKeyStr() {
  //   return (isNotNull(_key)) ? _key!.asStr() ?? "_" : '_';
  // }

  String buildServerIdStr() {
    return (isNotNull(_id)) ? ":$_id:" : "0";
  }

  String buildLocalIdStr() {
    return (isNotNull(_localId)) ? ":$_localId:" : "0";
  }

  // CONVERSIONS TO MAP ---------------
  Map<String, dynamic> toMap() => {
        fldId: _id,
        fldIdLocal: _localId,
        fldCreatedBy: _createdBy,
        fldCreatedAt: _createdAt,
        fldUpdatedBy: __updatedBy,
        fldUpdatedAt: __updatedAt,
      };

  Map<String, dynamic> toSQLMap() => {
        fldId: _id,
        fldIdLocal: _localId,
        fldCreatedBy: (isNotNull(_createdBy))
            ? _createdBy!.core.id
            : throw 'CoreEntity.toSQLMap(): _createdBy is null.',
        fldCreatedAt: dTimeToSql(_createdAt),
        fldUpdatedBy: (isNotNull(__updatedBy)) ? __updatedBy!.core.id : null,
        fldUpdatedAt: dTimeToSql(__updatedAt),
      };

  // Comandes SQL ---------------------
  static String stmtInsertFields() {
    return '''
      $fldId,
      $fldCreatedBy,
      $fldCreatedAt,
      $fldUpdatedBy,
      $fldCreatedAt
    ''';
  }

  String stmtUpdate(String pEntityName) {
    if (isNull(createdBy)) {
      throw dereferenceNullField("$pEntityName.get.stmtUpdate", "createdBy");
    }
    if (isNull(createdAt)) {
      throw dereferenceNullField("$pEntityName.get.stmtUpdate", "createdAt");
    }

    return '''
      $fldId        = $id,
      $fldCreatedBy = $createdBy,
      $fldCreatedAt = ${dTimeToSql(createdAt)},
      $fldUpdatedBy = $updatedBy,
      $fldUpdatedAt =${dTimeToSql(updatedAt)},
    ''';
  }
}

// // Extensió per a l'enumeració CoreEntityType.
// extension CoreEntityTypeId on CoreEntityType {
//   // Retorna l'Id del tipus de CoreEntity.
//   int get id {
//     switch (this) {
//       case CoreEntityType.both:
//         return 0;
//       case CoreEntityType.none:
//         return 1;
//       case CoreEntityType.created:
//         return 2;
//       case CoreEntityType.updated:
//         return 3;
//       default:
//         throw 'Invalid CoreEntityType.${toString()}';
//     }
//   }
// }

// // Retorna el tipus de CoreEntity a partir del seu Id.
// CoreEntityType coreEntityById(int pId) {
//   switch (pId) {
//     case 0:
//       return CoreEntityType.both;
//     case 1:
//       return CoreEntityType.none;
//     case 2:
//       return CoreEntityType.created;
//     case 3:
//       return CoreEntityType.updated;
//     default:
//       throw 'Invalid CoreEntityType.id: $pId';
//   }
// }

// Retorna el tipus de CoreEntity a partir del tipus d'entitat.
// CoreEntityType coreEntityByType(Type pType) {
//   switch (pType) {
//     // CoreEntityType.none
//     // -------------------
//     // USRMOD
//     case UsrUser _:
//     case UsrDevice _:
//     case UsrFcmHistory _:

//     // LSTMOD
//     case LstListCategory _:
//     case LstOptionList _:
//     case LstOptionEntry _:

//     // DISMOD
//     case DisDisease _:
//     case DisPhase _:
//     case DisGoal _:

//     // RSCMOD
//     case RscResource _:
//     case RscPhaseResource _:

//     // TCKMOD
//     case TckTracking _:
//     case TckTrackingColumn _:
//     case TckPhaseTracking _:

//     // TSTMOD
//     case TstTestCategory _:
//     case TstTest _:
//     case TstQuestion _:

//     // EMOMOD
//     case EmoEmotion _:
//     case EmoMood _:

//     // DGNMOD
//     case DgnDiagnosis _:
//     case DgnDiagnosisPhase _:
//     case DgnAchievement _:

//     // MATMOD
//     case MatMaterial _:
//     case MatPhaseMaterial _:

//     // REGMOD
//     case RegRegister _:
//     case RegRegisterColumn _:

//     // RESMOD
//     case ResPatientTest _:
//     case ResAnswer _:

//     // TSKMOD
//     case TskTask _:

//     // ViSMOD
//     case VisVisit _:

//     // NTFMOD
//     case NtfNotification _:
//       return CoreEntityType.both;

//     // CoreEntityType.none
//     // -------------------
//     // DISMOD
//     case DisDsmV _:

//     // LOCMOD
//     case LocTranslation _:
//       return CoreEntityType.none;

//     default:
//       throw errorNoModelEntityType("CoreEntity.coreEntityByType", pType);
//   }
// }
