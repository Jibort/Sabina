// Barra de progressió per a la capçalera d'una pàgina.
// createdAt: 24/07/21 dg. JIQ

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ld_learn/01_ui/widgets/base_controller.dart';

class LineProgression extends GetWidget {
  // MEMBRES --------------------------
  final BaseController _pageCtrl;
  final Color _bgColor;
  final Color _fgColor;

  // CONSTRUCTORS ---------------------
  const LineProgression(
      {super.key,
      required BaseController pPageCtrl,
      Color? pBgColor,
      Color? pFgColor})
      : _pageCtrl = pPageCtrl,
        _bgColor = pBgColor ?? Colors.white,
        _fgColor = pFgColor ?? Colors.black;

  @override
  Widget build(BuildContext context) {
    double? ratio;
    (_, _, ratio) = _pageCtrl.state.stats;
    return Padding(
        padding: EdgeInsetsGeometry.infinity,
        child: LinearProgressIndicator(
          minHeight: 5.h,
          backgroundColor: _bgColor,
          valueColor: AlwaysStoppedAnimation<Color>(_fgColor),
          value: ratio,
        ));
  }
}
