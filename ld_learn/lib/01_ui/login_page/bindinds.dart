// Càrrega dels bindings de la pàgina de Login.
// createdAt: 24/07/18 dj. JIQ

import 'package:get/get.dart';
import 'package:ld_learn/01_ui/login_page/index.dart';

class LoginPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginPageCtrl());
  }
}
