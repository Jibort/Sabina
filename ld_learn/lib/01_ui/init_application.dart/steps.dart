// Llista ordenada de pasos per a carregar la pàgina.
// createdAt: 24/07/28 dg. JIQ

import 'package:ld_learn/01_ui/load_steps.dart';

class Steps extends LoadSteps {
  Steps() {
    // Validació de seguretat...
    append(LoadStep(
        pIdx: "01",
        pTitle: "Validació de seguretat",
        pDesc: "Es comprova que el dispositiu no estigui rootat."));

    // Validació d'accès a Internet...
    append(LoadStep(
        pIdx: "02",
        pTitle: "Validació d'accès a Internet",
        pDesc: "Es comprova que el dispositiu tingui accés a Internet."));

    // Iniciem SecuredStorage...
    append(LoadStep(
        pIdx: "03",
        pTitle: "Iniciem SecuredStorage",
        pDesc: "Iniciem el magatzem segur i preparem les claus bàsiques."));

    // Clau: ssRandomSeq...
    append(LoadStep(
        pIdx: "03.01",
        pTitle: "Clau: ssRandomSeq",
        pDesc: "Determinem si és la primera execució i preparem ssRandomSeq."));

    // Clau: ssDbPass...
    append(LoadStep(
        pIdx: "03.02",
        pTitle: "Clau: ssDbPass",
        pDesc: "Preparem la disponibilitat de la clau de pas de la base de dades."));

    // Obrim la base de dades...
    append(LoadStep(
        pIdx: "04",
        pTitle: "Obrim la base de dades",
        pDesc: "Establim la connexió a la base de dades local."));

    // Obrim la sessió amb Firebase...
    append(LoadStep(
        pIdx: "05",
        pTitle: "Establim connexió amb Firebase",
        pDesc: "Obrim connexió amb Firebase i carreguem el FCB Tokem actual."));
  }
}
