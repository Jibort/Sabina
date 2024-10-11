// Definició de la pàgina de Login
// createdAt: 24/10/11 dv. GPT(JIQ)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.buildWidget();
  }
}
