import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/constants/preferences.dart';

import '../firebase_options.dart';
import '../providers/notification_services.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  AppConfig._internal();

  factory AppConfig() {
    return _instance;
  }

  static const String appName = 'PES Pakistan Endocrine Society';
  static const String packageName = 'com.app.endopak';
  static const String languageDefault = "en";

  late final bool isNewUser;
  late final bool isSignedIn;
  late String? deviceId;


  init() async {

    await Pref.init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

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

    // deviceId = await _getId();
    // <======= Notifications =============
    await _initializeNotifications();
  }

  // Future<String?> _getId() async {
  //   var deviceInfo = DeviceInfoPlugin();
  //   if (Platform.isIOS) {
  //     var iosDeviceInfo = await deviceInfo.iosInfo;
  //     return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  //   } else if (Platform.isAndroid) {
  //     var androidDeviceInfo = await deviceInfo.androidInfo;
  //     return androidDeviceInfo.id; // unique ID on Android
  //   }
  //   return null;
  // }

  _initializeNotifications() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // final fcmToken = await FirebaseMessaging.instance.getToken();
    // print('FCM TOKEN $fcmToken');

    await NotificationServices.instance.initializePlatformNotifications();
    NotificationServices.instance.showForegroundNotifications();
    // await ApiController().createDevice(deviceId!, fcmToken!);
  }
}