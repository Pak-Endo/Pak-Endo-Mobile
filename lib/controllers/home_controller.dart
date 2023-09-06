import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pak_endo/Controllers/api_controller.dart';
import 'package:pak_endo/Model/event_model.dart';

import '../views/widgets/loaders.dart';

class HomeController extends GetxController {
  var upcomingEvents = <EventModel>[];
  var ongoingEvents = <EventModel>[];
  var finishedEvents = <EventModel>[];

  @override
  void onInit() {
    super.onInit();
    getAllEvents();
  }

  getAllEvents() async {
    try {
      getLoader();
      var json = await ApiController().getAllEvents();
      // Assign upcoming events
      upcomingEvents.assignAll((json['upcomingEvents'] as List)
          .map((e) => EventModel.fromJson(e))
          .toList());

      // Assign ongoing events
      ongoingEvents.assignAll((json['onGoingEvents'] as List)
          .map((e) => EventModel.fromJson(e))
          .toList());

      // Assign finished events
      finishedEvents.assignAll((json['finishedEvents'] as List)
          .map((e) => EventModel.fromJson(e))
          .toList());
      update();
      getDismiss();
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }
}
