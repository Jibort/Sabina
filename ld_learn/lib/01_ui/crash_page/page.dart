// Definició de la pàgina Home.
// createdAt: 24/07/18 dj. JIQ

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_learn/01_ui/crash_page/index.dart';

class CrashPage extends GetView<CrashPageCtrl> {
  const CrashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.buildWidget();
  }
}
