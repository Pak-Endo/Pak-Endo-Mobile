import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pak_endo/Controllers/api_controller.dart';
import 'package:pak_endo/Model/event_model.dart';
import 'package:pak_endo/constants/consts.dart';

import '../views/widgets/loaders.dart';

class HomeController extends GetxController {
  var upcomingEvents = <EventModel>[];
  var ongoingEvents = <EventModel>[];
  var finishedEvents = <EventModel>[];
  var listEventsPage = <EventModel>[].obs;

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

  getAllEventsPagination(EventStatus status) async {
    try {
      getLoader();
      const int limit = 10;
      final int offset = listEventsPage.length;

      late final dynamic json;
      switch (status) {
        case EventStatus.Upcoming:
          json = await ApiController().getUpcomingEvents(limit,offset);
        case EventStatus.Ongoing:
          json = await ApiController().getOngoingEvents(limit,offset);
        case EventStatus.Finished:
          json = await ApiController().getFinishedEvents(limit,offset);
      }
      listEventsPage.addAll(
          (json['events'] as List).map((e) => EventModel.fromJson(e)).toList());
      getDismiss();
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }
}
