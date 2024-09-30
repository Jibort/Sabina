// createdAt: 24/07/18 dj. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ld_learn/04_connections/conn_control.dart';
import 'package:ld_learn/08_model/a_user/USRMOD/usr_user.dart';
import 'package:ld_learn/08_model/a_user/index.dart';
import 'package:ld_learn/09_tools/index.dart';
import 'package:ld_learn/consts.dart';

const _aopts = AndroidOptions(
  encryptedSharedPreferences: true,
  keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
  storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
);
const _iopts = IOSOptions(synchronizable: true, accountName: null);

// Classe per a l'accés al magatzem segur del dispositiu per a l'apllicació.
class SecureStorage {
  static SecureStorage? _to;
  static SecureStorage get to {
    _to ??= SecureStorage();
    return _to!;
  }

  // MEMBRES --------------------------
  UsrUser? _root;
  UsrUser? _user;

  // GETTERS / SETTERS ----------------
  UsrUser? get root => _root;
  set root(UsrUser? pRoot) => _root = pRoot;

  UsrUser? get user => _user;
  set user(UsrUser? pUsr) => _user = pUsr;

  // CONSTRUCTORS ---------------------
  SecureStorage() {
    _to = this;
    ConnControl.to.secStorage = const FlutterSecureStorage(aOptions: _aopts, iOptions: _iopts);
    initFirstKeys();
  }

  void initFirstKeys() async {
    await read<int?>(ssPassBase).then((pVers) async {
      if (isNull(pVers)) {
        await write(ssPassBase, 1);
      }
    });

    String? srSeq = "";
    srSeq = await read<String?>(ssRandomSeq);
    if (isNull(srSeq)) {
      srSeq = randomString(256);
      await write(ssRandomSeq, srSeq);
    }

    String dbPass = "";
    dbPass = await read<String?>(ssDbPass).then((pPass) async {
      if (isNull(pPass)) {
        dbPass = newPassword(srSeq!, 64);
        await write(ssDbPass, dbPass);
      }
      return dbPass;
    });
  }

  // Lectura d'un valor del magatzem segur del dispositiu.
  Future<T?> read<T>(String pKey) async {
    final jsonValue = await ConnControl.to.secStorage.read(key: pKey);
    if (isNull(jsonValue)) return null;

    final value = jsonDecode(jsonValue!);
    return value is T ? value : null;
  }

  // Escriptura d'un valor al magatzem segur del dispositiu.
  Future<void> write(String pKey, dynamic pValue) async {
    final jsonValue = jsonEncode(pValue);
    await ConnControl.to.secStorage.write(key: pKey, value: jsonValue);
  }

  // ACCELERADORS ---------------------
  Future<int?> get userId async => await read<int?>(ssUserId);
  Future<void> setUserId(String? pUserId) async => await write(ssUserId, pUserId);

  Future<String?> get userLang async => await read<String?>(ssUserLang);
  Future<void> setUserLang(String? pUserLang) async => await write(ssUserLang, pUserLang);

  Future<String?> get fbToken async => await read<String?>(ssFbToken);
  Future<void> setFbToken(String? pFbToken) async => await write(ssFbToken, pFbToken);

  Future<bool?> get fbTokenNew async => await read<bool?>(ssFbTokenNew);
  Future<void> setFbTokenNew(bool? pFbTokenNew) async => await write(ssFbTokenNew, pFbTokenNew);

  Future<String?> get dbPass async => await read<String?>(ssDbPass);
  Future<void> setDbPass(String? pDbPass) async => await write(ssDbPass, pDbPass);

  Future<int?> get dbVersion async => await read<int?>(ssDbVersion);
  Future<void> setDbVersion(int? pDbVersion) async => await write(ssDbVersion, pDbVersion);

  Future<String?> get passBase async => await read<String?>(ssPassBase);
  Future<void> setPassBase(String? pPassBase) async => await write(ssPassBase, pPassBase);

  Future<String?> get randomSeq async => await read<String?>(ssRandomSeq);
  Future<void> setRandomSeq(String? pRandomSeq) async => await write(ssRandomSeq, pRandomSeq);

  Future<bool?> get mustAuthenticate async => await read<bool?>(ssMustAuthenticate);
  Future<void> setMustAuthenticate(bool? pMustAuthenticate) async =>
      await write(ssMustAuthenticate, pMustAuthenticate);
}
