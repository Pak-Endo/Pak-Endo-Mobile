import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pak_endo/constants/preferences.dart';
import 'package:pak_endo/model/profile_model.dart';
import 'package:pak_endo/views/widgets/loaders.dart';

class ProfileController extends GetxController {
  late final ProfileModel user;


  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  getProfile() async {
    try {
      final profileMap = jsonDecode(Pref.getString(Pref.USER_KEY)!);
      user = ProfileModel.fromJson(profileMap);
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }
}