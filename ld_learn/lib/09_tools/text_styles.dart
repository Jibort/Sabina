// Conjunt d'estils de text de l'aplicació.
// createdAt: 24/07/21 dg. JIQ

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'theme.dart';

TextStyle txsAppBarMainTitleStyle({Color? pFgColor}) {
  return TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 22.h,
    fontStyle: FontStyle.normal,
    color: pFgColor ?? appBarFgColor,
    fontFamily: 'Roboto',
  );
}

TextStyle txsAppBarTitleStyle({Color? pFgColor}) {
  return TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 18.h,
    fontStyle: FontStyle.normal,
    color: pFgColor ?? appBarFgColor,
    fontFamily: 'Roboto',
  );
}

TextStyle txsAppBarSubtitleStyle({Color? pFgColor}) {
  return TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12.h,
    fontStyle: FontStyle.normal,
    color: pFgColor ?? appBarFgColor,
    fontFamily: 'Roboto',
  );
}

TextStyle txsAppBarProgressionTitleStyle({Color? pFgColor}) {
  return TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14.h,
    fontStyle: FontStyle.normal,
    backgroundColor: Colors.transparent,
    color: pFgColor ?? Colors.black,
    fontFamily: 'Roboto',
  );
}

TextStyle txsAppBarProgressionSubtitleStyle({Color? pFgColor}) {
  return TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12.h,
    fontStyle: FontStyle.normal,
    backgroundColor: Colors.transparent,
    color: pFgColor ?? Colors.black,
    fontFamily: 'Roboto',
  );
}
