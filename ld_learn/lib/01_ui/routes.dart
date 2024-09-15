// Definició de totes les rutes de l'aaplicació.

import 'package:get/get.dart';

import 'package:ld_learn/01_ui/init_application.dart/index.dart';
import 'package:ld_learn/01_ui/home_page.dart/index.dart';
import 'package:ld_learn/01_ui/security_lock_page/index.dart';
import 'package:ld_learn/01_ui/crash_page/index.dart';

// Noms de totes les pàgines.
const String rtSecurityLockPage = "/securityLock";
const String rtCrashPage = "/crash";
const String rtInitApplication = '/initApplication';
const String rtHomePage = '/home';

// Llistat de totes les rutes.
List<GetPage<dynamic>> appPages = [
  // Crash Lock Page ---------------
  GetPage(
    name: rtCrashPage,
    binding: CrashPageBindings(),
    page: () => const CrashPage(),
  ),

  // Security Lock Page ---------------
  GetPage(
    name: rtSecurityLockPage,
    binding: SecurityLockPageBindings(),
    page: () => const SecurityLockPage(),
  ),

  // Init Application Page ------------
  GetPage(
    name: rtInitApplication,
    binding: InitApplicationBindings(),
    page: () => const InitApplicationPage(),
  ),
  // Home Page ------------------------
  GetPage(
    name: rtHomePage,
    binding: HomePageBindings(),
    page: () => const HomePage(),
  ),
];
