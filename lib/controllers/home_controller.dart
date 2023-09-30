import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pak_endo/constants/consts.dart';
import 'package:pak_endo/constants/preferences.dart';
import 'package:pak_endo/controllers/api_controller.dart';
import 'package:pak_endo/model/event_model.dart';

import '../views/widgets/loaders.dart';

class HomeController extends GetxController {
  var upcomingEvents = <EventModel>[];
  var ongoingEvents = <EventModel>[];
  var finishedEvents = <EventModel>[];
  var listEventsPage = <EventModel>[].obs;

  Set<String> speakers = {};
  List<Agenda> speakersDetail = [];
  Set<String> themes = {};
  Set<String> timings = {};
  var selectedFilters = <String>[].obs;
  List<Agenda> agenda = [];

  Map<String, dynamic> agendaByDay = {};

  var currentIndex = 0.obs;

  List<String> doNotShowTheInterestedBox = [];
  List<String> shouldShowTheInterestedBox = [];

  final String? isLoggedIn = Pref.getString(Pref.TOKEN_KEY);

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
          json = await ApiController().getFinishedEvents(limit, offset);
      }
      listEventsPage.addAll(
          (json['events'] as List).map((e) => EventModel.fromJson(e)).toList());
      getDismiss();
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }

  mapAgendasByDays(List<Agenda> agenda) {
    agendaByDay.clear();
    for (Agenda item in agenda) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(item.day!);
      String month = DateFormat('MMM').format(date);
      int day = date.day;
      String formattedDate = '$day $month';

      if (!agendaByDay.containsKey(formattedDate)) {
        agendaByDay[formattedDate] = {};
      }

      String venue = item.hall!;

      if (!agendaByDay[formattedDate]!.containsKey(venue)) {
        agendaByDay[formattedDate]![venue] = [];
      }

      agendaByDay[formattedDate]![venue]!.add(item); // Add an empty object
    }
  }

  getSpeakersAndThemesFromAgenda(List<Agenda> agenda) {
    // speakers =
    //     agenda.where((e) => e.speaker != null).map((e) => e.speaker!).toSet();
    selectedFilters.clear();
    themes =
        agenda.where((e) => e.speaker != null).map((e) => e.theme!).toSet();
    timings = agenda.map((e) => '${e.from} to ${e.to}').toSet();

    for (Agenda item in agenda) {
      if (item.speaker != null) {
        if (!speakers.contains(item.speaker)) {
          speakers.add(item.speaker!);
          speakersDetail.add(item);
        }
      }
    }
  }

  selectedSpeakerAndThemes(String filter, List<Agenda> agendaItems) {
    if (selectedFilters.contains(filter)) {
      selectedFilters.remove(filter);
    } else {
      selectedFilters.add(filter);
    }

    if (selectedFilters.isEmpty) {
      agenda = agendaItems;
    } else {
      agenda = agendaItems
          .where((e) =>
              selectedFilters.contains(e.speaker) ||
              selectedFilters.contains(e.theme) ||
              selectedFilters.contains('${e.from} to ${e.to}'))
          .toList();
    }
    mapAgendasByDays(agenda);
    update();
  }

  addToAttendedEvents(String id, bool doNotShowTheInterestedBoxCheck) async {
    try {
      if (!doNotShowTheInterestedBoxCheck) {
        doNotShowTheInterestedBox.add(id);
      } else {
        getLoader();
        await ApiController().addToAttendedEvents(id);
        shouldShowTheInterestedBox.add(id);
        getDismiss();
      }
      update();
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }

  getStartAndEndDate(int startDate, int endDate) {
    final dateTimeStart = DateTime.fromMillisecondsSinceEpoch(startDate);
    final dateTimeEnd = DateTime.fromMillisecondsSinceEpoch(endDate);

    final startTime = DateFormat('dd MMM, yyyy').format(dateTimeStart);
    final endTime = DateFormat('dd MMM, yyyy').format(dateTimeEnd);

    return '$startTime - $endTime';
  }

  getStartAndEndTime(int startDate, int endDate) {
    final dateTimeStart = DateTime.fromMillisecondsSinceEpoch(startDate);
    final dateTimeEnd = DateTime.fromMillisecondsSinceEpoch(endDate);

    final startTime = DateFormat('E hh:mm a').format(dateTimeStart);
    final endTime = DateFormat('E hh:mm a').format(dateTimeEnd);

    return '$startTime - $endTime';
  }

  getDay(int day) {
    final dateTimeStart = DateTime.fromMillisecondsSinceEpoch(day);
    return DateFormat('dd MMM, yyyy').format(dateTimeStart);
  }

// void mapAgendasByDays(List<Agenda> agenda) {
//   for (Agenda item in agenda) {
//     DateTime date = DateTime.fromMillisecondsSinceEpoch(item.day!);
//     String month = DateFormat('MMM')
//         .format(date);
//     int day = date.day;
//     String formattedDate = '$day $month';
//
//     if (!agendaByDay.containsKey(formattedDate)) {
//       agendaByDay[formattedDate] = [];
//
//
//     }
//
//     agendaByDay[formattedDate]!.add(item);
//   }
//
//   print(agendaByDay);
// }
}
