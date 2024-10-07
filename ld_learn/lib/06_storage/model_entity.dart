// Representació genèrica d'una entitat de dades.
// @createdAt: 2024-06-22 ds: JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/base_controller.dart';
import 'package:ld_learn/01_ui/widgets/deep_do.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/a_user/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/08_model/c_working/index.dart';
import 'package:ld_learn/08_model/d_administration/index.dart';
import 'package:ld_learn/08_model/e_localization/index.dart';
import 'package:ld_learn/09_tools/index.dart';

import 'package:ld_learn/05_proto/model_entity.pb.dart' as $pb_me;

enum  EntityKeyType {
  unknown,
  standard,
  stringA,
  stringAB,
}

// Classe abstracta 'ModelEntity'
abstract class ModelEntity {
  // MEMBERS --------------------------
  late int? __localId;
  late int? __id;
  late UsrUser? _createdBy;
  late DateTime? _createdAt;
  late UsrUser? __updatedBy;
  late DateTime? __updatedAt;

  late bool _isNew;
  late bool _isUpdated;
  late bool _isDeleted;

  // BUILDERS -------------------------
  ModelEntity({required int? pLocalId,
      required int? pId,
      required UsrUser? pCreatedBy,
      required DateTime? pCreatedAt,
      required UsrUser? pUpdatedBy,
      required DateTime? pUpdatedAt,
      bool pIsNew = true,
      bool pIsUpdated = false,
      bool pIsDeleted = false});

  ModelEntity.empty()
  : this(pLocalId: null,
      pId: null,
      pCreatedBy: null,
      pCreatedAt: null,
      pUpdatedBy: null,
      pUpdatedAt: null,
      pIsNew: true,
      pIsUpdated: false,
      pIsDeleted: false);

  ModelEntity.byMap(Map<String, dynamic> pMap) {
    __localId = pMap[fldIdLocal];
    __id = pMap[fldId];
    _createdBy = pMap[fldCreatedBy];
    _createdAt = dTimeFromSql(pMap[fldCreatedAt]);
    __updatedBy = pMap[fldCreatedBy];
    __updatedAt = dTimeFromSql(pMap[fldUpdatedAt]);
    _isNew = pMap[fldIsNew] ?? false;
    _isUpdated = pMap[fldIsUpdated] ?? false;
    _isDeleted = pMap[fldIsDeleted] ?? false;
  }

  ModelEntity.bySQLMap(Type pType, Map<String, dynamic> pMap) {
    __id = pMap[fldId];
    __localId = pMap[fldIdLocal];
    _createdAt = dTimeFromSql(pMap[fldCreatedAt]);
    __updatedAt = dTimeFromSql(pMap[fldUpdatedAt]);
    _isNew = pMap[fldIsNew] ?? false;
    _isUpdated = pMap[fldIsUpdated] ?? false;
    _isDeleted = pMap[fldIsDeleted] ?? false;
  }

  ModelEntity.byGRPC(Type pType, $pb_me.ModelEntity pGRPC) {
    __localId = pGRPC.localId;
    __id =  pGRPC.id;
    _createdAt = tStampToDTime(pGRPC.createdAt);
    __updatedAt =  tStampToDTime(pGRPC.updatedAt);
    _isNew = pGRPC.isNew;
    _isUpdated = pGRPC.isUpdated;
    _isDeleted = pGRPC.isDeleted;
  }

  static T? entityFromSqlMap<T extends ModelEntity>(
      BaseController<DeepDo> pCtrl, Type pType, Map<String, dynamic> pMap) {
    T? inst;

    switch (pType) {
      // USRMOD...
      case UsrUser _:
        inst = UsrUser.bySQLMap(pCtrl, pMap) as T?;
        break;
      case UsrDevice _:
        inst = UsrDevice.bySQLMap(pCtrl, pMap) as T?;
        break;
      case UsrFcmHistory _:
        inst = UsrFcmHistory.bySQLMap(pCtrl, pMap) as T?;
        break;

      // DISMOD...
      case DisDsmV _:
        inst = DisDsmV.bySQLMap(pCtrl, pMap) as T?;
        break;
      case DisDisease _:
        inst = DisDisease.bySQLMap(pCtrl, pMap) as T?;
        break;
      case DisPhase _:
        inst = DisPhase.bySQLMap(pCtrl, pMap) as T?;
        break;
      case DisGoal _:
        inst = DisGoal.bySQLMap(pCtrl, pMap) as T?;
        break;

      // EMOMOD...
      case EmoEmotion _:
        inst = EmoEmotion.bySQLMap(pCtrl, pMap) as T?;
        break;
      case EmoMood _:
        inst = EmoMood.bySQLMap(pCtrl, pMap) as T?;
        break;

      // RSCMOD...
      case RscResource _:
        inst = RscResource.bySQLMap(pCtrl, pMap) as T?;
        break;
      case RscPhaseResource _:
        inst = RscPhaseResource.bySQLMap(pCtrl, pMap) as T?;
        break;

      // TCKMOD...
      case TckTracking _:
        inst = TckTracking.bySQLMap(pCtrl, pMap) as T?;
        break;
      case TckPhaseTracking _:
        inst = TckPhaseTracking.bySQLMap(pCtrl, pMap) as T?;
        break;
      case TckTrackingColumn _:
        inst = TckTrackingColumn.bySQLMap(pCtrl, pMap) as T?;
        break;

      // TSTMOD...
      case TstTestCategory _:
        inst = TstTestCategory.bySQLMap(pCtrl, pMap) as T?;
        break;
      case TstTest _:
        inst = TstTest.bySQLMap(pCtrl, pMap) as T?;
        break;
      case TstQuestion _:
        inst = TstQuestion.bySQLMap(pCtrl, pMap) as T?;
        break;

      // DGNMOD...
      case DgnDiagnosis _:
        inst = DgnDiagnosis.bySQLMap(pCtrl, pMap) as T?;
        break;
      case DgnDiagnosisPhase _:
        inst = DgnDiagnosisPhase.bySQLMap(pCtrl, pMap) as T?;
        break;
      case DgnAchievement _:
        inst = DgnAchievement.bySQLMap(pCtrl, pMap) as T?;
        break;

      // MATMOD...
      case MatMaterial _:
        inst = MatMaterial.bySQLMap(pCtrl, pMap) as T?;
        break;
      case MatMaterialPhase _:
        inst = MatMaterialPhase.bySQLMap(pCtrl, pMap) as T?;
        break;

      // REGMOD...
      case RegRegister _:
        inst = RegRegister.bySQLMap(pCtrl, pMap) as T?;
        break;
      case RegRegisterColumn _:
        inst = RegRegisterColumn.bySQLMap(pCtrl, pMap) as T?;
        break;
        
      // RESMOD...
      case ResPatientTest _:
        inst = ResPatientTest.bySQLMap(pCtrl, pMap) as T?;
        break;
      case ResAnswer _:
        inst = ResAnswer.bySQLMap(pCtrl, pMap) as T?;
        break;
      
      // NTFMOD...
      case NtfNotification _:
        inst = NtfNotification.bySQLMap(pCtrl, pMap) as T?;
        break;

      // TSKMOD...
      case TskTask _:
        inst = TskTask.bySQLMap(pCtrl, pMap) as T?;
        break;

      // VISMOD...
      case VisVisit _:
        inst = VisVisit.bySQLMap(pCtrl, pMap) as T?;
        break;

      // LOCMOD...
      case LocTranslation _:
        inst = LocTranslation.bySQLMap(pCtrl, pMap) as T?;
        break;
      
      // LSTMOD...
      case LstListCategory _:
        inst = LstListCategory.bySQLMap(pCtrl, pMap) as T?;
        break;
      case LstOptionList _:
        inst = LstOptionList.bySQLMap(pCtrl, pMap) as T?;
        break;
      case LstOptionEntry _:
        inst = LstOptionEntry.bySQLMap(pCtrl, pMap) as T?;
        break;

      default:
        inst = null;
    }

    return inst;
  }

  // Carrega els camps compartits entre entitats.
  Future<Exception?> completeStandard(
      BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap) async {
    Exception? exc;

    // Carreguem createdBy.
    try {
      Future<Exception?> stCreatedBy(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
        try {
          _createdBy = await DatabaseService.to.byKey(pCtrl, UsrUser, pKey: pArgs.first);

          // Carreguem updatedBy.
          Future<Exception?> stUpdatedBy(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
            try {
              __updatedBy = await DatabaseService.to.byKey(pCtrl, UsrUser, pKey: pArgs.first);
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

  // GETTERS i SETTERS ------------------
  int? get localId => __localId;
  set localId(int? pLocalId) {
    if (isNull(pLocalId)) {
      throw errorFieldNotNullable("CoreEntity.set", fldIdLocal);
    }
    var old = __localId;
    __localId = pLocalId;
    isUpdated = !isNew && old != __localId;
  }

  int? get id => __id;
  set id(int? pId) {
    if (isNull(pId)) {
      throw errorFieldNotNullable("CoreEntity.set", fldId);
    }
    var old = __id;
    __id = pId;
    isUpdated = !isNew && old != __id;
  }

  UsrUser? get createdBy => _createdBy;
  set createdBy(UsrUser? pCreatedBy) {
    if (isNull(pCreatedBy)) {
      errorFieldNotNullable("CoreEntity.set", fldCreatedBy);
    }
    var old = _createdBy;
    _createdBy = pCreatedBy;
    _isUpdated = !_isNew && old != _createdBy;
  }

  // CreatedAt...
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? pCreatedAt) {
    if (isNull(pCreatedAt)) {
      throw errorFieldNotNullable("CoreEntity.set", fldCreatedAt);
    }
    var old = _createdAt;
    _createdAt = pCreatedAt;
    _isUpdated = !_isNew && old != _createdAt;
  }

  // UpdatedBy...
  UsrUser? get updatedBy => __updatedBy;
  set updatedBy(UsrUser? pUpdatedBy) {
    var old = __updatedBy;
    __updatedBy = pUpdatedBy;
    _isUpdated = !_isNew && old != __updatedBy;
  }

  // UpdatedAt...
  DateTime? get updatedAt => __updatedAt;
  set updatedAt(DateTime? pUpdatedAt) {
    var old = __updatedAt;
    __updatedAt = pUpdatedAt;
    _isUpdated = !_isNew && old != __updatedAt;
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


  // IDENTIFICADORS I CLAUS -----------
  static String asKey(Type pType, dynamic pId, String? pIdB) {
    String skey;

    switch (pType) {
      // a_user
      // ------
      // USRMOD...
      case UsrUser _:
      case UsrDevice _:
      case UsrFcmHistory _:
        skey = "${pType.toString()}:${pId ?? "_"}";
        break;

      // b_definitions
      // -------------
      // EMOMOD...
      case EmoMood _:
      case EmoEmotion _:
        skey = "${pType.toString()}:${pId ?? "_"}";
        break;

      // e_localization
      // --------------
      // LOCMOD...
      case LocTranslation _:
        skey = "${pType.toString()}:${pId ?? "_"}|${pIdB ?? "_"}";
        break;

      default:
        throw unkownEntity("st EntityKey.asKey()", pType);
    }

    return skey;
  }

  static (String, List<String>, String, List<dynamic>) stTableParms(
      Type pType, dynamic pKey, String? pKeyB) {
    switch (pType) {
      // USRMOD
      case UsrUser _:
        return (tnUsrUser, UsrUser.tableFields, "$fldId = ?", [pKey]);
      case UsrDevice _:
        return (tnUsrDevice, UsrDevice.tableFields, "$fldId = ?", [pKey]);
      case UsrFcmHistory _:
        return (tnUsrFcmHistory, UsrFcmHistory.tableFields, "$fldId = ?", [pKey]);
      //
      // EMOMOD
      case EmoEmotion _:
        return (tnEmoEmotion, EmoEmotion.tableFields, "$fldId =?", [pKey]);
      case EmoMood _:
        return (tnEmoMood, EmoMood.tableFields, "$fldId =?", [pKey]);
      //
      // LOCMOD
      case LocTranslation _:
        return (
          tnLocTranslation,
          LocTranslation.tableFields,
          "$fldLocaleCode = ? AND $fldTextKey = ?",
          [pKey, pKeyB]
        );
      //
      default:
        throw errorNoModelEntityType("MEntity.stTableParms", pType);
    }
  }

  static String stTableName(Type pType) {
    switch (pType) {
      // USRMOD
      case UsrUser _:         return tnUsrUser;
      case UsrDevice _:       return tnUsrDevice;
      case UsrFcmHistory _:   return tnUsrFcmHistory;
      
      // EMOMOD
      case EmoEmotion _:      return tnEmoEmotion;
      case EmoMood _:         return tnEmoMood;
      
      // LOCMOD
      case LocTranslation _:  return tnLocTranslation;
      //
      default:
        throw errorNoModelEntityType("MEntity.stTableName", pType);
    }
  }

  // CONVERSIONS TO MAP ---------------
  Map<String, dynamic> toMap() => {
        fldId: __id,
        fldIdLocal: __localId,
        fldCreatedBy: _createdBy,
        fldCreatedAt: _createdAt,
        fldUpdatedBy: __updatedBy,
        fldUpdatedAt: __updatedAt,
      };

  Map<String, dynamic> toSQLMap() => {
        fldId: __id,
        fldIdLocal: __localId,
        fldCreatedBy: _createdBy!.id,
        fldCreatedAt: dTimeToSql(_createdAt),
        fldUpdatedBy: __updatedBy?.id,
        fldUpdatedAt: dTimeToSql(__updatedAt),
      };

  // ----------------------------------
  int? get asInt => (isNotNull(__id)) ? __id as int : null;

  static String keyByType(Type pType, dynamic pKey, String? pKeyB) {
    String skey;

    switch (pType) {
      // USRMOD...
      case UsrUser _:
      case UsrDevice _:
      case UsrFcmHistory _:
        skey = "${pType.toString()}:${pKey ?? "_"}";
        break;

      // b_definitions
      // -------------
      // EMOMOD...
      case EmoEmotion _:
        skey = "${pType.toString()}:${pKey ?? "_"}";
        break;

      // e_localization
      // --------------
      // LOCMOD...
      case LocTranslation _:
        skey = "${pType.toString()}:${pKey ?? "_"}|${pKeyB ?? "_"}";
      default:
        throw unkownEntity("st EntityKey.asKey()", pType);
    }

    return skey;
  }

  // FUNCIONS ABSTRACTES --------------
  bool isCompleted() {
    return (isNotNull(createdBy) && isNotNull(createdAt));
  }

  (String, List<String>, String, List<dynamic>) get tableParms =>
      throw 'ModelEntity.tableParms: abstract method!';
}

extension MainTableFields on EntityKeyType {
  List<String> get mainFields {
    switch (this) {
      case EntityKeyType.standard:
        return <String>[
          fldIdLocal,
          fldId,
          fldCreatedBy,
          fldCreatedAt,
          fldUpdatedBy,
          fldUpdatedAt,
        ];
      case EntityKeyType.stringA:
        return <String>[
          fldIdLocal,
          fldId,
          fldCreatedBy,
          fldCreatedAt,
          fldUpdatedBy,
          fldUpdatedAt,
        ];
      case EntityKeyType.stringAB:
        return <String>[
          fldIdLocal,
          fldId,
          fldIdB,
          fldCreatedBy,
          fldCreatedAt,
          fldUpdatedBy,
          fldUpdatedAt,
        ];
      default:
        throw errorUnknownEntityKeyType("EntityKeyType.mainFields", this);
    }
  }
}
