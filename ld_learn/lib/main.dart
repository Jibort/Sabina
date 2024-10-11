// Accés principal a l'aplicació.
// createdAt: 24/10/11 dv. GPT(JIQ)

import 'package:flutter/material.dart';
import 'package:ld_learn/09_tools/index.dart';
import 'package:jailbreak_root_detection/jailbreak_root_detection.dart';
import 'application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Comprovació de Jailbreak o Root
  bool isJailbrokenOrRooted = await JailbreakRootDetection.jailbrokenOrRooted;
  if (isJailbrokenOrRooted) {
    runApp(JailbrokenScreen());
    return;
  }

  // Carrega totes les traduccions de l'aplicació.
  loadUiTexts();

  // Inicialitza el Magatzem segur del dispositiu.
  SecureStorage();

  runApp(const Application());
}

// Pantalla en cas de dispositiu Rootat o amb Jailbreak
class JailbrokenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(
          child: Text(
            "L'aplicació no es pot executar en dispositius rootats o amb jailbreak.",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
