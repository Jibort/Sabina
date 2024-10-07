// Càrrega dels bindings de la pàgina arrel.
// createdAt: 24/07/18 dj. JIQ

import 'package:get/get.dart';
import 'package:ld_learn/01_ui/crash_page/index.dart';

class CrashPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CrashPageCtrl());
  }
}
