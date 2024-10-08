// Definició de la pantalla de login.
// CreatedAt: 24-10-06 dg. GPT(JIQ)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Seleccioneu el tipus d'usuari", style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                userController.loginAsTherapist();
                Get.off(HomeScreen());
              },
              child: const Text("Sóc Terapeuta"),
            ),
            ElevatedButton(
              onPressed: () {
                userController.loginAsPatient();
                Get.off(HomeScreen());
              },
              child: const Text("Sóc Pacient"),
            ),
          ],
        ),
      ),
    );
  }
}
