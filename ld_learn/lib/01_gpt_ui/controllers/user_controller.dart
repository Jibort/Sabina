// Control·lador per a la gestió dels usuaris en la interfície gràfica.
// CreatedAt: 24-10-06 dg. GPT(JIQ)

import 'package:get/get.dart';
import 'package:ld_learn/08_model/a_user/index.dart';

class UserController extends GetxController {
  var user = UsrUser().obs;

  void loginAsTherapist() {
    user.value = UsrUser(userType: UserType.therapist); // Assigna terapeuta
  }

  void loginAsPatient() {
    user.value = UsrUser(userType: UserType.patient); // Assigna pacient
  }

  UsrUser get currentUser => user.value;
}