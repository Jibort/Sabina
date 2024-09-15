// Magatzem i control de les diferents instàncies de connexió amb
// sistemes tercers.
// createdAt: 24/08/02 dv. JIQ

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:ld_learn/09_tools/index.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

class ConnControl {
  static ConnControl? _to;
  static ConnControl get to {
    _to ??= ConnControl();
    return _to!;
  }

  // MEMBRES --------------------------
  // Connexió al magatzem segur de variables de l'aplicació.
  FlutterSecureStorage? _secStorage;

  // Control·lador de la connexió a Internet.
  InternetConnection? _internetConn;

  // Connexió a la base de dades local.
  Database? _db;

  // Connexió al servidor de Firebase.
  FirebaseApp? _fbApp;

  // Conenxió a l'API de Google Firebase Cloud Messaging.
  FirebaseMessaging? _fbFcm;

  // CONSTRUCTORS ---------------------
  ConnControl() {
    _to = this;
  }

  // GETTERS i SETTERS ----------------
  FlutterSecureStorage get secStorage {
    if (isNull(_secStorage)) throw serviceUnavailable("ConnControl.get", "FlutterSecureStorage");
    return _secStorage!;
  }

  set secStorage(FlutterSecureStorage value) => _secStorage = value;

  InternetConnection get internetConn {
    if (isNull(_internetConn)) throw serviceUnavailable("ConnControl.get", "InternetConnection");
    return _internetConn!;
  }

  set internetConn(InternetConnection value) => _internetConn = value;

  Database get db {
    if (isNull(_db)) throw serviceUnavailable("ConnControl.get", "Database");
    return _db!;
  }

  bool get isDbOpen => (_db?.isOpen ?? false);

  set db(Database value) => _db = value;

  FirebaseApp get fbApp {
    if (isNull(_fbApp)) throw serviceUnavailable("ConnControl.get", "FirebaseApp");
    return _fbApp!;
  }

  set fbApp(FirebaseApp? pFBase) {
    if (isNull(pFBase)) throw serviceUnavailable("ConnControl.get", "Firebase");
    _fbApp = pFBase;
  }

  FirebaseMessaging get fbFcm {
    if (isNull(_fbFcm)) throw serviceUnavailable("ConnControl.get", "FirebaseMessaging");
    return _fbFcm!;
  }

  set fbFcm(FirebaseMessaging value) => _fbFcm = value;

  // MÈTODES --------------------------
  Future<Exception?> checkConnections() async {
    try {
      secStorage;
      var istate = await internetConn.internetStatus;
      if (istate != InternetStatus.connected) {
        throw errorNoInternetConnection("ConnControl.checkConnections");
      }
      db;
      fbApp;
      fbFcm;
    } on Exception catch (pExc) {
      return pExc;
    }

    return null;
  }
}
