// createdAt: 24/07/18 dj. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_learn/01_ui/widgets/index.dart';

import '../../10_localization/index.dart';

class CrashPageData extends DeepDo {
  // MEMBRES --------------------------
  late final String _title;
  late final String _message;
  late final String? _errorCode;
  late ActionIcon? _leading;
  late Icon _icon;

  // CONSTRUCTORS ---------------------
  CrashPageData(
      {required String pTitle,
      required String pMsg,
      ActionIcon? pLeading,
      Icon? pIcon,
      String? pErrorCode})
      : _title = pTitle,
        _message = pMsg,
        _leading = pLeading,
        _icon = pIcon ?? const Icon(Icons.error),
        _errorCode = pErrorCode,
        super(null);

  CrashPageData.fromArgs() : super(null) {
    var args = Get.arguments;
    Map<String, dynamic> map = args as Map<String, dynamic>;
    _title = map['title'] ?? L.generalErrorTitle.tr;
    _message = map['msg'] ?? L.generalErrorMessage.tr;
    _leading = map['leading'] as ActionIcon?;
    _errorCode = map['errorCode'];
    _icon = (map['icon'] as Icon?) ?? const Icon(Icons.error);
  }

  // GETTERS i SETTERS ----------------
  String get title => _title;
  String get message => _message;
  ActionIcon? get leading => _leading;
  Icon get icon => _icon;
  String? get errorCode => _errorCode;

  Icon fgIconColor(Color? pColor) {
    _icon = Icon(_icon.icon, color: pColor ?? Colors.white, size: _icon.size);
    _leading?.fgIconColor(pColor);
    return _icon;
  }

  Icon iconSize(double? pSize) {
    _icon = Icon(_icon.icon, color: _icon.color, size: pSize ?? _icon.size);
    return _icon;
  }
}
