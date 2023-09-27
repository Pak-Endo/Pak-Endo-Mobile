import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/controllers/search_controller.dart';
import 'package:pak_endo/routes/navigations.dart';

import '../../constants/app_colors.dart';

class SearchResult extends StatelessWidget {
  SearchResult({super.key});

  final SearchPageController _searchController =
      Get.find<SearchPageController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(left: 5, right: 5),
              itemCount: _searchController.searchResult.length,
              itemBuilder: (_, index) {
                final event = _searchController.searchResult[index];
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
                                offset: Offset(2, 2))
                          ]),
                      child: Stack(children: [
                        Row(
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
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context).size.height *
                                              0.017,
                                          left: MediaQuery.of(context).size.width *
                                              0.025,
                                          bottom: 5,
                                          right: 5),
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.010),
                                                child: Text(
                                                    event.startDate.toString(),
                                                    style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12))),
                                            const SizedBox(height: 5),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.only(right: 40),
                                                child: Text(event.title!,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    style: const TextStyle(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w500))),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.only(top: 7.0),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      const Icon(Icons.location_pin,
                                                          color: Appcolors
                                                              .Appbuttoncolor,
                                                          size: 12),
                                                      Text(event.location!.name!,
                                                          style: const TextStyle(
                                                              color: Colors.blueGrey,
                                                              fontSize: 12))
                                                    ])),
                                            const SizedBox(height: 5),
                                            Text(event.description!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis)
                                          ])))
                            ]),
                        Positioned(
                          bottom: 5,
                          right: 20,
                          child: Container(
                              alignment: Alignment.bottomRight,
                              child: const Text("View",
                                  style: TextStyle(color: Appcolors.Appbuttoncolor))),
                        ),
                        Positioned(
                            top: 20,
                            right: -40,
                            child: Transform.rotate(
                                angle: 0.785398, // 45 degrees in radians
                                child: Container(
                                    width: 150,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color:
                                          Appcolors.Appbuttoncolor.withOpacity(0.8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        event.eventStatus!,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ))))
                      ])),
                );
              }),
        ),
      ],
    );
  }
}
