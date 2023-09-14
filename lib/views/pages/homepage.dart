import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/Controllers/home_controller.dart';
import 'package:pak_endo/constants/consts.dart';
import 'package:pak_endo/routes/navigations.dart';
import 'package:pak_endo/views/widgets/event_cards/Finishedeventcard.dart';
import 'package:pak_endo/views/widgets/event_cards/OnGoingEvents.dart';
import 'package:pak_endo/views/widgets/event_cards/UpcomingEvents.dart';

import '../widgets/custom_text/app_large_text.dart';
import 'search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
        child: GetBuilder<HomeController>(builder: (logic) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HOMEPAGE BAR
          homePageBar(),

          /// ONGOING EVENTS
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          eventHeading('Ongoing Events', EventStatus.Ongoing),
          OngoingEventsCard(ongoingEvents: homeController.ongoingEvents),

          /// UPCOMING EVENTS
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          eventHeading('Upcoming Events', EventStatus.Upcoming),
          UpComingEventsCard(upcomingEvents: homeController.upcomingEvents),

          /// FINISHED EVENTS
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          eventHeading('Finished Events', EventStatus.Finished),
          FinishedEventCard(finishedEvents: homeController.finishedEvents),

          SizedBox(height: MediaQuery.of(context).size.height * 0.15)
        ],
      );
    })));
  }

  eventHeading(title, args) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: title, color: Colors.black, size: 22)),
        Container(
            margin: const EdgeInsets.only(right: 5),
            child: GestureDetector(
                onTap: () => navigatorKey.currentState!
                    .pushNamed(PageRoutes.listEvents, arguments: args),
                child: const AppLargeText(
                    text: "See all >>",
                    color: Appcolors.Appbuttoncolor,
                    size: 14)))
      ],
    );
  }

  homePageBar() {
    return Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.height * 0.023),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.0895,
              width: MediaQuery.of(context).size.width * 0.130,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Logo_Icon.png"),
                      fit: BoxFit.fill),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)))),
          Container(
              margin: const EdgeInsets.only(left: 5),
              child: const AppLargeText(
                  text: "Endo-Pak",
                  size: 20.5,
                  color: Color.fromARGB(255, 65, 163, 110),
                  fontFamily: "Poppins-SemiBold")),
          const Expanded(child: SizedBox()),
          const Text("Search", style: TextStyle(color: Colors.grey)),
          IconButton(
              icon: const Icon(Icons.search, size: 28),
              onPressed: () => _openSearchPage(context))
        ]));
  }

  _openSearchPage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => const SearchPage(),
    );
  }
}
