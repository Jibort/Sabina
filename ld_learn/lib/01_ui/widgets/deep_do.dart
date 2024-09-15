// Classe base per a les dades necessàries en cada pàgina.
// createdAt: 24/07/18 dj. JIQ

// ignore_for_file: avoid_init_to_null

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_learn/01_ui/load_steps.dart';
import 'package:ld_learn/01_ui/routes.dart';
import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/09_tools/index.dart';
import 'package:ld_learn/10_localization/index.dart';

// Definició de tipus -----------------
// Funció per a la gestió de les excepcions dins un FnStep.
// Retorna una possible excepció i un booleà que determina si s'ha de continuar
// executant la llista de passes.
typedef FnExc = Future<(Exception?, bool)> Function(Exception? pExc);
typedef FnStep = Future<Exception?> Function(FiFo pQueue, List<dynamic> pArgs);
typedef FnThen = Exception? Function(FiFo pQueue);
Symbol empty = const Symbol("null");
typedef FnPair = (FnStep, dynamic);

// Estat d'una pàgina.
class DeepDo {
  // MEMBRES --------------------------
  Function(FiFo pQueue)? _onAltered;
  final _queue = FiFo();
  int _length = 0;
  int _dids = 0;

  // GETTERS i SETTERS ----------------
  FiFo get queue => _queue;
  int get length => _length;
  int get dids => _dids;
  double? get ratio {
    double? rat;
    rat = (length == 0 || dids == 0) ? null : dids / length;
    if (isNotNull(rat)) {
      if (rat! > 1.0) rat = 1.0;
      if (rat < 0.0) rat = 0;
    }
    return rat;
  }

  (int, int, double?) get stats => (length, dids, ratio);
  set onAltered(Function(FiFo pQueue)? pOnAltered) => _onAltered = pOnAltered;

  // CONSTRUCTORS ---------------------
  DeepDo(Function(FiFo pQueue)? pOnAltered) : _onAltered = pOnAltered;

  // GESTIÓ DE PASOS ------------------
  // Afegeix un pas a la pila de pasos.
  void addFn(FnStep pStep,
      {List<dynamic>? pArgs, FnThen? pThen, FnExc? pOnExc, LoadStep? pLoadStep}) {
    pushArgs(pArgs);
    if (isNotNull(pThen)) {
      _queue.push(pThen);
    }
    if (isNotNull(pOnExc)) {
      _queue.push(pOnExc);
    }
    if (isNotNull(pLoadStep) && kDebugMode) {
      _queue.push(pLoadStep);
    }
    _queue.push(pStep);
    _length += 1;
    if (isNotNull(_onAltered)) _onAltered!(_queue);
  }

  // Afegeix un pas a la pila de pasos que s'executarà immediatament si
  // la pàgina està carregada.
  Future<void> addFnNow(BaseController pCtrl, FnStep pStep,
      {List<dynamic>? pArgs, FnThen? pThen, FnExc? pOnExc, LoadStep? pLoadStep}) async {
    addFn(pStep, pArgs: pArgs, pThen: pThen, pOnExc: pOnExc, pLoadStep: pLoadStep);
    if (pCtrl.isLoaded) await runSteps();
  }

  // Avantpasa un pas al principi de la pila de pasos.
  void sneakFn(FnStep pStep,
      {List<dynamic>? pArgs, FnThen? pThen, FnExc? pOnExc, LoadStep? pLoadStep}) {
    _queue.sneak(pStep);
    _length += 1;

    if (isNotNull(pOnExc)) {
      _queue.sneak(pOnExc);
    }
    if (isNotNull(pLoadStep) && kDebugMode) {
      _queue.sneak(pLoadStep);
    }
    if (isNotNull(pThen)) {
      _queue.sneak(pThen);
    }
    sneakArgs(pArgs);
    if (isNotNull(_onAltered)) _onAltered!(_queue);
  }

  // GESTIÓ DE LA PILA DE PARÀMETRES --
  void pushArgs(List<dynamic>? pArgs) {
    if (isNotNull(pArgs)) {
      for (var arg in pArgs!.reversed) {
        _queue.push(arg);
      }
    }
  }

  void sneakArgs(List<dynamic>? pArgs) {
    if (isNotNull(pArgs)) {
      for (var arg in pArgs!.reversed) {
        _queue.sneak(arg);
      }
    }
  }

  dynamic popQueue() => _queue.pop();

  // EXECUCIÓ DELS PASSOS -------------
  Future<(List<dynamic>, Exception?)> runSteps() async {
    final args = <dynamic>[];
    FnThen? fthen;
    FnExc? fexc;
    dynamic obj = _queue.pop();
    Exception? exc = null;

    while (isNotNull(obj)) {
      switch (obj) {
        case LoadStep loadStep:
          (isNotNull(loadStep.description)) ? Debug.debug(10, '''
Step[${loadStep.index}]: ${loadStep.title}
    ${loadStep.description}
''') : Debug.debug(10, "Step[${loadStep.index}]: ${loadStep.title}");
          break;
        case FnThen fnThen:
          fthen = fnThen;
          break;
        case FnExc fnExc:
          fexc = fnExc;
          break;
        case FnStep fnStep:
          bool contn = false;
          exc = (isNotNull(fthen))
              ? await fnStep(_queue, args).then((_) => fthen!(_queue))
              : await fnStep(_queue, args);
          if (isNotNull(exc)) {
            if (isNotNull(fexc)) (exc, contn) = await fexc!(exc);
            if (!contn && isNotNull(exc)) {
              Get.offAndToNamed(rtCrashPage, arguments: {
                'title': L.generalErrorTitle.tr,
                'msg': exc.toString(),
                'leading': ActionIcon.byIcon(Icons.surfing_sharp),
                'errorCode': exc.runtimeType.toString(),
                'icon': const Icon(Icons.error_outline),
              });
              return ([], exc);
            }
          }
          args.clear();
          fthen = null;
          fexc = null;
          _dids += 1;
          if (isNotNull(_onAltered)) _onAltered!(_queue);
          break;
        case Symbol symb:
          if (symb == #empty) args.add(null);
          break;
        case dynamic arg:
          args.add(arg);
          break;
      }
      obj = _queue.pop();
    }

    return (args, exc);
  }

  // NETEJA ----------------------------------
  void reset() {
    _queue.clear();
    _length = 0;
    _dids = 0;
  }
}
