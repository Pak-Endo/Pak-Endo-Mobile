import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/constants/app_colors.dart';
import 'package:pak_endo/controllers/fav_controller.dart';
import 'package:pak_endo/controllers/home_controller.dart';
import 'package:pak_endo/controllers/profile_controller.dart';
import 'package:pak_endo/model/event_model.dart';
import 'package:pak_endo/routes/navigations.dart';
import 'package:pak_endo/views/widgets/CustomWidgets/custom_view.dart';
import 'package:pak_endo/views/widgets/feedback_form.dart';

import '../AppButtons/custom_button.dart';
import '../custom_text/app_large_text.dart';

class AttendedEventsCard extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  final FavController favController = Get.put(FavController());
  final ProfileController profileController = Get.find<ProfileController>();

  AttendedEventsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
      if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
          scrollInfo is ScrollEndNotification) {
        profileController.getAttendedEvents();
        return true;
      } else {
        return false;
      }
    }, child: Obx(() {
      if (profileController.attendedEvents.isEmpty) {
        return const CustomView(
            "You have not yet attend any event", Icons.refresh);
      }

      return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 5, top: 10),
              scrollDirection: Axis.horizontal,
              itemCount: profileController.attendedEvents.length,
              itemBuilder: (context, index) {
                final event = profileController.attendedEvents[index];
                return ClipRRect(
                    borderRadius: BorderRadius.circular(19.0),
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 9),
                        height: MediaQuery.of(context).size.height * 0.47,
                        width: MediaQuery.of(context).size.height * 0.38,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(19.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black87,
                                  blurRadius: 7,
                                  offset: Offset(0, 3))
                            ],
                            color: Colors.white),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              /// FEATHERED IMAGE
                              loadImage(event),
                              Container(
                                  margin: const EdgeInsets.only(
                                      top: 12, bottom: 12, left: 12, right: 12),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(event.startDate.toString()),
                                        Text(event.agenda![0].from as String)
                                      ])),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: AppLargeText(
                                    text: event.title!,
                                    size: 16,
                                    color: Colors.black),
                              ),

                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),

                              /// CUSTOM BUTTON
                              CustomButton(
                                text: "Explore the Event",
                                width: 230,
                                height: 40,
                                textfont: 16,
                                onTap: () => navigatorKey.currentState!
                                    .pushNamed(PageRoutes.detailPage,
                                        arguments: event),
                              ),

                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),

                              /// Event INFORMATION
                              eventInfo(event)
                            ])));
              }));
    }));
  }

  loadImage(EventModel event) {
    return Stack(children: [
      Container(
          height: MediaQuery.of(Get.context!).size.height * 0.2,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              image: DecorationImage(
                  image: CachedNetworkImageProvider(event.featuredImage!),
                  fit: BoxFit.cover))),

      //Only show favourites to logged in user
      homeController.isLoggedIn == null
          ? const SizedBox.shrink()
          : Positioned(
              top: MediaQuery.of(Get.context!).size.height * 0.03,
              right: MediaQuery.of(Get.context!).size.width * 0.04,
              child: Container(
                  height: MediaQuery.of(Get.context!).size.height * 0.055,
                  width: MediaQuery.of(Get.context!).size.width * 0.115,
                  decoration: const BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.all(Radius.circular(3.0))),
                  child: Obx(() {
                    return GestureDetector(
                        onTap: () =>
                            favController.addAndRemoveFavEvent(event.id!),
                        child: Icon(Icons.favorite,
                            size: 25,
                            color: favController.isFavourite.contains(event.id)
                                ? Appcolors.Appbuttoncolor
                                : Colors.white));
                  })))
    ]);
  }

  eventInfo(EventModel event) {
    return Container(
        margin: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.grey, size: 15),
                const SizedBox(width: 6),
                Text(event.location!.name!,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: MediaQuery.of(Get.context!).size.height * 0.002),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.event, color: Colors.grey, size: 15),
                const SizedBox(width: 6),
                Text(event.type!,
                    style: const TextStyle(fontWeight: FontWeight.w500))
                // GestureDetector(
                //   onTap: () => showModalBottomSheet(
                //     context: Get.context!,
                //     isScrollControlled: true,
                //     builder: (context) => const FeedbackForm(),
                //   ),
                //   child: const Text('Avg. Rating: 4.6',
                //       style: TextStyle(fontWeight: FontWeight.w500)),
                // ),
              ],
            ),
            // SizedBox(height: MediaQuery.of(Get.context!).size.height * 0.002),
            // const Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Icon(Icons.person, color: Colors.grey, size: 15),
            //     SizedBox(width: 6),
            //     Text("Guests: 132 ",
            //         style: TextStyle(fontWeight: FontWeight.w500)),
            //   ],
            // ),
          ],
        ));
  }
}
