// createdAt: 24/07/18 dj. JIQ

// ignore_for_file: unnecessary_getters_setters, unused_field, prefer_final_fields

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/09_tools/index.dart';

class InitApplicationData extends DeepDo {
  // MEMBRES --------------------------
  String? _fbToken;
  bool _tokenIsNew = false;

  // CONSTRUCTORS ---------------------
  InitApplicationData({Function(FiFo pQueue)? pOnAltered}) : super(pOnAltered);

  // GETTERS i SETTERS ----------------
  bool get tokenIsNew => _tokenIsNew;
  String? get fbToken => _fbToken;
  void setFbToken(String? pNewToken) async {
    String? oldToken = _fbToken;
    _fbToken = pNewToken;
    _tokenIsNew = (oldToken != _fbToken);
    await SecureStorage.to.setFbToken(pNewToken);
  }
}
