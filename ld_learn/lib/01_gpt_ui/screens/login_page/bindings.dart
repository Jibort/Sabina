// Càrrega dels bindings de la pàgina de Login.
// createdAt: 24/10/11 dv. GPT(JIQ)

import 'package:get/get.dart';
import 'controller.dart';

class LoginPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginPageController());
  }
}
