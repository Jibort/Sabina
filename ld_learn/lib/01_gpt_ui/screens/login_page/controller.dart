// Control·lador de la pàgina de Login.
// createdAt: 24/10/11 dv. GPT(JIQ)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data.dart';
import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/01_ui/routes.dart';
import 'package:ld_learn/09_tools/index.dart';
import 'package:ld_learn/01_ui/load_steps.dart';
import 'package:ld_learn/08_model/a_user/index.dart';

class LoginPageController extends BaseController {
  // CONSTANTS ------------------------
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UsrUser? currentUser;

  // CONSTRUCTORS ---------------------
  LoginPageController() : super(pState: LoginPageData());

  // CICLE DE VIDA --------------------
  @override
  void onInit() {
    super.onInit();
    addWidgets([WidgetKey.appBar, WidgetKey.appBarProgress]);
    checkAutoLogin();
  }

  // GETTERS i SETTERS ----------------
  LoginPageData get pageData => super.state as LoginPageData;

  // CÀRREGA DE DADES -----------------
  @override
  Future<void> loadData() async {
    if (!isNew) return;
    setPreparing();

    LoadStep step;

    // Carrega l'auto-login només per pacients
    step = LoadStep(pIdx: "01.01", pTitle: "Comprovant auto-login");
    pageData.addFn((FiFo pQueue, List<dynamic> pArgs) async {
      var autoLoginEnabled = await SecureStorage.to.read(ssAutoLoginEnabled) ?? false;
      pageData.isAutoLoginEnabled = autoLoginEnabled;
      notify();
      return null;
    }, pLoadStep: step);

    // Executar els passos de càrrega
    setLoading();
    await pageData.runSteps().then((pLEx) {
      setLoaded(pLEx.$2);
    });
  }

  // FUNCIONALITATS DEL LOGIN ---------
  void loginWithPassword(String email, String password) async {
    bool success = await loginService.login(email, password);
    if (success) {
      currentUser = await userService.getUserByEmail(email);

      // Oferir la biometria per a tots els usuaris
      if (await localAuth.canCheckBiometrics) {
        pageData.isBiometricEnabled = await SecureStorage.to.read(ssBiometricEnabled) ?? false;
      }

      Get.offAndToNamed(rtHomePage);
    }
  }

  void loginWithBiometrics() async {
    bool authenticated = await localAuth.authenticate();
    if (authenticated) {
      String email = await SecureStorage.to.read(ssEmail);
      String password = await SecureStorage.to.read(ssPassword);
      await loginService.login(email, password);
      Get.offAndToNamed(rtHomePage);
    }
  }

  void enableAutoLogin(bool enable) async {
    if (currentUser?.userType == UserType.patient) {
      await SecureStorage.to.write(ssAutoLoginEnabled, enable);
    }
  }

  // CONSTRUCCIÓ DEL WIDGET -----------  
  @override
  Widget buildWidget() {
    return BaseScaffold(
      pTitle: 'Login',
      pPageCtrl: this,
      pBody: SingleChildScrollView(
        child: Column(
          children: [
            _buildEmailField(),
            _buildPasswordField(),
            ElevatedButton(
              onPressed: () {
                loginWithPassword(emailController.text, passwordController.text);
              },
              child: const Text("Login"),
            ),
            if (pageData.isBiometricEnabled)
              ElevatedButton(
                onPressed: loginWithBiometrics,
                child: const Text("Login amb biometria"),
              ),
            if (currentUser?.userType == UserType.patient)
              SwitchListTile(
                title: const Text("Activar auto-login"),
                value: pageData.isAutoLoginEnabled,
                onChanged: (bool value) {
                  enableAutoLogin(value);
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextField(
      controller: emailController,
      decoration: const InputDecoration(labelText: "Email"),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: passwordController,
      obscureText: true,
      decoration: const InputDecoration(labelText: "Password"),
    );
  }
}
