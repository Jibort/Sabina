// Definició de la pàgina Login
// createdAt: 24/07/18 dj. JIQ

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_learn/01_ui/login_page/index.dart';

class LoginPage extends GetView<CrashPageCtrl> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.buildWidget();
  }
}
