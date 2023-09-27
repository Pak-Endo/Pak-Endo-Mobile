import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/controllers/home_controller.dart';
import 'package:pak_endo/model/event_model.dart';
import 'package:pak_endo/routes/navigations.dart';
import 'package:pak_endo/views/widgets/CustomWidgets/custom_view.dart';
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
    homeController.getSpeakersFromAgenda(homeController.agenda);
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
                          getAllAgendaSpeakers(),
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
                      // if (_agenda.streamUrl != null) {
                      //   print('STREAM URL: ${_agenda.streamUrl!}');
                      //   navigatorKey.currentState!.pushNamed(
                      //       PageRoutes.youtubeVideo,
                      //       arguments: _agenda.streamUrl!);
                      // }
                      navigatorKey.currentState!.pushNamed(
                          PageRoutes.agendaDetail,
                          arguments: _agenda);
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getImage(_agenda, index % 2 == 0),
                          getTitle(_agenda, index % 2 == 0),
                          getSpeaker(_agenda, index % 2 == 0),
                          getSponsor(_agenda, index % 2 == 0),
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
                      navigatorKey.currentState!.pushNamed(
                          PageRoutes.agendaDetail,
                          arguments: _agenda);
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getImage(_agenda, index % 2 != 0),
                          getTitle(_agenda, index % 2 != 0),
                          getSpeaker(_agenda, index % 2 != 0),
                          getSponsor(_agenda, index % 2 != 0),
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

  getSponsor(Agenda agenda, bool displayData) {
    if (displayData) {
      return Text("Sponsor: ${agenda.sponsor}",
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

  // getSearchField() {
  //   return Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
  //       child: CupertinoSearchTextField(
  //           // onSubmitted: (val) =>
  //           //     homeController.getEventById(widget.event.id!, val),
  //           suffixMode: OverlayVisibilityMode.always,
  //           autofocus: false));
  // }

  getAllAgendaSpeakers() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20),
        child: Align(
            alignment: Alignment.topLeft,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: ChoiceChip(
                                            label: Text(
                                              speaker,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color: homeController
                                                              .selectedSpeakers
                                                              .contains(speaker)
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontSize: 15),
                                            ),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            selected: homeController
                                                .selectedSpeakers
                                                .contains(speaker),
                                            onSelected: (bool newValue) =>
                                                homeController.selectedSpeaker(
                                                    speaker,
                                                    widget.event.agenda!),
                                            selectedColor:
                                                Appcolors.appgreencolor,
                                            selectedShadowColor:
                                                Appcolors.appgreencolor,
                                            avatar: homeController.selectedSpeakers
                                                    .contains(speaker)
                                                ? const Icon(Icons.check,
                                                    color: Colors.white)
                                                : null // Add a check mark icon for the selected chip
                                            ));
                                  }))
                              .toList()))
                ])));
  }
}
