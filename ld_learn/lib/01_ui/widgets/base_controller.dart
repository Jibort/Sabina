// Emcapsulament dels control·ladors oferts per GetX.
// createdAt: 24/07/18 dj. JIQ

// ignore_for_file: unnecessary_overrides, avoid_init_to_null, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ld_learn/01_ui/widgets/index.dart';

// Estats de la càrrega de dades per a la pàgina.
enum LoadState {
  isNew,
  isPreparing,
  isLoading,
  isLoaded,
  isPreparingAgain,
  isLoadingAgain,
  isError,
}

// Classe base de tots els control·ladors de l'aplicació.
abstract class BaseController<D extends DeepDo> extends GetxController {
  static int bcCounter = 0;

  // MEMBRES --------------------------
  // Estat de la càrrega de la pàgina.
  LoadState _loadState = LoadState.isNew;

  // Dades de la pàgina.
  final D _state;
  bool clock = false;
  int _bcc;

  // Llista de widgets a actualitzar.
  final List<int> wgIds = <int>[];

  // Diferent de nul només si l'estat de la càrrega es isError.
  Exception? _exception = null;

  // Comptador de càrregues de dades.
  int _loadCounter = 0;

  // CONSTRCTORS ----------------------
  BaseController({required D pState})
      : _state = pState,
        _bcc = ++bcCounter;

  // GETTERS i SETTERS ----------------
  int get controllerId => _bcc;
  D get state => _state;

  // Retorna el número de cops que s'ha executat la càrrega.
  int get loadCounter => _loadCounter;

  // Només cert quan el control·lador ha de començar a carregar dades.
  bool get isNew => (_loadState == LoadState.isNew);

  // Només cert quan s'està preparant la càrrega.
  bool get isPreparing => (_loadState == LoadState.isPreparing);

  // Només cert quan s'està carregant dades.
  bool get isLoading => (_loadState == LoadState.isLoading);

  // Només cert quan les dades han estat carregades.
  bool get isLoaded => (_loadState == LoadState.isLoaded);

  // Només cert quan s'està tornant a preparar una càrrega.
  bool get isPreparingAgain => (_loadState == LoadState.isPreparingAgain);

  // Només cert quan s'està tornant a carregar dades.
  bool get isLoadingAgain => (_loadState == LoadState.isLoadingAgain);

  // Només cert quan ha succeït una excepció en la càrrega de dades.
  bool get isError => (_loadState == LoadState.isError);

  // Retorna l'excepció que ha succeït en la càrrega de dades.
  Exception? get exception => _exception;

  // Estableix que la càrrega s'està preparant.
  void setPreparing() {
    _loadState = (_loadCounter == 0) ? LoadState.isPreparing : LoadState.isPreparingAgain;
    notify();
  }

  // Estableix que la càrrega s'està executant.
  void setLoading() {
    _loadState = (_loadCounter == 0) ? LoadState.isLoading : LoadState.isLoadingAgain;
    notify();
  }

  // Estableix que la càrrega s'ha completat.
  void setLoaded(Exception? pExc) {
    _exception = pExc;

    _loadState = LoadState.isLoaded;
    _loadCounter += 1;
    notify();
  }

  // Estableix que la càrrega s'està tornant a preparar.
  void setPreparingAgain() {
    _loadState = LoadState.isPreparingAgain;
    notify();
  }

  // Estableix que la càrrega s'està tornant a executar.
  void setLoadingAgain() {
    _loadState = LoadState.isLoadingAgain;
    notify();
  }

  // Estableix que la càrrega s'ha completat amb error.
  void setError(Exception pExc) {
    _exception = pExc;
    _loadState = LoadState.isError;
    notify();
  }

  // Reinicia l'estat original de càrrega.
  void reset() {
    _state.reset();
    _exception = null;
    _loadState = LoadState.isNew;
    _loadCounter = 0;
    loadData();
    notify();
  }

  // GESTIÓ DEL LLISTAT DE WIDGETS ----
  void addWidgets(List<dynamic> pWgIds) {
    for (dynamic wgId in pWgIds) {
      if (wgId is int) {
        if (!wgIds.contains(wgId)) wgIds.add(wgId);
      } else if (wgId is WidgetKey) {
        if (!wgIds.contains(wgId.index)) wgIds.add(wgId.idx);
      }
    }
  }

  // ACTUALITZACIÓ DELS GETBUILDERS ---
  void notify({List<int>? pTargets}) {
    List<int> targets = pTargets ?? wgIds;
    clock = !clock;
    for (int wgId in targets) {
      update([wgId], true);
    }
  }

  // CÀRREGA DE DADES -----------------
  Future<void> loadData();

  // CREACIÓ DELS WIDGETS -------------
  Widget buildWidget();

  // CICLE DE VIDA --------------------
  @override
  @mustCallSuper
  // Cridat immediatament després que el widget ocupa el seu espai a memòria.
  void onInit() {
    super.onInit();
    loadData();
  }

  @override
  @mustCallSuper
  // Cirdat 1 frame després d'onInit().
  void onReady() {
    super.onReady();
  }

  @override
  @mustCallSuper
  // Cridat abans d'onDelete.
  // Es pot fer servir per a alliberar recursos usats pel cotrol·lador.
  void onClose() {
    super.onClose();
  }
}
