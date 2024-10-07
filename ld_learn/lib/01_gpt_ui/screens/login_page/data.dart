// Dades de la pàgina de Login.
// createdAt: 24/10/07 dl. GPT(JIQ)

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/09_tools/index.dart';

class LoginPageData extends DeepDo {
  // Camps del formulari
  String? _username;
  String? _password;
  String? _errorMessage;

  // CONSTRUCTORS ---------------------
  LoginPageData({Function(FiFo pQueue)? pOnAltered}) : super(pOnAltered);

  // Getters i Setters
  String? get username => _username;
  set username(String? value) {
    _username = value;
  }

  String? get password => _password;
  set password(String? value) {
    _password = value;
  }

  String? get errorMessage => _errorMessage;
  set errorMessage(String? value) {
    _errorMessage = value;
    notify();  // Actualitzem la UI si hi ha un error
  }
}
