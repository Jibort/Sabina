// Càrrega dels bindings de la pàgina de Login.
// createdAt: 24/10/07 dl. GPT(JIQ)

import 'package:get/get.dart';
import 'package:ld_learn/01_gpt_ui/screens/login_page/index.dart';

class LoginPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginPageCtrl());
  }
}
