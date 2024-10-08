// Definició de la pàgina Login
// createdAt: 24/10/07 dl. GPT(JIQ)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_learn/01_gpt_ui/screens/login_page/index.dart';

class LoginPage extends GetView<LoginPageCtrl> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Deleguem la construcció del widget principal al controlador
    return controller.buildWidget();
  }
}