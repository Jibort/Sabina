// Càrrega dels bindings de la pàgina arrel.
// createdAt: 24/07/18 dj. JIQ

import 'package:get/get.dart';
import 'package:ld_learn/01_ui/home_page.dart/index.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageCtrl());
  }
}
