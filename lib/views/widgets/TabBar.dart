import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineBar extends StatelessWidget {
  TimeLineBar({super.key});

  final List<String> days = [
    "Day 1",
    "Day 2",
    "Day 3",
    "Day 3",
    "Day 4",
    "Day 5",
    "Day 6",
    "Day 7",
  ]; // Add more days as needed
  final List<String> Headings1 = [
    'Intrduction',
    '',
    'Workshop',
    '',
    'Lunch',
    ''
  ];

  final List<String> Headings2 = [
    '',
    'Lunch',
    '',
    'Introduction',
    '',
    'Workshop'
  ];
  final List<String> Time1 = [
    "9:30Am - 11:45Am",
    "",
    "2:30Pm - 4:00Pm",
    "",
    "12:30Pm - 1:30Pm",
    ""
  ];

  final List<String> Time2 = [
    "",
    "12:30Pm - 1:30Pm",
    "",
    "9:30Am - 11:45Am",
    "",
    "2:30Pm - 4:00Pm"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: days.length,
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
                tabs: days.map((day) => Tab(text: day)).toList()),
            const Divider(),
            Expanded(
                child: TabBarView(
                    children: days.map((day) => buildDayTab(day)).toList())),
          ]),
        ));
  }

  Widget buildDayTab(String day) {
    return ListView.builder(
      itemCount: 4,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemBuilder: (context, index) {
        return Align(
          alignment: Alignment.center,
          child: TimelineTile(
            isFirst: index == 0 ? true : false,
            isLast: index == 3 ? true : false,
            axis: TimelineAxis.vertical,
            hasIndicator: true,
            indicatorStyle: const IndicatorStyle(color: Appcolors.appbluecolor),
            beforeLineStyle: const LineStyle(color: Appcolors.appgreencolor),
            afterLineStyle: const LineStyle(color: Appcolors.appbluecolor),
            alignment: TimelineAlign.center,
            startChild: Column(
              children: [
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Headings1[index],
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black)),
                    Text(index % 2 == 0 ? 'Speaker: Ahmed' : ''),
                    Text(Time1[index],
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey)),
                    Text(index % 2 == 0 ? "Venue: Hall no 3" : '',
                        style: TextStyle(fontSize: 15, color: Colors.grey)),
                  ],
                ),
              ],
            ),
            endChild: Column(
              children: [
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Headings2[index],
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black)),
                    Text(index % 2 != 0 ? 'Speaker: Ahmed' : ''),
                    Text(Time2[index],
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey)),
                    Text(index % 2 != 0 ? "Venue: Hall no 3" : '',
                        style: TextStyle(fontSize: 15, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
