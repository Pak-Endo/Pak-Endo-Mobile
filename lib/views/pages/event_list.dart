import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/controllers/home_controller.dart';
import 'package:pak_endo/constants/consts.dart';
import 'package:pak_endo/routes/navigations.dart';
import 'package:pak_endo/views/widgets/event_list_card.dart';

class ListEvents extends StatefulWidget {
  const ListEvents({super.key, required this.status});

  final EventStatus status;

  @override
  State<ListEvents> createState() => _ListEventsState();
}

class _ListEventsState extends State<ListEvents> {
  late final String appBarTitle;
  final HomeController homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    homeController.getAllEventsPagination(widget.status);
    switch (widget.status) {
      case EventStatus.Upcoming:
        appBarTitle = 'Upcoming Events';
      case EventStatus.Ongoing:
        appBarTitle = 'Ongoing Events';
      case EventStatus.Finished:
        appBarTitle = 'Finished Events';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: getAppBar(),
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent &&
                scrollInfo is ScrollEndNotification) {
              homeController.getAllEventsPagination(widget.status);
              return true;
            } else {
              return false;
            }
          },
          child: Obx(() {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: homeController.listEventsPage.length,
                padding: const EdgeInsets.only(left: 5, right: 5),
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  final event = homeController.listEventsPage[index];
                  return  EventListCard(event);
                });
          }),
        ));
  }

  getAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          homeController.listEventsPage.clear();
          navigatorKey.currentState!.pop();
        },
        icon: const Icon(Icons.arrow_back),
      ),
      title: Text(appBarTitle),
      titleSpacing: 0.0,
      centerTitle: true,
      toolbarHeight: 73.2,
      toolbarOpacity: 0.8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
      ),
      elevation: 0.00,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.green,
            ],
          ),
        ),
      ),
    );
  }
}
