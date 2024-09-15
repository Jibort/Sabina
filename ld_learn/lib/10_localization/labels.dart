// Llistat de les constants de text per a la traducció de l'aplicació.
// createdAt: 24/07/18 dj. JIQ

import 'package:get/get.dart';

class L {
  static const String hello = "hello";
  static const String welcome = "welcome";
  static const String settings = "settings";
  static const String language = "language";
  static const String of = "of";
  static const String progression = "progression";
  static const String loading = "loading";
  static const String loadingPage = "loadingPage";
  static const String fcmTokenIs = "fcmTokenIs";
  static const String authenticate = "authenticate";
  static const String lockedApplication = "lockedApplication";
  static const String appLockMessage = "appLockMessage";
  static const String generalErrorTitle = "generalErrorTitle";
  static const String generalErrorMessage = "generalErrorMessage";
  static const String noInternetConnection = "noInternetConnection";
}

extension UpDown on String {
  String get up => capitalizeFirst ?? "";
}
