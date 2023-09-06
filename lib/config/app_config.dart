import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/constants/preferences.dart';


class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  AppConfig._internal();

  factory AppConfig() {
    return _instance;
  }

  static const String appName = 'Endo Pak App';
  static const String packageName = '';
  static const String languageDefault = "en";

  late final bool isNewUser;
  late final bool isSignedIn;

  init() async {

    await Pref.init();
    isNewUser = await IsFirstRun.isFirstRun();
    isSignedIn = Pref.getString(Pref.TOKEN_KEY) == null ? false : true;

    EasyLoading.instance
      ..displayDuration = const Duration(seconds: 2)
      ..indicatorType = EasyLoadingIndicatorType.chasingDots
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..userInteractions = false
      ..dismissOnTap = false
      ..maskType = EasyLoadingMaskType.black
      ..indicatorColor = Appcolors.appgreencolor
      ..backgroundColor = Colors.white
      ..textColor = Appcolors.appbluecolor;
  }
}
