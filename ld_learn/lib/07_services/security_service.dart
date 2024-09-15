// Servei per a la gestió del dispositiu i la seva seguretat.
// createdAt: 24/07/27 ds. JIQ

// ignore_for_file: unnecessary_getters_setters, avoid_init_to_null

import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:jailbreak_root_detection/jailbreak_root_detection.dart';
import 'package:ld_learn/10_localization/index.dart';
import 'package:local_auth/local_auth.dart';

class SecurityService {
  static SecurityService? _to;
  static SecurityService get to {
    _to ??= SecurityService();
    return _to!;
  }

  // MEMBRES --------------------------
  final LocalAuthentication _auth = LocalAuthentication();
  StreamSubscription<InternetStatus>? _lstn;

  // CONSTRUCTORS ---------------------
  SecurityService() {
    _to = this;
  }

  // GETTERS i SETTERS ----------------
  void cancelConnListener() {
    _lstn?.cancel();
    _lstn = null;
  }

  Future<bool> get hasInternetConnection async => await InternetConnection().hasInternetAccess;

  Future<bool> get canCheckBiometrics async => await _auth.canCheckBiometrics;

  Future<bool> get canAuthenticate async =>
      await canCheckBiometrics || await _auth.isDeviceSupported();

  Future<List<BiometricType>> availableBiometrics() async => await _auth.getAvailableBiometrics();

  // ROOT o JAILBREAK -----------------
  Future<bool> get isNotTrust async => await JailbreakRootDetection.instance.isNotTrust;
  Future<bool> get isJailBroken async => await JailbreakRootDetection.instance.isJailBroken;
  Future<bool> get isRealDevice async => await JailbreakRootDetection.instance.isRealDevice;
  Future<bool> get isDevMode async => await JailbreakRootDetection.instance.isDevMode;
  Future<bool> get isOnExternalStorage async =>
      await JailbreakRootDetection.instance.isOnExternalStorage;
  Future<List<JailbreakIssue>> get checkForIssues async =>
      await JailbreakRootDetection.instance.checkForIssues;

  // CONNECTIVITAT --------------------
  void listenConnState(Function(InternetStatus)? pOnConnStateChanged,
      {void Function()? pOnDone, void Function(Object)? pOnError}) {
    _lstn?.cancel();
    _lstn = InternetConnection()
        .onStatusChange
        .listen(pOnConnStateChanged, onDone: pOnDone, onError: pOnError);
  }

  void stopListenConnState() {
    _lstn?.cancel();
  }

  // AUTENTICACIÓ ---------------------
  Future<(bool, Exception?)> authenticate(String? biometricType) async {
    bool done;
    Exception? exc;

    try {
      done = await _auth.authenticate(localizedReason: L.authenticate.tr);
      exc = null;
    } on Exception catch (pExc) {
      done = false;
      exc = pExc;
    }

    return Future.value((done, exc));
  }
}
