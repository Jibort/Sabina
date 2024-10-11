// Controlador de l'usuari connectat
// createdAt: 24/10/07 dl. GPT(JIQ)

import 'package:get/get.dart';
import 'package:ld_learn/08_model/a_user/USRMOD/usr_user.dart';

class UserController extends GetxController {
  late UsrUser user;  // Instància de l'usuari que està connectat

  // Inicialització del controlador
  @override
  void onInit() {
    super.onInit();
    // Això és només un exemple, necessitaràs adaptar la inicialització segons l'ús real de UsrUser
    user = UsrUser.empty();  // Aquí pots inicialitzar segons necessitis
  }

  // Mètode per actualitzar l'usuari
  void setUser(UsrUser newUser) {
    user = newUser;
    update();  // Notifiquem als widgets que depenen de l'usuari
  }

  // Recuperació de les dades de l'usuari
  UsrUser getUser() {
    return user;
  }
}
