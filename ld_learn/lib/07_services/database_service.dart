// Servei per a la gestió de la comunicació amb la base de dades local.
// createdAt: 24/07/23 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/load_steps.dart';
import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/04_connections/conn_control.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/database_cache_service.dart';
import 'package:ld_learn/08_model/a_user/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/08_model/c_working/index.dart';
import 'package:ld_learn/08_model/d_administration/index.dart';
import 'package:ld_learn/08_model/e_localization/index.dart';
import 'package:ld_learn/consts.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';
import 'package:path/path.dart';

import 'package:ld_learn/01_ui/init_application.dart/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Servei per a la gestió de la comunicació amb la base de dades local.
class DatabaseService {
  static DatabaseService? _to;
  static DatabaseService get to {
    _to ??= DatabaseService();
    return _to!;
  }

  // CONSTRUCTORS ---------------------
  DatabaseService() {
    _to = this;
  }

  // GETTERS i SETTERS ----------------
  bool get isOpen => ConnControl.to.isDbOpen;

  // CERQUES --------------------------
  Future<T?> byKey<T extends ModelEntity>(BaseController<DeepDo> pCtrl, Type pType,
      {required dynamic pKey, String? pKeyB}) async {
    if (pType is! ModelEntity) throw errorNoModelEntityType("DatabaseService.byKey()", pType);
    if (isNull(pKey)) return null;
    
    T? inst = DbCacheService.to.byTypeKey(pType, pId: pKey, pIdB: pKeyB) as T?;

    if (isNull(inst)) {
      // La catxè no conté la instància. La cerquem a la base de dades.
      if (!ConnControl.to.db.isOpen) {
        throw errorDbNotOpen("DatabaseService.byKey.kk.01");
      }

      inst = await loadFromDb(pCtrl, pType, pKey: pKey, pKeyB: pKeyB);
    }

    return inst;
  }

  Future<String?> trans(BaseController<DeepDo> pCtrl, {String? pTKey}) async {
    var lang = SecureStorage.to.user?.localeId ?? esCode;
    if (isNull(pTKey)) return "No Translated Key!";

    String? res = await loadFromDb(pCtrl, LocTranslation, pKey: pTKey, pKeyB: lang);
    return res ?? "#$pTKey";
  }

  Future<T?> loadFromDb<T extends ModelEntity>(BaseController<DeepDo> pCtrl, Type pType,
      {required dynamic pKey, String? pKeyB, int pDeep = 0}) async {
    T? inst;

    var instKey = ModelEntity.keyByType(pType, pKey, pKeyB);
    var loadStep =
        LoadStep(pIdx: "MEntity.load.01", pTitle: "Carrega de la instància '$instKey' i depen");

    Future<(Exception?, bool)> onExc(Exception? pExc) {
      if (isNull(pExc)) return Future.value((null, false));
      if (pExc is DatabaseException) return Future.value((pExc, true));
      return Future.value((errorUnknownException("MEntity.load.01", pExc!), false));
    }

    Exception? fnThen(FiFo<dynamic> pQueue) {
      inst = pQueue.pop();
      return null;
    }

    Future<Exception?> fn(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      var keyB = pArgs[0] as String?;
      var key = pArgs[1] as dynamic;
      var etype = pArgs[2] as Type;
      var ctrl = pArgs[3] as BaseController<DeepDo>;

      var (tableName, fields, where, args) = ModelEntity.stTableParms(etype, key, keyB);

      final lst = await ConnControl.to.db.query(
        tableName,
        columns: fields,
        where: where,
        whereArgs: args,
        limit: 1,
      );
      final map = (lst.isEmpty) ? null : lst[0] as Map<String, dynamic>;

      if (isNotNull(map)) {
        inst = ModelEntity.entityFromSqlMap(ctrl, etype, map!);
        if (isNotNull(inst)) {
          DbCacheService.to.put(inst!);
          pQueue.push(inst);
        }
      }
      return null;
    }

    if (pDeep > 0) {
      pCtrl.state.sneakFn(
        fn,
        pArgs: [pCtrl, pType, pKey, pKeyB],
        pLoadStep: loadStep,
        pOnExc: onExc,
        pThen: fnThen,
      );
    } else {
      await pCtrl.state.addFnNow(
        pCtrl,
        fn,
        pArgs: [pCtrl, pType, pKey, pKeyB],
        pLoadStep: loadStep,
        pOnExc: onExc,
        pThen: fnThen,
      );
    }

    return null;
  }

  // CICLE DE VIDA --------------------
  // Iniciació de la connexió a la base de dades
  Future<void> init(InitApplicationController pCtrl) async {
    LoadStep lstp = LoadStep(pIdx: "04.01", pTitle: "Iniciant Servei 'DatabaseService' ...");
    pCtrl.state.sneakFn((pQueue, pArgs, {int? initConnection}) async {
      var dbPass = await SecureStorage.to.dbPass;
      Debug.debug(1, "dbPass: '$dbPass'");
      LoadStep lstp2 = LoadStep(pIdx: "04.02", pTitle: "Obrint base de dades ...");
      pCtrl.state.sneakFn((pQueue, pArgs, {int? captureAndSaveLocal}) async {
        var path = join(await getDatabasesPath(), 'sabina.db');
        ConnControl.to.db = await openDatabase(
          path,
          version: 1,
          password: dbPass ?? "#dbPass",
          singleInstance: true,
          onCreate: (db, version) => _onCreateDB(db, version),
          onOpen: (db) => _onOpenDB(db),
          onConfigure: (db) async => await _onConfigureDB(db),
          onUpgrade: (db, oldVersion, newVersion) => _onUpgradeDB(db, oldVersion, newVersion),
          onDowngrade: (db, oldVersion, newVersion) => _onDowngradeDB(db, oldVersion, newVersion),
        );
        pCtrl.notify();
        Debug.info("... Base de dades oberta.");
        Debug.info("... Servei 'DatabaseService' iniciat.");
        return null;
      }, pLoadStep: lstp2);
      pCtrl.notify();
      return null;
    }, pLoadStep: lstp);
    pCtrl.notify();
  }

  _onCreateDB(Database pDb, int pVersion) async {
    Debug.info("DbService._onCreateDB(version:$pVersion)...");
    assert(pVersion == 1);

    String sqlCreate;
    List<String> sqlAuxs;

    // USRMOD
    // ======
    // TAULA 'USER'
    sqlCreate = UsrUser.stmtCreateTable;
    sqlAuxs = UsrUser.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TAULA 'DEVICE'
    sqlCreate = UsrDevice.stmtCreateTable;
    sqlAuxs = UsrDevice.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TAULA 'FCM_HISTORY'
    sqlCreate = UsrFcmHistory.stmtCreateTable;
    sqlAuxs = UsrFcmHistory.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // LOCMOD
    // ======
    // TAULA 'TRASLATION'
    sqlCreate = LocTranslation.stmtCreateTable;
    sqlAuxs = LocTranslation.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // EMOMOD
    // ======
    // TAULA 'EMOTION'
    sqlCreate = EmoEmotion.stmtCreateTable;
    sqlAuxs = EmoEmotion.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TAuLA 'MOOD'
    sqlCreate = EmoMood.stmtCreateTable;
    sqlAuxs = EmoMood.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // LSTMOD
    // ======
    // TAULA 'LIST_CATEGORY'
    sqlCreate = LstListCategory.stmtCreateTable;
    sqlAuxs = LstListCategory.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TAULA 'OPTION_LIST'
    sqlCreate = LstOptionList.stmtCreateTable;
    sqlAuxs = LstOptionList.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TAULA 'OPTION_ELEMENT'
    sqlCreate = LstOptionEntry.stmtCreateTable;
    sqlAuxs = LstOptionEntry.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // DISMOD
    // ======
    // TAULA 'DSM_V'
    sqlCreate = DisDsmV.stmtCreateTable;
    sqlAuxs = DisDsmV.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TAULA 'DISEASE'
    sqlCreate = DisDisease.stmtCreateTable;
    sqlAuxs = DisDisease.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TAULA 'PHASE'
    sqlCreate = DisPhase.stmtCreateTable;
    sqlAuxs = DisPhase.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TAULA 'GOAL'
    sqlCreate = DisGoal.stmtCreateTable;
    sqlAuxs = DisGoal.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // RSCMOD
    // ======
    // TAULA 'RESOURCE'
    sqlCreate = RscResource.stmtCreateTable;
    sqlAuxs = RscResource.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TAULA 'RESOURCE_PHASE'
    sqlCreate = RscPhaseResource.stmtCreateTable;
    sqlAuxs = RscPhaseResource.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TCKMOD
    // ======
    // TAULA 'TRACKING'
    sqlCreate = TckTracking.stmtCreateTable;
    sqlAuxs = TckTracking.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TAULA 'TRACKING_PHASE'
    sqlCreate = TckPhaseTracking.stmtCreateTable;
    sqlAuxs = TckPhaseTracking.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TAULA 'TRACKING_COLUMN'
    sqlCreate = TckTrackingColumn.stmtCreateTable;
    sqlAuxs = TckTrackingColumn.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TESTMOD
    // =======
    // TAULA 'TEST_CATEGORY'
    sqlCreate = TstTestCategory.stmtCreateTable;
    sqlAuxs = TstTestCategory.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TAULA 'TEST'
    sqlCreate = TstTest.stmtCreateTable;
    sqlAuxs = TstTest.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TAULA 'TEST_QUESTION'
    sqlCreate = TstQuestion.stmtCreateTable;
    sqlAuxs = TstQuestion.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // DGNMOD
    // ======
    // TAULA 'DIAGNOSIS'
    sqlCreate = DgnDiagnosis.stmtCreateTable;
    sqlAuxs = DgnDiagnosis.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TAULA 'DIAGNOSIS_PHASE'
    sqlCreate = DgnDiagnosisPhase.stmtCreateTable;
    sqlAuxs = DgnDiagnosisPhase.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TAULA 'ACHIEVEMENT'
    sqlCreate = DgnAchievement.stmtCreateTable;
    sqlAuxs = DgnAchievement.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // MATMOD
    // ======
    // TAULA 'MATERIAL'
    sqlCreate = MatMaterial.stmtCreateTable;
    sqlAuxs = MatMaterial.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TAULA 'MATERIAL_PHASE'
    sqlCreate = MatMaterialPhase.stmtCreateTable;
    sqlAuxs = MatMaterialPhase.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // REGMOD
    // ======
    // TAULA 'REGISTER'
    sqlCreate = RegRegister.stmtCreateTable;
    sqlAuxs = RegRegister.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TAULA 'REGISTER_COLUMN'
    sqlCreate = RegRegisterColumn.stmtCreateTable;
    sqlAuxs = RegRegisterColumn.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // RESMOD
    // ======
    // TAULA 'PATIENT_TEST'
    sqlCreate = ResPatientTest.stmtCreateTable;
    sqlAuxs = ResPatientTest.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TAULA 'ANSWER'
    sqlCreate = ResAnswer.stmtCreateTable;
    sqlAuxs = ResAnswer.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // NTFMOD
    // ======
    // TAULA 'NOTIFICATION'
    sqlCreate = NtfNotification.stmtCreateTable;
    sqlAuxs = NtfNotification.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // TSKMOD
    // ======
    // TAULA 'TASK'
    sqlCreate = TskTask.stmtCreateTable;
    sqlAuxs = TskTask.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    // VISMOD
    // ======
    // TAULA 'VISIT'
    sqlCreate = VisVisit.stmtCreateTable;
    sqlAuxs = VisVisit.stmtAuxCreate;
    _executeAux(pDb, sqlCreate, sqlAuxs);

    await pDb.execute('PRAGMA foreign_keys = ON');
    Debug.info("... DbService._onCreateDB(version:$pVersion)");
  }

  _onOpenDB(Database pDb) async {
    assert(await pDb.getVersion() == 1);
    Debug.info("DbService._onOpenDB ...");
    Debug.info("... DbService._onOpenDB");
  }

  _onConfigureDB(Database pDb) async {
    assert(await pDb.getVersion() == 1);
    Debug.info("DbService._onConfigureDB ...");
    await ConnControl.to.db.execute('PRAGMA cipher_migrate');
    await ConnControl.to.db.execute('PRAGMA foreign_keys = OFF');
    Debug.info("... DbService._onConfigureDB");
  }

  _onUpgradeDB(Database pDb, int pOldVers, int pNewVers) async {
    assert(await pDb.getVersion() == 1);
    Debug.info("DbService._onUpgradeDB(old: $pOldVers new:$pNewVers) ...");
    Debug.info("... DbService._onUpgradeDB(old: $pOldVers new:$pNewVers)");
  }

  _onDowngradeDB(Database pDb, int pOldVers, int pNewVers) async {
    assert(await pDb.getVersion() == 1);
    Debug.info("DbService._onDowngradeDB(old: $pOldVers new:$pNewVers) ...");
    Debug.info("... DbService._onDowngradeDB(old: $pOldVers new:$pNewVers)");
  }

  void _executeAux(Database pDb, String pCreate, List<String> pIndexs) async {
    await pDb.execute(pCreate);
    for (final sql in pIndexs) {
      await pDb.execute(sql);
    }
  }
}
