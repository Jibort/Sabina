// Inicialització de l'aplicació.
// createdAt: 24/07/23 dt. JIQ

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_learn/01_ui/init_application.dart/index.dart';

class InitApplicationPage extends GetView<InitApplicationController> {
  const InitApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.buildWidget();
  }
}
