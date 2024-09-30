// Control·lador de la pàgina Home.
// createdAt: 24/07/18 dj. JIQ

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:ld_learn/01_ui/init_application.dart/index.dart';
import 'package:ld_learn/01_ui/load_steps.dart';
import 'package:ld_learn/01_ui/routes.dart';
import 'package:ld_learn/04_connections/conn_control.dart';
import 'package:ld_learn/07_services/database_service.dart';
import 'package:ld_learn/07_services/firebase_service.dart';

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/09_tools/index.dart';
import 'package:ld_learn/10_localization/index.dart';

class InitApplicationCtrl extends BaseController {
  // CONSTANTS ------------------------
  static final int wgtFirebaseColumn = WidgetKey.custom.idx + 1;

  // CONSTRUCTORS ---------------------
  InitApplicationCtrl() : super(pState: InitApplicationData());

  // CICLE DE VIDA --------------------
  @override
  void onInit() {
    addWidgets([WidgetKey.appBar, WidgetKey.appBarProgress, wgtFirebaseColumn]);
    super.onInit();
  }

  // GETTERS i SETTERS ----------------
  InitApplicationData get pageData => super.state as InitApplicationData;

  // CÀRREGA DE DADES -----------------
  @override
  Future<void> loadData() async {
    if (!isNew) return;
    setPreparing();

    // Validem que el dispositiu no tingui root o jailbreak.
    LoadStep lstp = LoadStep(
      pIdx: "00",
      pTitle: "Validació de Root o Jailbreak.",
    );
    pageData.addFn((FiFo pQueue, List<dynamic> pArgs, {int? loadLocalFcmToken}) async {
      bool hasRoot = false;
      bool hasJailbreak = false;

      if (Platform.isAndroid) {
        // Comprova si el dispositiu té root
        try {
          final result = await Process.run('su', ['-c', 'id']);
          hasRoot = (result.exitCode == 0);
        } catch (exc) {
          hasRoot = false;
        }

        // Comprova si el dispositiu té jailbreak
        try {
          final result2 = await Process.run('su', ['-c', 'ls /system/app/Superuser.apk']);
          hasJailbreak = result2.exitCode == 0;
        } catch (exc) {
          hasJailbreak = false;
        }
      } else if (Platform.isIOS) {
        // Comprova si el dispositiu té jailbreak
        try {
          final result = await Process.run('cydia', ['--list']);
          hasJailbreak = (result.exitCode == 0);
        } catch (exc) {
          hasJailbreak = false;
        }
      }

      if (hasRoot || hasJailbreak) {
        Debug.error("El dispositiu té root o jailbreak. No es pot carregar la informació.",
            deviceRootOrJailbreak("InitApplicationCtrl.loadData()"));
        Get.offAndToNamed(rtSecurityLockPage);
        return Exception();
      }
      return null;
    }, pLoadStep: lstp);

    // Validem l'accés a Internet.
    lstp = LoadStep(
      pIdx: "01",
      pTitle: "Validació d'accés a Internet.",
    );
    pageData.addFn((FiFo pQueue, List<dynamic> pArgs, {int? loadLocalFcmToken}) async {
      ConnControl.to.internetConn = InternetConnection();
      return null;
    }, pLoadStep: lstp);

    // Carreguem el token local de firebase.
    lstp = LoadStep(
      pIdx: "02",
      pTitle: "Carrega del token local de firebase.",
    );
    pageData.addFn((FiFo pQueue, List<dynamic> pArgs, {int? loadLocalFcmToken}) async {
      pageData.setFbToken(await SecureStorage.to.fbToken);
      return null;
    }, pLoadStep: lstp);

    // Iniciem la connexió amb Firebase.
    lstp = LoadStep(
      pIdx: "03",
      pTitle: "Inicia la connexió amb Firebase.",
    );
    var fbs = FirebaseService.to;
    pageData.addFn((FiFo pQueue, List<dynamic> pArgs, {int? initFirebase}) async {
      fbs.init(this);
      return null;
    }, pLoadStep: lstp);

    // Salvem el token de Firebase al magatzem local.
    lstp = LoadStep(
      pIdx: "03.03",
      pTitle: "Salvar el token de Firebase al magatzem local.",
    );
    pageData.addFn((FiFo pQueue, List<dynamic> pArgs, {int? saveTokenToLocal}) async {
      await SecureStorage.to.setFbToken(pageData.fbToken);
      notify();
      return null;
    }, pLoadStep: lstp);

    // Salvem el token de Firebase al magatzem local.
    lstp = LoadStep(
      pIdx: "04",
      pTitle: "Servei de Base de dades.",
    );
    pageData.addFn((FiFo pQueue, List<dynamic> pArgs, {int? saveTokenToLocal}) async {
      await DatabaseService.to.init(this);
      notify();
      return null;
    }, pLoadStep: lstp);

    // Validem que totes les connexións segueixen establertes.
    lstp = LoadStep(
      pIdx: "05",
      pTitle: "Validació de les connexions.",
    );
    pageData.addFn((FiFo pQueue, List<dynamic> pArgs, {int? saveTokenToLocal}) async {
      var exc = ConnControl.to.checkConnections();
      notify();
      return exc;
    }, pLoadStep: lstp);

    setLoading();
    await pageData.runSteps().then((pLEx) {
      setLoaded(pLEx.$2);
      // JIQ: notify();
    });

    notify();
  }

  // CONSTRUCCIÓ DEL WIDGET -----------
  BaseScaffold? baseScaffold;
  @override
  Widget buildWidget() {
    baseScaffold ??= BaseScaffold(
        pTitle: "Iniciació de l'aplicació",
        pPageCtrl: this,
        pBody: SingleChildScrollView(
            clipBehavior: Clip.hardEdge,
            child: GetBuilder<InitApplicationCtrl>(
                id: wgtFirebaseColumn,
                init: this,
                builder: (pCtrl) => Padding(
                    padding: EdgeInsets.only(top: 15.h, left: 15.w),
                    child: Column(children: [
                      (pCtrl.isNew || pCtrl.isLoading)
                          ? Text(L.loadingPage.tr.capitalizeFirst!)
                          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text("${L.fcmTokenIs.tr.up}: ${pageData.tokenIsNew}"),
                              VerticalSpacer(pHeight: 15.h),
                              Text("FCM Token: \n${pageData.fbToken}"),
                              VerticalSpacer(pHeight: 30.h),
                              ElevatedButton(
                                  onPressed: () {
                                    Get.offAndToNamed(rtCrashPage, arguments: {
                                      'title': "Títol del gran error",
                                      'msg': "Aquest és un exemple de crash",
                                      'leading': ActionIcon(
                                        Icons.surfing_sharp,
                                        pOnPressed: () {},
                                      ),
                                      'errorCode': "123456789-A",
                                      'icon': const Icon(Icons.warning_amber_rounded),
                                    });
                                  },
                                  child: const Text("Crea Crash!")),
                            ])
                    ])))));

    return baseScaffold!;
  }
}
