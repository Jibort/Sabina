// Emcapsulament de la barra de capçalera de les pàgines.
// createdAt: 24/07/18 dj. JIQ

// ignore_for_file: prefer_final_fields, must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/09_tools/index.dart';
import 'package:ld_learn/09_tools/theme.dart';
import 'package:ld_learn/10_localization/index.dart';

class BaseAppBar extends AppBar {
  // MEMBRES --------------------------
  // final BaseController _pageCtrl;
  // final String _title;
  // final List<Widget>? _actions;
  // final Widget? _leading;
  // final double _elevation;
  // Color _bgColor;
  // Color _fgColor;
  // bool _centerTitle;

  // CONSTRUCTORS ---------------------
  BaseAppBar({
    super.key,
    required BaseController pPageCtrl,
    required String pTitle,
    String? pSubTitle,
    List<ActionIcon>? pActions,
    ActionIcon? pLeading,
    double? pElevation,
    Color? pBgColor,
    Color? pFgColor,
    bool? centerTitle,
  }) : super(
            elevation: pElevation ?? 30.h,
            shadowColor: appBarFgColor.darken(0.4),
            backgroundColor: pBgColor ?? appBarBgColor,
            titleTextStyle: txsAppBarTitleStyle(),
            title: GetBuilder(
              id: WidgetKey.appBar.idx,
              init: pPageCtrl,
              builder: (BaseController<DeepDo> pCtrl) {
                return Column(children: [
                  (pCtrl.isLoaded)
                      ? _TitleWidget(pTitle, pLeading,
                          pSubTitle: pSubTitle,
                          pFgColor: pFgColor ?? appBarFgColor,
                          pActions: pActions)
                      : _ProgressTitleWidget(
                          pCtrl,
                          pBgColor: pBgColor ?? appBarBgColor,
                          pFgColor: pFgColor ?? appBarProgFgColor,
                        )
                ]);
              },
            ));
}

class _ProgressTitleWidget extends GetWidget {
  // MEMBRES --------------------------
  final BaseController _pageCtrl;
  final String _title;
  final Color _fgColor;

  // CONSTRUCTORS ---------------------
  _ProgressTitleWidget(this._pageCtrl, {String? pTitle, Color? pBgColor, Color? pFgColor})
      : _title = pTitle ?? L.loading.tr,
        _fgColor = pFgColor ?? appBarFgColor;

  // WIDGET ---------------------------
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseController>(
        id: WidgetKey.appBarProgress.idx,
        init: _pageCtrl,
        builder: (context) {
          int length, dids;
          double? ratio;
          (length, dids, ratio) = _pageCtrl.state.stats;
          if (_pageCtrl.isPreparing) {
            return SizedBox(
              width: null,
              height: 2.h,
              child: LinearProgressIndicator(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                minHeight: 2.h,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(_fgColor),
                value: ratio,
              ),
            );
          } else if (_pageCtrl.isLoading) {
            return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(
                  "$_title: ${(isNotNull(ratio)) ? "${(ratio! * 100.0).toStringAsFixed(2)}%" : "..."}",
                  style: txsAppBarProgressionTitleStyle(pFgColor: _fgColor)),
              Text(
                "$dids ${L.of.tr} $length",
                style: txsAppBarProgressionSubtitleStyle(pFgColor: _fgColor),
              ),
              SizedBox(
                width: null,
                height: 2.h,
                child: LinearProgressIndicator(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  minHeight: 2.h,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(_fgColor),
                  value: ratio,
                ),
              ),
            ]);
          } else {
            return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text("Unknown State!", style: txsAppBarProgressionTitleStyle(pFgColor: _fgColor)),
              SizedBox(
                width: null,
                height: 2.h,
                child: LinearProgressIndicator(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  minHeight: 2.h,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(_fgColor),
                  value: null,
                ),
              ),
            ]);
          }
        });
  }
}

class _TitleWidget extends GetWidget {
  // MEMBRES --------------------------
  final String _title;
  final String? _subTitle;
  final ActionIcon? _leading;
  final List<ActionIcon>? _actions;
  final Color _fgColor;
  // CONSTRUCTORS ---------------------
  const _TitleWidget(String pTitle, ActionIcon? pLeading,
      {String? pSubTitle, List<ActionIcon>? pActions, Color? pFgColor})
      : _title = pTitle,
        _subTitle = pSubTitle,
        _leading = pLeading,
        _actions = pActions,
        _fgColor = pFgColor ?? Colors.black;

  // WIDGET ---------------------------
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (isNotNull(_leading)) ? _leading! : const SizedBox(),
        (isNull(_subTitle) || isNull(_subTitle))
            ? Text(_title, style: txsAppBarMainTitleStyle(pFgColor: _fgColor))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_title, style: txsAppBarTitleStyle(pFgColor: _fgColor)),
                  Text(_subTitle!, style: txsAppBarSubtitleStyle(pFgColor: _fgColor))
                ],
              ),
      ],
    );
  }
}
