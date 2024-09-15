// Control·lador de la pàgina Home.
// createdAt: 24/07/18 dj. JIQ

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ld_learn/01_ui/load_steps.dart';
import 'package:ld_learn/01_ui/routes.dart';

import 'package:ld_learn/08_model/album.dart';
import 'package:ld_learn/01_ui/home_page.dart/index.dart';
import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ld_learn/09_tools/index.dart';
import 'package:ld_learn/consts.dart';

class HomePageCtrl extends BaseController {
  // CONSTANTS ------------------------
  static final int wgtCounter = WidgetKey.custom.idx + 1;
  static final int wgtListView = wgtCounter + 1;

  // CONSTRUCTORS ---------------------
  HomePageCtrl() : super(pState: HomePageData());

  // CICLE DE VIDA --------------------
  @override
  void onInit() {
    addWidgets([WidgetKey.appBar, WidgetKey.appBarProgress, wgtCounter, wgtListView]);
    super.onInit();
  }

  // GETTERS i SETTERS ----------------
  HomePageData get pageData => super.state as HomePageData;

  // LÒGICA DEL CONTROL·LADOR ---------
  void incrementCounter() async {
    await SecureStorage.to.write(ssCounter, (pageData.counter ?? 0) + 1).then((_) {
      Get.offAndToNamed(rtHomePage);
      // pageData.reset();
      // reset();
    });
  }

  // CÀRREGA DE DADES -----------------
  @override
  Future<void> loadData() async {
    if (!isNew) return;
    setPreparing();

    LoadStep step;

    await SecureStorage.to.read(ssCounter).then((val) {
      pageData.counter = val ?? 0;
    });

    for (var idx = 1; idx < 6; idx += 1) {
      // Encua la càrrega del HTTP Àlbum .....
      step = LoadStep(pIdx: "01.$idx.", pTitle: "Càrrega del HTTP Àlbum");
      pageData.addFn((FiFo pQueue, List<dynamic> pArgs, {int? loadAlbumHttp}) async {
        if (pArgs.isEmpty) throw "Falta un paràmetre per a la crida!!";
        var aid = pArgs.first as int;
        var hresp = await http.get(Uri.parse('$httpAlbum/$aid'));
        pQueue.sneak(hresp);
        notify();
        return null;
      }, pArgs: [idx], pLoadStep: step);
      notify();

      // Encua la interpretació de la resposta Http .....
      step = LoadStep(pIdx: "02.$idx.", pTitle: "Interpretació de la resposta Http Àlbum");
      pageData.addFn((FiFo pQueue, List<dynamic> pArgs, {int? buildAlbumMap}) async {
        if (pArgs.isEmpty) throw "Falta un paràmetre per a la crida!!";
        var hresp = pArgs.first as http.Response;
        Map<String, dynamic> map = jsonDecode(hresp.body);
        pQueue.sneak(map);
        notify();
        return null;
      }, pLoadStep: step);
      notify();

      // Encua la creació de l'àlbum .....
      Album? album;
      step = LoadStep(pIdx: "03.$idx.01.", pTitle: "Creació de l'àlbum");
      pageData.addFn((FiFo pQueue, List<dynamic> pArgs, {int? buildAlbum}) async {
        if (pArgs.isEmpty) throw "Falta un paràmetre per a la crida!!";
        var map = pArgs.first as Map<String, dynamic>;
        album = Album.fromJson(map);
        LoadStep subStep =
            LoadStep(pIdx: "03.$idx.02.", pTitle: "Càrrega del comentari de l'Àlbum");
        pageData.sneakFn((FiFo pQueue, List<dynamic> pArgs, {int? queueCommentLoad}) async {
          (pArgs.first as Album).loadComment(pCtrl: this, pData: pageData);
          return null;
        }, pArgs: [album], pLoadStep: subStep);
        Debug.debug(0, "Carregat àlbum ${album!.id ?? "!?"}");
        notify();
        return null;
      }, pThen: (FiFo pQueue) {
        pageData.addAlbum = album!;
        notify();
        return null;
      }, pLoadStep: step);
      notify();
    }

    setLoading();
    await pageData.runSteps().then((pLEx) {
      List<dynamic> args = pLEx.$1;
      Exception? exc = pLEx.$2;
      Debug.warn("VVVVVVV: ${args.length}");
      setLoaded(exc);
      // JIQ: notify();
    });
    notify();
  }

  // CONSTRUCCIÓ DEL WIDGET -----------
  BaseScaffold? baseScaffold;
  @override
  Widget buildWidget() {
    baseScaffold ??= BaseScaffold(
        pTitle: 'Pàgina Principal',
        pSubTitle: 'Això sembla rutllar!',
        pPageCtrl: this,
        pBody: SingleChildScrollView(
            clipBehavior: Clip.hardEdge,
            child: GetBuilder<HomePageCtrl>(
                id: wgtCounter, init: this, builder: (HomePageCtrl pCtrl) => _wgtCounter(pCtrl))));

    return baseScaffold!;
  }

  Widget? _widgetWgtCounter;
  Widget _wgtCounter(HomePageCtrl pCtrl) {
    _widgetWgtCounter = (pCtrl.isNew)
        ? Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(children: [
              const Text("IS_NEW !!"),
              VerticalSpacer(pHeight: 20.h),
              const Text("SENSE COMPTADOR"),
            ]))
        : (pCtrl.isPreparing)
            ? Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(children: [
                  const Text("IS_PREPARING !!"),
                  VerticalSpacer(pHeight: 20.h),
                  const Text("SENSE COMPTADOR"),
                ]))
            : (pCtrl.isLoading || pCtrl.isLoaded)
                ? Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(children: [
                      Text("IS ${(isLoading) ? "LOADING" : "LOADED"} !!"),
                      VerticalSpacer(pHeight: 20.h),
                      ElevatedButton(
                        onPressed: () {
                          incrementCounter();
                        },
                        child: Text("Passa a ${(pageData.counter ?? 0) + 1}"),
                      ),
                      VerticalSpacer(pHeight: 20.h),
                      Text("Comptador actual: ${pageData.counter}"),
                      VerticalSpacer(pHeight: 20.h),
                      GetBuilder<HomePageCtrl>(
                          id: wgtListView,
                          init: this,
                          builder: (HomePageCtrl pCtrl) => _wgtListView(pCtrl))
                    ]))
                : throw Exception("Estat no vàlid!");

    return _widgetWgtCounter!;
  }

  Widget? _widgetListView;
  Widget _wgtListView(HomePageCtrl pCtrl) {
    _widgetListView = Column(children: [
      ListView.builder(
        itemCount: pCtrl.pageData.albums.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
              title: (pCtrl.pageData.albums.isEmpty)
                  ? Container()
                  : Text(
                      "ALBUM: ${pCtrl.pageData.albums[index].id ?? "??"} = '${pCtrl.pageData.albums[index].title ?? "!?"}'\n  COMM: ${pageData.albums[index].comment?.id ?? "??"} = '${pageData.albums[index]..comment?.name}"));
        },
      )
    ]);
    return _widgetListView!;
  }
}
