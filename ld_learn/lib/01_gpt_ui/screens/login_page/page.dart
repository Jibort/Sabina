// Definició de la pàgina per a situacions de Crash.
// createdAt: 24/10/07 dl. GPT(JIQ)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_learn/01_ui/widgets/index.dart';

import 'index.dart';

class LoginPage extends GetView<LoginPageCtrl> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      pPageCtrl: controller,
      pTitle: 'Inici de Sessió',
      pBody: _buildLoginForm(),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Nom d\'usuari'),
            onChanged: (value) => controller.pageData.username = value,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Contrasenya'),
            obscureText: true,
            onChanged: (value) => controller.pageData.password = value,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => controller.login(),
            child: const Text('Iniciar Sessió'),
          ),
          GetBuilder<LoginPageCtrl>(
            builder: (ctrl) {
              if (ctrl.pageData.errorMessage != null) {
                return Text(ctrl.pageData.errorMessage!,
                    style: const TextStyle(color: Colors.red));
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
