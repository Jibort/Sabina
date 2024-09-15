import 'dart:ui';

import 'package:get/get.dart' as g;
import 'package:ld_learn/10_localization/index.dart';
import 'package:ld_learn/consts.dart';

// Conjunt de mapes de traduccions.
class Translations extends g.Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'es': esLabels(),
        'ca': caLabels(),
        'en': enLabels(),
        'fr': frLabels(),
        'pt': ptLabels(),
      };
}

Locale dyn2Locale(dynamic pLocale) {
  switch (pLocale) {
    case String str:
      return Locale(str);

    case Locale loc:
      return loc;

    default:
      return localeES;
  }
}
