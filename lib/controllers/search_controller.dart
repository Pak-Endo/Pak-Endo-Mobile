import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pak_endo/constants/app_colors.dart';
import 'package:pak_endo/model/event_model.dart';

import '../views/widgets/loaders.dart';
import 'api_controller.dart';

class SearchPageController extends GetxController {
  var searchResult = <EventModel>[].obs;
  var filterChips = <String>[].obs;

  String selectedLocation = '';
  var selectedEventType = ''.obs;

  DateTime? startDate;
  int startEpochTime = 0;
  String startFormattedDate = '';

  DateTime? endDate;
  int endEpochTime = 0;
  String endFormattedDate = '';

  String speakerName = '';

  getSearchedEvents(bool isPagination, {title, speaker}) async {
    try {
      getLoader();
      const int limit = 10;
      final int offset = searchResult.length;

      var json;

      if (title == null) {
        json = await ApiController().getSearchedEvents(
            limit,
            offset,
            location: selectedLocation,
            type: selectedEventType,
            startDate: startFormattedDate,
            endDate: endFormattedDate,
            speaker: speaker);
      } else {
        json = await ApiController().getSearchedEvents(
            limit,
            offset,
            title: title,
            location: selectedLocation,
            type: selectedEventType,
            startDate: startFormattedDate,
            endDate: endFormattedDate);
      }

      if (isPagination) {
        searchResult.addAll((json['events'] as List)
            .map((e) => EventModel.fromJson(e))
            .toList());
      } else {
        searchResult.assignAll((json['events'] as List)
            .map((e) => EventModel.fromJson(e))
            .toList());
      }
      getDismiss();
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }

  selectDate(bool isStartDate) async {
    final selectedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
                primaryColor: Appcolors.appgreencolor,
                colorScheme:
                    const ColorScheme.light(primary: Appcolors.appgreencolor),
                buttonTheme:
                    const ButtonThemeData(textTheme: ButtonTextTheme.primary)),
            child: child!,
          );
        });

    if (selectedDate != null) {
      final formattedDate = DateFormat('d MMM, yyyy').format(selectedDate);
      final epochTime = selectedDate.millisecondsSinceEpoch ~/ 1000;

      if (isStartDate) {
        startDate = selectedDate;
        startFormattedDate = 'Start Date: $formattedDate';
        startEpochTime = epochTime;
      } else {
        endDate = selectedDate;
        endFormattedDate = 'End Date: $formattedDate';
        endEpochTime = epochTime;
      }
      update();
    }
  }

  applyFilters() {
    // Clear existing filter chips
    filterChips.clear();

    // Check each variable and add to filterChips if not empty
    if (selectedLocation.isNotEmpty) {
      filterChips.add(selectedLocation);
    }

    if (selectedEventType.value.isNotEmpty) {
      filterChips.add(selectedEventType.value);
    }

    if (startFormattedDate.isNotEmpty) {
      filterChips.add(startFormattedDate);
    }

    if (endFormattedDate.isNotEmpty) {
      filterChips.add(endFormattedDate);
    }

    if (speakerName.isNotEmpty) {
      filterChips.add(speakerName);
      getSearchedEvents(false, speaker: speakerName);
    }
  }

  clearFilters() {
    filterChips.clear();
    selectedEventType.value = '';
    selectedLocation = '';
    startDate = null;
    endDate = null;
    startEpochTime = 0;
    endEpochTime = 0;
    startFormattedDate = '';
    endFormattedDate = '';
    speakerName = '';
    update();
  }
}
