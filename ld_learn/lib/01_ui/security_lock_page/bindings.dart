// Càrrega dels bindings de la pàgina arrel.
// createdAt: 24/07/18 dj. JIQ

import 'package:get/get.dart';
import 'package:ld_learn/01_ui/security_lock_page/index.dart';

class SecurityLockPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SecurityLockPageCtrl());
  }
}
