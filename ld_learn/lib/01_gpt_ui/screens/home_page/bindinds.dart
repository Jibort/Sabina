// Càrrega dels bindings de la pàgina de Home.
// createdAt: 24/10/08 dt. GPT(JIQ)

import 'package:get/get.dart';
import 'controller.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}