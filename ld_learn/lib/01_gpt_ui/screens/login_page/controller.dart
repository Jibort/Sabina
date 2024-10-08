// Control·lador de la pàgina de Login
// createdAt: 24/10/07 dl. GPT(JIQ)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_learn/01_gpt_ui/screens/login_page/index.dart';
import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/01_ui/routes.dart';
import 'package:ld_learn/09_tools/index.dart';
import 'package:ld_learn/consts.dart';  // Importem les constants

class LoginPageCtrl extends BaseController {
  // CONSTANTS ------------------------
  static final int wgtLoginButton = WidgetKey.custom.idx + 1;

  // CONSTRUCTORS ---------------------
  LoginPageCtrl() : super(pState: LoginPageData());

  // CICLE DE VIDA --------------------
  @override
  void onInit() {
    addWidgets([WidgetKey.appBar, WidgetKey.appBarProgress, wgtLoginButton]);
    super.onInit();
  }

  // GETTERS i SETTERS ----------------
  LoginPageData get pageData => super.state as LoginPageData;

  // LÒGICA DEL CONTROL·LADOR ---------
  void login() async {
    setPreparing();

    // Simulem la validació del login
    if (pageData.username == 'admin' && pageData.password == '1234') {
      Get.offAndToNamed(rtHomePage); // Redirigim a la pàgina principal
    } else {
      pageData.errorMessage = 'Nom d\'usuari o contrasenya incorrectes';
      setLoaded(null);  // Assegurem que passem 'null' quan no hi ha excepció
    }
  }

  // CÀRREGA DE DADES -----------------
  @override
  Future<void> loadData() async {
    if (!isNew) return;
    setPreparing();

    LoadStep step;

    // Simulació de la lectura de dades des de l'emmagatzematge segur
    await SecureStorage.to.read(ssUsernameKey).then((val) {
      pageData.username = val ?? '';  // Fem servir la constant ssUsernameKey
    });

    setLoading();
    await pageData.runSteps().then((pLEx) {
      List<dynamic> args = pLEx.$1;
      Exception? exc = pLEx.$2;
      setLoaded(exc ?? null);  // Passem explícitament 'null' si no hi ha excepció
    });
  }

  // CONSTRUCCIÓ DEL WIDGET -----------  
  @override
  Widget buildWidget() {
    return BaseScaffold(
      pPageCtrl: this,
      pTitle: 'Inici de Sessió',
      pBody: _buildLoginForm(),
    );
  }

  // Construcció del formulari de login
  Widget _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(labelText: 'Nom d\'usuari'),
            onChanged: (value) => pageData.username = value,
          ),
          const TextField(
            decoration: InputDecoration(labelText: 'Contrasenya'),
            obscureText: true,
            onChanged: (value) => pageData.password = value,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => login(),
            child: const Text('Iniciar Sessió'),
          ),
          GetBuilder<LoginPageCtrl>(
            id: wgtLoginButton,
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
