// Càrrega dels bindings de la pàgina d'inicialització.
// createdAt: 24/07/23 dt. JIQ

import 'package:get/get.dart';
import 'package:ld_learn/01_ui/init_application.dart/index.dart';

class InitApplicationBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(InitApplicationController());
  }
}
