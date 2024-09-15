// Representació genèrica d'una entitat de dades.
// @createdAt: 2024-06-22 ds: JIQ

// ignore_for_file: unnecessary_getters_setters

// Classe abstracta 'ModelEntity' -----
import 'package:ld_learn/01_ui/widgets/base_controller.dart';
import 'package:ld_learn/01_ui/widgets/deep_do.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/08_model/a_user/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/08_model/e_localization/LOCMOD/loc_translation.dart';
import 'package:ld_learn/09_tools/index.dart';

abstract class ModelEntity {
  // MEMBERS --------------------------
  late CoreEntity _core;

  // BUILDERS -------------------------
  ModelEntity({required CoreEntity pCore}) {
    _core = pCore;
  }

  ModelEntity.empty() {
    _core = CoreEntity.empty();
  }

  ModelEntity.byMap(Map<String, dynamic> pMap) {
    _core = CoreEntity.byMap(pMap);
  }

  ModelEntity.bySQLMap(Type pType, Map<String, dynamic> pMap) {
    _core = CoreEntity.bySqlMap(pType, pMap);
  }

  static T? entityFromSqlMap<T extends ModelEntity>(
      BaseController<DeepDo> pCtrl, Type pType, Map<String, dynamic> pMap) {
    T? inst;

    switch (pType) {
      // a_user
      // ------
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
      // b_definitions
      // -------------
      // EMOMOD...
      case EmoEmotion _:
        inst = EmoEmotion.bySQLMap(pCtrl, pMap) as T?;
        break;
      // e_localization
      // --------------
      // LOCMOD...
      case LocTranslation _:
        inst = LocTranslation.bySQLMap(pCtrl, pMap) as T?;
        break;
      //
      default:
        inst = null;
    }

    return inst;
  }

  // GETTERS i SETTERS ------------------
  CoreEntity get core => _core;
  set core(CoreEntity pCore) => _core = pCore;

  // EntityKey? get key => _core.key;
  // String get entityKey => "$tableParms:${core.buildKeyStr()}";

  int? get serverId => _core.id;

  int? get localId => _core.localId;
  String get entityLocalId => ":$tableParms:${core.buildLocalIdStr()}";

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
      case UsrUser _:
        return tnUsrUser;
      case UsrDevice _:
        return tnUsrDevice;
      case UsrFcmHistory _:
        return tnUsrFcmHistory;
      //
      // EMOMOD
      case EmoEmotion _:
        return tnEmoEmotion;
      case EmoMood _:
        return tnEmoMood;
      //
      // LOCMOD
      case LocTranslation _:
        return tnLocTranslation;
      //
      default:
        throw errorNoModelEntityType("MEntity.stTableName", pType);
    }
  }

  // CONVERSIONS TO MAP ---------------
  Map<String, dynamic> toMap() => core.toMap();
  Map<String, dynamic> toSQLMap() => core.toSQLMap();

  // FUNCIONS ABSTRACTES --------------
  bool isCompleted();
  (String, List<String>, String, List<dynamic>) get tableParms =>
      throw 'MEntity.tableParms: abstract method';

  // CÀRREGA D'INSTÀNCIES DE LA BD ----
  // static Future<T?> loadFromDB<T extends ModelEntity>(BaseController<DeepDo> pCtrl, Type pType,
  //     {required dynamic pKey, String? pKeyB, int pDeep = 0}) async {
  //   T? inst;
  //
  //   var instKey = EntityKey.asKey(pType, pKey, pKeyB);
  //   var loadStep = LoadStep(
  //       pIdx: "MEntity.load.01", pTitle: "Carrega de la instància '$instKey' i depenents.");
  //
  //   Future<(Exception?, bool)> onExc(Exception? pExc) {
  //     if (isNull(pExc)) return Future.value((null, false));
  //     if (pExc is DatabaseException) return Future.value((pExc, true));
  //     return Future.value((errorUnknownException("MEntity.load.01", pExc), false));
  //   }
  //
  //   Exception? fnThen(FiFo<dynamic> pQueue) {
  //     inst = pQueue.pop();
  //     return null;
  //   }
  //
  //   Future<Exception?> fn(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
  //     var keyB = pArgs[0] as String?;
  //     var key = pArgs[1] as dynamic;
  //     var etype = pArgs[2] as Type;
  //     var ctrl = pArgs[3] as BaseController<DeepDo>;
  //
  //     var (tableName, fields, where, args) = ModelEntity.stTableParms(etype, key, keyB);
  //     final lst = await ConnControl.to.db.query(
  //       tableName,
  //       columns: fields,
  //       where: where,
  //       whereArgs: args,
  //       limit: 1,
  //     );
  //     final map = (lst.isEmpty) ? null : lst[0] as Map<String, dynamic>;
  //
  //     if (isNotNull(map)) inst = ModelEntity.entityFromSqlMap(ctrl, etype, map);
  //     pQueue.push(inst);
  //     return null;
  //   }
  //
  //   if (pDeep > 0) {
  //     pCtrl.state.sneakFn(
  //       fn,
  //       pArgs: [pCtrl, pType, pKey, pKeyB],
  //       pLoadStep: loadStep,
  //       pOnExc: onExc,
  //       pThen: fnThen,
  //     );
  //   } else {
  //     await pCtrl.state.addFnNow(
  //       pCtrl,
  //       fn,
  //       pArgs: [pCtrl, pType, pKey, pKeyB],
  //       pLoadStep: loadStep,
  //       pOnExc: onExc,
  //       pThen: fnThen,
  //     );
  //   }
  //
  //   return null;
  // }
}
