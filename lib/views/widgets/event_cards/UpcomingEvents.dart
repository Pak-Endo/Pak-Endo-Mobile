import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/controllers/fav_controller.dart';
import 'package:pak_endo/controllers/home_controller.dart';
import 'package:pak_endo/model/event_model.dart';
import 'package:pak_endo/routes/navigations.dart';

import '../../../../constants/app_colors.dart';
import '../custom_text/app_large_text.dart';

class UpcomingEventsCard extends StatelessWidget {
  final List<EventModel> upcomingEvents;
  final HomeController homeController = Get.find<HomeController>();
  final FavController favController = Get.put(FavController());

  UpcomingEventsCard({Key? key, required this.upcomingEvents})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: ListView.builder(
            padding: const EdgeInsets.only(left: 10),
            scrollDirection: Axis.horizontal,
            itemCount: upcomingEvents.length,
            itemBuilder: (context, index) {
              final event = upcomingEvents[index];
              return GestureDetector(
                  onTap: () => navigatorKey.currentState!
                      .pushNamed(PageRoutes.detailPage, arguments: event),
                  child: Container(
                      padding: const EdgeInsets.only(right: 7),
                      child: Stack(children: [
                        ///Image
                        getFeaturedImage(event),

                        ///INFORMATION
                        getInformation(event),

                        ///BOOKMARK
                        bookmark(event)
                      ])));
            }));
  }

  getFeaturedImage(EventModel event) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white60,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black87, blurRadius: 7, offset: Offset(0, 3))
            ],
            image: DecorationImage(
                image: CachedNetworkImageProvider(event.featuredImage!),
                fit: BoxFit.cover)),
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 24.0),
        width: MediaQuery.of(Get.context!).size.width * 0.6);
  }

  getInformation(EventModel event) {
    return Positioned(
        bottom: 5,
        left: MediaQuery.of(Get.context!).size.width * 0.07,
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: MediaQuery.of(Get.context!).size.width * 0.5,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(18.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: const Offset(0, 1))
                    ]),
                child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 4.0, bottom: 3.0),
                          child: AppLargeText(
                              text: event.title!,
                              size: 16,
                              color: Colors.black)),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              homeController.getStartAndEndDate(
                                  event.startDate!, event.endDate!),
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 12))),
                      const SizedBox(height: 5),
                      Row(mainAxisSize:MainAxisSize.min,children: [
                        const Icon(Icons.location_pin,
                            color: Appcolors.Appbuttoncolor, size: 16),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: 150,
                          child: Text(event.location!.name!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(fontSize: 13)),
                        )
                      ]),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Text("View More",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                decoration: TextDecoration.underline)),
                      ),
                    ])))));
  }

  bookmark(EventModel event) {
    if (homeController.isLoggedIn == null) {
      return const SizedBox.shrink();
    }

    return Positioned(
        top: MediaQuery.of(Get.context!).size.height * 0.045,
        right: MediaQuery.of(Get.context!).size.width * 0.04,
        child: Container(
            height: MediaQuery.of(Get.context!).size.height * 0.055,
            width: MediaQuery.of(Get.context!).size.width * 0.115,
            decoration: const BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(Radius.circular(3.0))),
            child: Obx(() {
              return GestureDetector(
                  onTap: () => favController.addAndRemoveFavEvent(event.id!),
                  child: Icon(Icons.favorite,
                      size: 25,
                      color: favController.isFavourite.contains(event.id)
                          ? Appcolors.Appbuttoncolor
                          : Colors.white));
            })));
  }
}
