import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/Controllers/home_controller.dart';
import 'package:pak_endo/constants/consts.dart';
import 'package:pak_endo/routes/navigations.dart';

import '../widgets/custom_text/app_large_text.dart';

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
                  return GestureDetector(
                    onTap: () => navigatorKey.currentState!
                        .pushNamed(PageRoutes.detailPage, arguments: event),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        margin: const EdgeInsets.only(
                            top: 17, right: 8, left: 8, bottom: 6),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(95, 24, 21, 21),
                                blurRadius: 10,
                                offset: Offset(2, 2),
                              )
                            ]),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width:
                                      MediaQuery.of(context).size.height * 0.16,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
                                      color: Appcolors.Appbuttoncolor,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: CachedNetworkImageProvider(
                                              event.featuredImage!)))),
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13,
                                          left: 10,
                                          bottom: 5,
                                          right: 5),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(event.startDate.toString(),
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12)),
                                            AppLargeText(
                                                text: event.title!,
                                                size: 16,
                                                color: Colors.black),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(Icons.location_pin,
                                                      color: Appcolors
                                                          .Appbuttoncolor),
                                                  Text(event.location!,
                                                      style: const TextStyle(
                                                          color:
                                                              Colors.blueGrey,
                                                          fontSize: 12))
                                                ]),
                                            SizedBox(
                                                height: screenHeight * 0.02),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5.0, bottom: 2),
                                                child: Row(children: [
                                                  Expanded(child: Container()),
                                                  const Text("View",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Appcolors
                                                              .Appbuttoncolor))
                                                ]))
                                          ])))
                            ])),
                  );
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
