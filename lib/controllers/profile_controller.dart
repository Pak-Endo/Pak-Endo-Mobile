import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pak_endo/constants/preferences.dart';
import 'package:pak_endo/controllers/api_controller.dart';
import 'package:pak_endo/model/event_model.dart';
import 'package:pak_endo/model/profile_model.dart';
import 'package:pak_endo/views/widgets/loaders.dart';

class ProfileController extends GetxController {
  late final ProfileModel user;
  var attendedEvents = <EventModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
    getAttendedEvents();
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

  getAttendedEvents() async {
    try {
      getLoader();
      const int limit = 5;
      final int offset = attendedEvents.length;

      final json = await ApiController().getAttendedEvents(limit, offset);
      attendedEvents.addAll(
          (json['data'] as List).map((e) => EventModel.fromJson(e)).toList());

      getDismiss();
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }
}
