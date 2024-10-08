// Accés principal a l'aplicació.
// createdAt: 24/07/18 dj. JIQ

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ld_learn/09_tools/index.dart';

import 'application.dart';

// Programa principal.
void main() async {
  var widgetBins = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBins);

  // Carrega totes les traduccions de l'aplicació.
  loadUiTexts();

  // Inicialitza el Magatzem segur del dispositiu.
  SecureStorage();

  // // Initialize GRPC service
  // await GrpcService.initialize();

  // // Initialize synchronization service
  // await SynchronizationService.initialize();

  runApp(const Application());
  
  FlutterNativeSplash.remove();
}
