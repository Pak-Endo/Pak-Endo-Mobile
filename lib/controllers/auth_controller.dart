import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pak_endo/constants/preferences.dart';
import 'package:pak_endo/controllers/api_controller.dart';
import 'package:pak_endo/model/profile_model.dart';

import '../views/widgets/loaders.dart';

class AuthController extends GetxController {
  final selectedGender = "Male".obs;


  Future<bool> login(String email, String password) async {
    try {
      getLoader();
      final fcmToken = await FirebaseMessaging.instance.getToken();
      print('FCM TOKEN $fcmToken');
      var res = await ApiController().login(email, password, fcmToken);
      if (res.containsKey('error') || res.containsKey('errors')) {
        throw res['message'];
      }
      await Pref.setString(Pref.TOKEN_KEY, res['token']);
      await Pref.setString(Pref.USER_KEY, jsonEncode(res['user']));

      getSuccess();
      return true;
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
      return false;
    }
  }

  Future<bool> signup(ProfileModel model) async {
    try {
      getLoader();
      var res = await ApiController().register(model);
      if (res.containsKey('error') || res.containsKey('errors')) {
        throw res['message'];
      }
      getSuccess();
      return true;
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      getLoader();
      final completer = Completer<bool>();
      Future.delayed(const Duration(seconds: 3), () async {
        await Pref.removeString(Pref.TOKEN_KEY);
        await Pref.removeString(Pref.USER_KEY);
        getSuccess();
        completer.complete(true);
      });
      return completer.future;
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
      return false;
    }
  }

  Future<void> sendResetLink(String email) async {
    try {
      getLoader();
      await ApiController().sendResetLink(email);
      getSuccess();
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }
}
