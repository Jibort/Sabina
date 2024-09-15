// Definició del Widget arrel.
// createdAt: 24/07/18 dj. JIQ

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ld_learn/01_ui/init_application.dart/index.dart';
import 'package:ld_learn/10_localization/index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '01_ui/routes.dart';
import 'consts.dart';

// Widget arrel de l'aplicació.
class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        ensureScreenSize: true,
        designSize: iPhone8PlusSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: localeES,
            fallbackLocale: localeEN,
            supportedLocales: locales,
            getPages: appPages,
            initialBinding: InitApplicationBindings(),
            initialRoute: rtInitApplication,
            // initialBinding: HomePageBindings(),
            // initialRoute: rtHomePage,
            // initialBinding: SecurityLockPageBindings(),
            // initialRoute: rtSecurityLockPage,
          );
        });
  }
}

// Carrega totes les traduccions de la aplicació.
Future<void> loadUiTexts() async {
  Get.addTranslations({
    'ca': caLabels(),
    'en': enLabels(),
    'es': caLabels(),
    'fr': frLabels(),
    'pt': ptLabels(),
  });
}

// Llista de locales admesos per l'aplicació.
const List<Locale> locales = [
  localeES,
  localeCA,
  localeEN,
  localeFR,
  localePT,
];
