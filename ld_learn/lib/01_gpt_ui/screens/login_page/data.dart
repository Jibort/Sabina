// Informació dins la pàgina Login.
// createdAt: 24/10/11 dv. GPT(JIQ)

import 'package:ld_learn/01_ui/widgets/index.dart';

class LoginPageData extends DeepDo {
  String? email;
  String? password;
  bool isBiometricEnabled = false;
  bool isAutoLoginEnabled = false;

  LoginPageData({this.email, this.password}) : super(null);
}
