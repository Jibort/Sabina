// Control·lador de la pàgina Home.
// createdAt: 24/07/18 dj. JIQ

// ignore_for_file: unnecessary_overrides

// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_learn/01_ui/routes.dart';
import 'package:ld_learn/01_ui/widgets/index.dart';

import 'index.dart';

class LoginPageCtrl extends BaseController {
  LoginPageCtrl() : super(pState: LoginPageData());

  LoginPageData get pageData => super.state as LoginPageData;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    setPreparing();

    // Simulem la validació del login
    if (pageData.username == 'admin' && pageData.password == '1234') {
      Get.offAndToNamed(rtHomePage); // Redirigim a la pàgina principal
    } else {
      pageData.errorMessage = 'Nom d\'usuari o contrasenya incorrectes';
      setLoaded(null);  // Actualitzem la UI després de la validació
    }
  }

  @override
  Widget buildWidget() {
    // TODO: implement buildWidget
    throw UnimplementedError();
  }

  @override
  Future<void> loadData() {
    // TODO: implement loadData
    throw UnimplementedError();
  }

  // Lògicament, també afegiríem les càrregues de dades seqüencials amb DeepDo si cal.
}
