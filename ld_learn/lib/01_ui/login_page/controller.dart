// Control·lador de la pàgina de Login.
// createdAt: 24/07/18 dj. JIQ

import 'package:flutter/material.dart';
import 'package:ld_learn/01_ui/login_page/index.dart';
import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ld_learn/09_tools/index.dart';

class LoginPageCtrl extends BaseController {
  // CONSTRUCTORS ---------------------
  LoginPageCtrl() : super(pState: LoginPageData.fromArgs());

  // CICLE DE VIDA --------------------
  @override
  void onInit() {
    addWidgets([WidgetKey.appBar, WidgetKey.appBarProgress]);
    super.onInit();
  }

  // GETTERS i SETTERS ----------------
  LoginPageData get pageData => super.state as LoginPageData;

  // LÒGICA DEL CONTROL·LADOR ---------

  // CÀRREGA DE DADES -----------------
  @override
  Future<void> loadData() async {
    if (!isNew) return;
    setLoading();
    pageData.fgIconColor(Colors.white);
    pageData.iconSize(150.h);
    setLoaded(null);
  }

  // CONSTRUCCIÓ DEL WIDGET -----------
  BaseScaffold? baseScaffold;
  @override
  Widget buildWidget() {
    baseScaffold ??= BaseScaffold(
        pBackgroundColor: Colors.red[900],
        pForegroundColor: Colors.white,
        pTitle: pageData.title,
        pLeading: pageData.leading,
        pPageCtrl: this,
        pBody: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
              pageData.message +
                  ((isNotNull(pageData.errorCode)) ? "\n(${pageData.errorCode!})" : ""),
              textAlign: TextAlign.center,
              style:
                  const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600)),
          VerticalSpacer(pHeight: 20.h),
          pageData.icon,
        ])));
    return baseScaffold!;
  }
}
