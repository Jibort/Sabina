// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/09_tools/theme.dart';

class BaseScaffold extends Scaffold {
  Color foregroundColor;
  BaseScaffold({
    super.key,
    required BaseController pPageCtrl,
    required Widget? pBody,
    required String pTitle,
    String? pSubTitle,
    ActionIcon? pLeading,
    super.floatingActionButton,
    super.drawer,
    super.bottomNavigationBar,
    super.bottomSheet,
    Color? pBackgroundColor,
    Color? pForegroundColor,
    bool super.resizeToAvoidBottomInset = true,
  })  : foregroundColor = pForegroundColor ?? scaffoldFgColor,
        super(
            backgroundColor: pBackgroundColor ?? scaffoldBgColor,
            appBar: BaseAppBar(
              pBgColor: pBackgroundColor ?? scaffoldBgColor,
              pFgColor: pForegroundColor ?? scaffoldFgColor,
              pTitle: pTitle,
              pSubTitle: pSubTitle,
              pLeading: pLeading,
              pPageCtrl: pPageCtrl,
            ),
            body: pBody);
}
