// createdAt: 24/07/20 ds. JIQ

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionIcon extends StatelessWidget {
  // MEMBRES --------------------------
  IconButton _icon;
  IconData _iconData;
  double? _size;
  Color? _color;
  final VoidCallback? _onPressed;

  // CONSTRUCTORS ---------------------
  ActionIcon.byIcon(IconData pIcon, {dynamic pKey})
      : this(pIcon, key: pKey, pSize: 30.h, pOnPressed: () {});

  ActionIcon(
    IconData pIcon, {
    super.key,
    double? pSize,
    Color? pFgColor,
    required VoidCallback? pOnPressed,
  })  : _iconData = pIcon,
        _onPressed = pOnPressed,
        _size = pSize,
        _color = pFgColor,
        _icon = IconButton(
            onPressed: pOnPressed,
            icon: Icon(
              pIcon,
              size: pSize ?? 30.h,
              color: pFgColor ?? Colors.black,
            ));

  // BUILDER --------------------------
  @override
  Widget build(BuildContext context) {
    return _icon;
  }

  // MODIFICADORS ---------------------
  IconButton fgIconColor(Color? pColor) {
    _icon = IconButton(
        onPressed: _onPressed,
        icon: Icon(
          _iconData,
          size: _size ?? 30.h,
          color: pColor ?? _color,
        ));
    return _icon;
  }

  IconButton iconSize(double? pSize) {
    _icon = IconButton(
        onPressed: _onPressed,
        icon: Icon(
          _iconData,
          size: pSize ?? _size,
          color: _color,
        ));
    return _icon;
  }
}
