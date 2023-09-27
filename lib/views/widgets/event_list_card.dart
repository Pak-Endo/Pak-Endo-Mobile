import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/controllers/fav_controller.dart';
import 'package:pak_endo/controllers/home_controller.dart';
import 'package:pak_endo/model/event_model.dart';
import 'package:pak_endo/routes/navigations.dart';
import 'package:pak_endo/views/widgets/custom_text/app_large_text.dart';

class EventListCard extends StatelessWidget {
  EventListCard(this.event, {super.key});

  final EventModel event;
  final HomeController homeController = Get.find<HomeController>();
  final FavController favController = Get.find<FavController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigatorKey.currentState!
          .pushNamed(PageRoutes.detailPage, arguments: event),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.18,
          margin: const EdgeInsets.only(top: 17, right: 8, left: 8, bottom: 6),
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
                      width: MediaQuery.of(context).size.height * 0.16,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          color: Appcolors.Appbuttoncolor,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                  event.featuredImage!)))),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 13, left: 10, bottom: 5, right: 5),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          homeController.getStartAndEndDate(
                                              event.startDate!, event.endDate!),
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12)),
                                      bookmark(event)
                                    ]),
                                AppLargeText(
                                    text: event.title!,
                                    size: 16,
                                    color: Colors.black),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.location_pin,
                                          color: Appcolors.Appbuttoncolor,
                                          size: 14),
                                      SizedBox(
                                        width: 180,
                                        child: Text(event.location!.name!,
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.blueGrey,
                                                fontSize: 12)),
                                      )
                                    ]),
                                const SizedBox(height: 4),
                                Text(event.description!,
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.blueGrey,
                                        fontSize: 13)),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        right: 5.0, bottom: 2),
                                    child: Row(children: [
                                      Expanded(child: Container()),
                                      const Text("View More",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12))
                                    ]))
                              ])))
                ])));
  }

  bookmark(EventModel event) {
    //Only show favourites to logged in user
    return homeController.isLoggedIn == null
        ? const SizedBox.shrink()
        : GestureDetector(
            onTap: () => favController.addAndRemoveFavEvent(event.id!),
            child: Obx(() => Icon(
                favController.isFavourite.contains(event.id)
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 25,
                color: favController.isFavourite.contains(event.id)
                    ? Appcolors.Appbuttoncolor
                    : Colors.grey)));
  }
}
