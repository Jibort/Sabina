// Definició de la pantalla home.
// CreatedAt: 24-10-06 dg. GPT(JIQ)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';

class HomeScreen extends StatelessWidget {
  final UserController userCtrl = Get.find<UserController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Obx(() {
        // Mostra el contingut segons el tipus d'usuari
        if (userCtrl.currentUser.userType == UserType.therapist) {
          return const Center(child: Text("Benvingut Terapeuta!"));
        } else if (userCtrl.currentUser.userType == UserType.patient) {
          return const Center(child: Text("Benvingut Pacient!"));
        } else {
          return const Center(child: Text("Error: Tipus d'usuari desconegut"));
        }
      }),
    );
  }
}
