// Control·lador de la pàgina Home.
// createdAt: 24/07/18 dj. JIQ

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_learn/01_ui/security_lock_page/index.dart';
import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ld_learn/10_localization/index.dart';

class SecurityLockPageCtrl extends BaseController {
  // CONSTANTS ------------------------
  static final int wgtCounter = WidgetKey.custom.idx + 1;
  static final int wgtListView = wgtCounter + 1;

  // CONSTRUCTORS ---------------------
  SecurityLockPageCtrl() : super(pState: SecurityLockPageData());

  // CICLE DE VIDA --------------------
  @override
  void onInit() {
    addWidgets([WidgetKey.appBar, WidgetKey.appBarProgress, wgtCounter, wgtListView]);
    super.onInit();
  }

  // GETTERS i SETTERS ----------------
  SecurityLockPageData get pageData => super.state as SecurityLockPageData;

  // LÒGICA DEL CONTROL·LADOR ---------

  // CÀRREGA DE DADES -----------------
  @override
  Future<void> loadData() async {
    if (!isNew) return;
    setLoaded(null);
  }

  // CONSTRUCCIÓ DEL WIDGET -----------
  BaseScaffold? baseScaffold;
  @override
  Widget buildWidget() {
    baseScaffold ??= BaseScaffold(
        pBackgroundColor: Colors.red[900],
        pForegroundColor: Colors.white,
        pTitle: L.lockedApplication.tr,
        pLeading: ActionIcon(
          Icons.lock_person_outlined,
          pOnPressed: () {},
          pFgColor: Colors.white,
        ),
        pPageCtrl: this,
        pBody: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(L.appLockMessage.tr,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600)),
          VerticalSpacer(pHeight: 20.h),
          Icon(Icons.error_outline_rounded, weight: 20.w, color: Colors.white, size: 150.h),
        ])));
    return baseScaffold!;
  }
}
