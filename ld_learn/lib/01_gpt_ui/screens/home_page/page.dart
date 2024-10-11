// Definició de la pàgina Home
// createdAt: 24/10/08 dt. GPT(JIQ)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.buildWidget();
  }
}
