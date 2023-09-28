import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/controllers/home_controller.dart';
import 'package:pak_endo/model/event_model.dart';
import 'package:pak_endo/routes/navigations.dart';
import 'package:pak_endo/views/widgets/AppButtons/custom_button2.dart';
import 'package:pak_endo/views/widgets/CustomWidgets/custom_view.dart';
import 'package:pak_endo/views/widgets/custom_chips.dart';
import 'package:pak_endo/views/widgets/custom_text/app_large_text.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineBar extends StatefulWidget {
  const TimeLineBar(this.event, {super.key});

  final EventModel event;

  @override
  State<TimeLineBar> createState() => _TimeLineBarState();
}

class _TimeLineBarState extends State<TimeLineBar> {
  final HomeController homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    homeController.agenda = widget.event.agenda!;
    homeController.mapAgendasByDays(homeController.agenda);
    homeController.getSpeakersAndThemesFromAgenda(homeController.agenda);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(),
        body: homeController.agenda.isEmpty
            ? const Center(
                child: CustomView(
                    'No Agenda for this event', Icons.no_adult_content))
            : GetBuilder<HomeController>(builder: (logic) {
                return DefaultTabController(
                    length: homeController.agendaByDay.keys.length,
                    child: SizedBox(
                        height: Get.height,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton2(
                                  width: Get.width / 2.5,
                                  text: 'Show Speakers',
                                  height: 40,
                                  onTap: () =>
                                      _showBottomSheetSpeakers(context)),
                              CustomButton2(
                                  width: Get.width / 2.5,
                                  text: 'Show Themes',
                                  height: 40,
                                  onTap: () => _showBottomSheetThemes(context)),
                            ],
                          ),
                          getFilters(),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: const Text('Timeline:',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          parentTabView(),
                          Expanded(
                            child: TabBarView(
                                children: homeController.agendaByDay.values
                                    .map<Widget>(
                                        (venueTab) => childTabView(venueTab))
                                    .toList()),
                          )
                        ])));
              }));
  }

  parentTabView() {
    return TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        isScrollable: true,
        automaticIndicatorColorAdjustment: true,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                colors: [Appcolors.appbluecolor, Appcolors.appgreencolor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding:
            const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        unselectedLabelStyle: const TextStyle(fontSize: 13),
        tabs: homeController.agendaByDay.keys
            .map((day) => Tab(text: day))
            .toList());
  }

  Widget childTabView(venueTab) {
    return DefaultTabController(
      length: venueTab.keys.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black54,
              isScrollable: true,
              automaticIndicatorColorAdjustment: true,
              indicatorColor: Appcolors.appgreencolor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding:
                  const EdgeInsets.symmetric(horizontal: 2, vertical: 12),
              labelStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              unselectedLabelStyle: const TextStyle(fontSize: 13),
              tabs: venueTab.keys
                  .map<Widget>((venue) => Tab(text: venue))
                  .toList()),
          const Divider(),
          Expanded(
              child: TabBarView(
                  children: venueTab.values
                      .map<Widget>((day) => buildDayTab(day))
                      .toList())),
        ],
      ),
    );
  }

  Widget buildDayTab(agenda) {
    return ListView.builder(
      itemCount: agenda.length,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
      itemBuilder: (context, index) {
        final _agenda = agenda[index];
        return Align(
            alignment: Alignment.center,
            child: TimelineTile(
                isFirst: index == 0 ? true : false,
                // isLast: index == agenda.length - 1 ? true : false,
                axis: TimelineAxis.vertical,
                hasIndicator: true,
                indicatorStyle:
                    const IndicatorStyle(color: Appcolors.appbluecolor),
                beforeLineStyle:
                    const LineStyle(color: Appcolors.appgreencolor),
                afterLineStyle: const LineStyle(color: Appcolors.appbluecolor),
                alignment: TimelineAlign.center,
                startChild: Container(
                  margin: EdgeInsets.only(left: Get.width * 0.04),
                  child: GestureDetector(
                    onTap: () {
                      if (_agenda.theme != null) {
                        navigatorKey.currentState!.pushNamed(
                            PageRoutes.agendaDetail,
                            arguments: _agenda);
                      }
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getImage(_agenda, index % 2 == 0),
                          getTitle(_agenda, index % 2 == 0),
                          getSpeaker(_agenda, index % 2 == 0),
                          getDesignation(_agenda, index % 2 == 0),
                          getTime(_agenda, index % 2 == 0),
                          getLive(_agenda, index % 2 == 0),
                        ]),
                  ),
                ),
                endChild: Container(
                  margin: EdgeInsets.only(left: Get.width * 0.05),
                  child: GestureDetector(
                    onTap: () {
                      // if (_agenda.streamUrl != null) {
                      //   print('STREAM URL: ${_agenda.streamUrl!}');
                      //   navigatorKey.currentState!.pushNamed(
                      //       PageRoutes.youtubeVideo,
                      //       arguments: _agenda.streamUrl!);
                      // }
                      if (_agenda.theme != null) {
                        navigatorKey.currentState!.pushNamed(
                            PageRoutes.agendaDetail,
                            arguments: _agenda);
                      }
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getImage(_agenda, index % 2 != 0),
                          getTitle(_agenda, index % 2 != 0),
                          getSpeaker(_agenda, index % 2 != 0),
                          getDesignation(_agenda, index % 2 != 0),
                          getTime(_agenda, index % 2 != 0),
                          getLive(_agenda, index % 2 != 0),
                        ]),
                  ),
                )));
      },
    );
  }

  getImage(Agenda agenda, bool displayData) {
    if (agenda.speakerImg == null) {
      return const SizedBox.shrink();
    }

    if (displayData) {
      return Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Hero(
            tag: agenda.id!,
            child: CachedNetworkImage(
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                imageUrl: agenda.speakerImg!,
                errorWidget: (_, url, err) =>
                    Image.asset("assets/profile.jpg", fit: BoxFit.cover),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator.adaptive(
                      backgroundColor: Appcolors.appgreencolor,
                      value: downloadProgress.progress,
                    ))),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  getTitle(Agenda agenda, bool displayData) {
    if (displayData) {
      return Text(agenda.agendaTitle!,
          style: const TextStyle(fontSize: 20, color: Colors.black));
    }
    return const SizedBox.shrink();
  }

  getSpeaker(Agenda agenda, bool displayData) {
    if (agenda.speaker == null) {
      return const SizedBox.shrink();
    }

    if (displayData) {
      return Text(agenda.speaker!,
          style: const TextStyle(fontSize: 16, color: Colors.black));
    }
    return const SizedBox.shrink();
  }

  getTime(Agenda agenda, bool displayData) {
    if (displayData) {
      return Text('${agenda.from!} to ${agenda.to!}',
          style: const TextStyle(fontSize: 13, color: Colors.grey));
    }
    return const SizedBox.shrink();
  }

  getDesignation(Agenda agenda, bool displayData) {
    if (agenda.speakerDesignation == null) {
      return const SizedBox.shrink();
    }
    if (displayData) {
      return Text("Designation: ${agenda.speakerDesignation}",
          style: const TextStyle(fontSize: 15, color: Colors.grey));
    }
    return const SizedBox.shrink();
  }

  getLive(Agenda agenda, bool displayData) {
    if (agenda.streamUrl == null || agenda.streamUrl!.isEmpty) {
      return const SizedBox.shrink();
    }

    if (displayData) {
      return const Text('Watch Live',
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w500,
              color: Colors.red));
    }

    return const SizedBox.shrink();
  }

  getAppBar() {
    return AppBar(
        leading: GestureDetector(
            onTap: () => navigatorKey.currentState!.pop(),
            child: const Icon(Icons.arrow_back)),
        title: const Text("Agenda"),
        titleSpacing: 0.0,
        centerTitle: true,
        toolbarHeight: 73.2,
        toolbarOpacity: 0.8,
        shadowColor: Appcolors.appbluecolor.withOpacity(0.8),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
        elevation: 0.00,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue,
                    Colors.green,
                  ],
                ))));
  }

  getFilters() {
    return Obx(() => homeController.selectedFilters.isEmpty
        ? const SizedBox.shrink()
        : Column(
            children: [
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('Filters:',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)))),
                  TextButton(
                      onPressed: () {
                        homeController.selectedFilters.clear();
                        homeController.mapAgendasByDays(widget.event.agenda!);
                        homeController.update();
                      },
                      child: const Text('Remove All')),
                ],
              ),
              Wrap(
                  runSpacing: 1.2,
                  spacing: 10,
                  children: homeController.selectedFilters
                      .map<Widget>((element) => CustomChip(label: element))
                      .toList()),
              const Divider()
            ],
          ));
  }

  void _showBottomSheetSpeakers(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20),
            height: Get.height * 0.7,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => navigatorKey.currentState!.pop(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 3, width: 100, color: Colors.grey),
                      const SizedBox(height: 2),
                      Container(height: 3, width: 70, color: Colors.grey)
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const AppLargeText(
                              text: "Speakers:", size: 20, color: Colors.black),
                          Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Wrap(
                                  spacing: 12.0,
                                  runSpacing: 4.0,
                                  children: homeController.speakers
                                      .map((speaker) => Obx(() {
                                            return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: ChoiceChip(
                                                    label: Text(
                                                      speaker,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              color: homeController
                                                                      .selectedFilters
                                                                      .contains(
                                                                          speaker)
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 15),
                                                    ),
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                                    selected: homeController
                                                        .selectedFilters
                                                        .contains(speaker),
                                                    onSelected: (bool newValue) => homeController.selectedSpeakerAndThemes(
                                                        speaker,
                                                        widget.event.agenda!),
                                                    selectedColor:
                                                        Appcolors.appgreencolor,
                                                    selectedShadowColor:
                                                        Appcolors.appgreencolor,
                                                    avatar: homeController
                                                            .selectedFilters
                                                            .contains(speaker)
                                                        ? const Icon(Icons.check, color: Colors.white)
                                                        : null // Add a check mark icon for the selected chip
                                                    ));
                                          }))
                                      .toList())),
                          const SizedBox(height: 10),
                          const Center(
                              child: AppLargeText(
                                  text: "Select to apply filters",
                                  size: 12,
                                  color: Colors.grey))
                        ])),
              ],
            ));
      },
    );
  }

  void _showBottomSheetThemes(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20),
              height: Get.height * 0.7,
              child: Column(children: [
                GestureDetector(
                  onTap: () => navigatorKey.currentState!.pop(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 3, width: 100, color: Colors.grey),
                      const SizedBox(height: 2),
                      Container(height: 3, width: 70, color: Colors.grey)
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const AppLargeText(
                              text: "Themes:", size: 20, color: Colors.black),
                          Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Wrap(
                                  spacing: 12.0,
                                  runSpacing: 4.0,
                                  children: homeController.themes
                                      .map((theme) => Obx(() {
                                            return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: ChoiceChip(
                                                    label: Text(
                                                      theme,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              color: homeController
                                                                      .selectedFilters
                                                                      .contains(
                                                                          theme)
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 15),
                                                    ),
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                                    selected: homeController
                                                        .selectedFilters
                                                        .contains(theme),
                                                    onSelected: (bool newValue) => homeController.selectedSpeakerAndThemes(
                                                        theme,
                                                        widget.event.agenda!),
                                                    selectedColor:
                                                        Appcolors.appgreencolor,
                                                    selectedShadowColor:
                                                        Appcolors.appgreencolor,
                                                    avatar: homeController
                                                            .selectedFilters
                                                            .contains(theme)
                                                        ? const Icon(Icons.check, color: Colors.white)
                                                        : null // Add a check mark icon for the selected chip
                                                    ));
                                          }))
                                      .toList())),
                          const SizedBox(height: 10),
                          const Center(
                              child: AppLargeText(
                                  text: "Select to apply filters",
                                  size: 12,
                                  color: Colors.grey))
                        ]))
              ]));
        });
  }

// getAllAgendaSpeakers() {
//   return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20),
//       child: Align(
//           alignment: Alignment.topLeft,
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const AppLargeText(
//                     text: "Speakers:", size: 20, color: Colors.black),
//                 Padding(
//                     padding: const EdgeInsets.only(left: 20),
//                     child: Wrap(
//                         spacing: 12.0,
//                         runSpacing: 4.0,
//                         children: homeController.speakers
//                             .map((speaker) => Obx(() {
//                                   return Padding(
//                                       padding:
//                                           const EdgeInsets.only(right: 8.0),
//                                       child: ChoiceChip(
//                                           label: Text(
//                                             speaker,
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .bodyMedium!
//                                                 .copyWith(
//                                                     color: homeController
//                                                         .selectedFilters
//                                                             .contains(speaker)
//                                                         ? Colors.white
//                                                         : Colors.black,
//                                                     fontSize: 15),
//                                           ),
//                                           shape: const RoundedRectangleBorder(
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(5))),
//                                           selected: homeController
//                                               .selectedFilters
//                                               .contains(speaker),
//                                           onSelected: (bool newValue) =>
//                                               homeController.selectedSpeaker(
//                                                   speaker,
//                                                   widget.event.agenda!),
//                                           selectedColor:
//                                           Appcolors.appgreencolor,
//                                           selectedShadowColor:
//                                           Appcolors.appgreencolor,
//                                           avatar: homeController
//                                               .selectedFilters
//                                               .contains(speaker)
//                                               ? const Icon(Icons.check,
//                                               color: Colors.white)
//                                               : null // Add a check mark icon for the selected chip
//                                       ));
//                         }))
//                             .toList()))
//               ])));
// }
}
