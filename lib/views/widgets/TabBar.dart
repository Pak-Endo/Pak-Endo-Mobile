import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/model/event_model.dart';
import 'package:pak_endo/routes/navigations.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineBar extends StatefulWidget {
  const TimeLineBar(this.event, {super.key});

  final EventModel event;

  @override
  State<TimeLineBar> createState() => _TimeLineBarState();
}

class _TimeLineBarState extends State<TimeLineBar> {
  Map<String, List<Agenda>> agendaByDay = {};

  @override
  void initState() {
    super.initState();
    mapAgendasByDays(widget.event.agenda!);
  }

  void mapAgendasByDays(List<Agenda> agenda) {
    for (Agenda item in agenda) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(item.day!);
      String month = DateFormat('MMM')
          .format(date); // Use 'MMM' for abbreviated month name
      int day = date.day;
      String formattedDate = '$day $month'; // Format the date as 'day month'

      if (!agendaByDay.containsKey(formattedDate)) {
        agendaByDay[formattedDate] = [];
      }

      agendaByDay[formattedDate]!.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: agendaByDay.keys.length,
        child: SizedBox(
          height: Get.height * 0.5,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                automaticIndicatorColorAdjustment: true,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(colors: [
                      Appcolors.appbluecolor,
                      Appcolors.appgreencolor
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                labelStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                unselectedLabelStyle: const TextStyle(fontSize: 13),
                tabs: agendaByDay.keys.map((day) => Tab(text: day)).toList()),
            const Divider(),
            Expanded(
                child: TabBarView(
                    children: agendaByDay.values
                        .map((day) => buildDayTab(day))
                        .toList())),
          ]),
        ));
  }

  Widget buildDayTab(List<Agenda> agenda) {
    return ListView.builder(
      itemCount: agenda.length,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemBuilder: (context, index) {
        final _agenda = agenda[index];
        return Align(
            alignment: Alignment.center,
            child: TimelineTile(
                isFirst: index == 0 ? true : false,
                isLast: index == agenda.length - 1 ? true : false,
                axis: TimelineAxis.vertical,
                hasIndicator: true,
                indicatorStyle:
                    const IndicatorStyle(color: Appcolors.appbluecolor),
                beforeLineStyle:
                    const LineStyle(color: Appcolors.appgreencolor),
                afterLineStyle: const LineStyle(color: Appcolors.appbluecolor),
                alignment: TimelineAlign.center,
                startChild: Container(
                  margin: EdgeInsets.only(left: Get.width *0.04),
                  child: GestureDetector(
                    onTap: () {
                      if (_agenda.streamUrl != null) {
                        print('STREAM URL: ${_agenda.streamUrl!}');
                        navigatorKey.currentState!.pushNamed(
                            PageRoutes.youtubeVideo,
                            arguments: _agenda.streamUrl!);
                      }
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getImage(_agenda, index % 2 == 0),
                          getTitle(_agenda, index % 2 == 0),
                          getSpeaker(_agenda, index % 2 == 0),
                          getTime(_agenda, index % 2 == 0),
                          getVenue(_agenda, index % 2 == 0),
                          getLive(_agenda, index % 2 == 0),
                        ]),
                  ),
                ),
                endChild: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_agenda.streamUrl != null) {
                          print('STREAM URL: ${_agenda.streamUrl!}');
                          navigatorKey.currentState!.pushNamed(
                              PageRoutes.youtubeVideo,
                              arguments: _agenda.streamUrl!);
                        }
                      },
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getImage(_agenda, index % 2 != 0),
                            getTitle(_agenda, index % 2 != 0),
                            getSpeaker(_agenda, index % 2 != 0),
                            getTime(_agenda, index % 2 != 0),
                            getVenue(_agenda, index % 2 != 0),
                            getLive(_agenda, index % 2 != 0),
                          ]),
                    ),
                  ],
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
      return Text(agenda.speaker!);
    }
    return const SizedBox.shrink();
  }

  getTime(Agenda agenda, bool displayData) {
    if (displayData) {
      return Text('${agenda.from!} to ${agenda.to!}',
          style: const TextStyle(fontSize: 15, color: Colors.grey));
    }
    return const SizedBox.shrink();
  }

  getVenue(Agenda agenda, bool displayData) {
    if (displayData) {
      return Text("Venue: ${agenda.venue}",
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
}
