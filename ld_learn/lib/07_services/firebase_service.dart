// Servei per a la gestió de la comunicació amb Firebase.
// createdAt: 24/07/23 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ld_learn/01_ui/init_application.dart/index.dart';
import 'package:ld_learn/01_ui/load_steps.dart';
import 'package:ld_learn/04_connections/conn_control.dart';
import 'package:ld_learn/09_tools/index.dart';

import 'firebase_options.dart';

class FirebaseService {
  static FirebaseService? _to;
  static FirebaseService get to {
    _to ??= FirebaseService();
    return _to!;
  }

  // MEMBRES --------------------------
  String? _fcmToken;

  // CONSTRUCTORS ---------------------
  FirebaseService() {
    _to = this;
  }

  // GETTERS i SETTERS ----------------
  FirebaseApp? get fbApp => ConnControl.to.fbApp;
  set fbApp(FirebaseApp? pFbApp) {
    ConnControl.to.fbApp = pFbApp;
  }

  String? get fcmToken => _fcmToken;
  set fcmToken(String? pToken) {
    _fcmToken = pToken;
  }

  // CICLE DE VIDA --------------------
  // Iniciació de la connexió a Firebase i a FirebaseMessaging.
  Future<void> init(InitApplicationController pCtrl) async {
    LoadStep lstp = LoadStep(pIdx: "03.01", pTitle: "Iniciant Servei 'FirebaseService' ...");
    pCtrl.state.sneakFn((pQueue, pArgs, {int? initConnection}) async {
      ConnControl.to.fbApp =
          await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      ConnControl.to.fbFcm = FirebaseMessaging.instance;
      LoadStep lstp2 =
          LoadStep(pIdx: "03.02", pTitle: "Càrrega del token del dispositiu des de Firebase.");
      pCtrl.state.sneakFn((pQueue, pArgs, {int? captureAndSaveLocal}) async {
        _fcmToken = await ConnControl.to.fbFcm.getToken();
        await SecureStorage.to.setFbTokenNew(pCtrl.pageData.fbToken == _fcmToken);
        pCtrl.pageData.setFbToken(_fcmToken);
        pCtrl.notify();
        Debug.info("... Servei 'FirebaseService' iniciat.");
        return null;
      }, pLoadStep: lstp2);
      pCtrl.notify();
      return null;
    }, pLoadStep: lstp);
    pCtrl.notify();
  }
}
