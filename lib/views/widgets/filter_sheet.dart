import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/controllers/search_controller.dart';
import 'package:pak_endo/routes/navigations.dart';
import 'package:pak_endo/views/widgets/custom_dropdown.dart';

import '../../constants/app_colors.dart';
import 'AppButtons/custom_button.dart';

class FilterSheetContent extends StatefulWidget {
  const FilterSheetContent({super.key});

  @override
  State<FilterSheetContent> createState() => _FilterSheetContentState();
}

class _FilterSheetContentState extends State<FilterSheetContent> {
  TextEditingController speakerNameController = TextEditingController();
  final SearchPageController searchController =
      Get.find<SearchPageController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 100),
        curve: Curves.decelerate,
        child: Container(
            height: Get.height * 0.7,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
                color: Color(0xFFF2F3F7),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              /// HEADER
              getHeaders(),

              /// LOCATION
              getLocation(),

              /// EVENT TYPE
              getEventType(),

              /// DATE AND TIME
              getDateAndTime(),

              /// SPEAKER TEXT FIELD
              getSpeakerField(),

              /// CUSTOM BUTTON
              Center(
                  child: CustomButton(
                      text: "Apply Filters",
                      width: 230,
                      height: 40,
                      textfont: 16,
                      onTap: () {
                        searchController.applyFilters();
                        navigatorKey.currentState!.pop();
                      }))
            ])),
      ),
    );
  }

  getHeaders() {
    return Column(children: [
      Obx(() {
        return Row(children: [
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => navigatorKey.currentState!.pop()),
          Spacer(flex: searchController.filterChips.isEmpty ? 1 : 2),
          const Text('Advance Filters',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Spacer(flex: searchController.filterChips.isEmpty ? 2 : 1),
          Obx(() => searchController.filterChips.isEmpty
              ? const SizedBox.shrink()
              : TextButton(
                  onPressed: () => searchController.clearFilters(),
                  child: const Text('CLEAR')))
        ]);
      }),
      const SizedBox(height: 16),
    ]);
  }

  getLocation() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Location',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      const SizedBox(height: 5),
      SizedBox(height: 50, width: 200, child: DropDownTest()),
      const SizedBox(height: 16)
    ]);
  }

  getEventType() {
    return Obx(() {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Event Type',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        Row(
          children: <Widget>[
            Radio<String>(
                activeColor: Appcolors.appbluecolor,
                value: 'Workshop',
                groupValue: searchController.selectedEventType.value,
                onChanged: (value) =>
                    searchController.selectedEventType.value = value!),
            const Text('Workshop'),
            Radio<String>(
                activeColor: Appcolors.appbluecolor,
                value: 'Conference',
                groupValue: searchController.selectedEventType.value,
                onChanged: (value) =>
                    searchController.selectedEventType.value = value!),
            const Text('Conference'),
          ],
        ),
        const SizedBox(height: 16),
      ]);
    });
  }

  getDateAndTime() {
    return GetBuilder<SearchPageController>(builder: (logic) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Date and Time:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              width: 150, // Set the width as needed
              height: 40, // Set the height as needed
              decoration: BoxDecoration(
                color: Colors.white70, // Transparent background color
                border: Border.all(color: Colors.grey), // Black border color
                borderRadius: BorderRadius.circular(12.0), // Rounded corners
              ),
              child: TextButton(
                  onPressed: () => searchController.selectDate(true),
                  child: Text(searchController.startDate == null
                      ? 'Select Start Date'
                      : searchController.startDate!
                          .toLocal()
                          .toString()
                          .split(' ')[0]))),
          Container(
              width: 150, // Set the width as needed
              height: 40, // Set the height as needed
              decoration: BoxDecoration(
                color: Colors.white70, // Transparent background color
                border: Border.all(color: Colors.grey), // Black border color
                borderRadius: BorderRadius.circular(12.0), // Rounded corners
              ),
              child: TextButton(
                  onPressed: () => searchController.selectDate(false),
                  child: Text(searchController.endDate == null
                      ? 'Select End Date'
                      : searchController.endDate!
                          .toLocal()
                          .toString()
                          .split(' ')[0])))
        ])
      ]);
    });
  }

  getSpeakerField() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 16),
      const Text('Speaker Name',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      const SizedBox(height: 10),
      TextFormField(
          controller: speakerNameController,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Enter Speaker Name',
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              // Padding
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0))),
          onChanged: (val) => searchController.speakerName = val),
      const SizedBox(height: 16),
    ]);
  }
}
