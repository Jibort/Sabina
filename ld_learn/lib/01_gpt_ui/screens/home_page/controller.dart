// Control·lador de la pàgina Home
// createdAt: 24/10/08 dt. GPT(JIQ)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_learn/01_ui/load_steps.dart';
import 'data.dart';
import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/01_ui/routes.dart';
import 'package:ld_learn/consts.dart';
import 'package:ld_learn/09_tools/index.dart';

class HomePageController extends BaseController {
  // CONSTANTS ------------------------
  static final int wgtCounter = WidgetKey.custom.idx + 1;

  // CONSTRUCTORS ---------------------
  HomePageController() : super(pState: HomePageData());

  // CICLE DE VIDA --------------------
  @override
  void onInit() {
    addWidgets([WidgetKey.appBar, WidgetKey.appBarProgress, wgtCounter]);
    super.onInit();
  }

  // GETTERS i SETTERS ----------------
  HomePageData get pageData => super.state as HomePageData;

  // LÒGICA DEL CONTROL·LADOR ---------
  void incrementCounter() async {
    await SecureStorage.to.write(ssCounter, (pageData.counter ?? 0) + 1).then((_) {
      Get.offAndToNamed(rtHomePage);
    });
  }

  // CÀRREGA DE DADES -----------------
  @override
  Future<void> loadData() async {
    if (!isNew) return;
    setPreparing();

    LoadStep step;

    // Pas per carregar el comptador des de SecureStorage
    step = LoadStep(pIdx: "01.01", pTitle: "Carregant comptador");
    pageData.addFn((FiFo pQueue, List<dynamic> pArgs) async {
      try {
        var counter = await SecureStorage.to.read(ssCounter);
        pageData.counter = counter ?? 0;
        notify();  // Actualitzem la UI amb les dades carregades
      } catch (e) {
        return Exception('Error carregant el comptador: $e');
      }
      return null;  // Indiquem que no hi ha hagut cap error
    }, pLoadStep: step);

    // Executem els passos de càrrega
    setLoading();
    await pageData.runSteps().then((pLEx) {
      setLoaded(pLEx.$2);  // Gestionem l'excepció (si n'hi ha)
    });
  }

  // CONSTRUCCIÓ DEL WIDGET -----------  
  @override
  Widget buildWidget() {
    return BaseScaffold(
      pPageCtrl: this,
      pTitle: 'Pàgina Principal',
      pBody: SingleChildScrollView(
        child: GetBuilder<HomePageController>(
          id: wgtCounter,
          init: this,
          builder: (HomePageController pCtrl) => _wgtCounter(pCtrl)
        )
      )
    );
  }

  Widget _wgtCounter(HomePageController pCtrl) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Text("Comptador: ${pageData.counter}"),
          ElevatedButton(
            onPressed: incrementCounter,
            child: const Text("Incrementar comptador"),
          ),
        ],
      ),
    );
  }
}
