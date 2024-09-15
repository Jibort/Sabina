// Definició de la pàgina Home.
// createdAt: 24/07/18 dj. JIQ

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_learn/01_ui/home_page.dart/index.dart';

class HomePage extends GetView<HomePageCtrl> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.buildWidget();
  }
}
