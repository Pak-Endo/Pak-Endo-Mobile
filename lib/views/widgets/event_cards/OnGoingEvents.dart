import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pak_endo/Model/event_model.dart';
import 'package:pak_endo/routes/navigations.dart';

import '../../../../Constants/app_colors.dart';
import '../custom_text/app_large_text.dart';

class OngoingEventsCard extends StatefulWidget {
  final List<EventModel> ongoingEvents;

  const OngoingEventsCard({Key? key, required this.ongoingEvents})
      : super(key: key);

  @override
  State<OngoingEventsCard> createState() => _OngoingEventsCardState();
}

class _OngoingEventsCardState extends State<OngoingEventsCard> {
  bool _isfilled = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: ListView.builder(
            padding: const EdgeInsets.only(left: 10),
            scrollDirection: Axis.horizontal,
            itemCount: widget.ongoingEvents.length,
            itemBuilder: (context, index) {
              final event = widget.ongoingEvents[index];
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
        width: MediaQuery.of(context).size.width * 0.6);
  }

  getInformation(EventModel event) {
    return Positioned(
        bottom: 5,
        left: MediaQuery.of(context).size.width * 0.07,
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: MediaQuery.of(context).size.width * 0.5,
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
                      Row(children: [
                        const Icon(Icons.location_pin,
                            color: Appcolors.Appbuttoncolor, size: 16),
                        const SizedBox(width: 5),
                        Text(event.location!,
                            style: const TextStyle(fontSize: 13))
                      ]),
                      const SizedBox(height: 5),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Sponsored',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12))),
                      const SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Image.asset('assets/Logo_Icon.png',
                                    height: 16, width: 12, fit: BoxFit.fill),
                                const SizedBox(width: 5),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                      event.organizer! + event.organizer!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: true,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                )
                              ]),
                              const Text("View",
                                  style: TextStyle(color: Colors.grey))
                            ]),
                      ),
                      const SizedBox(height: 10)
                    ])))));
  }

  bookmark(EventModel event) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.045,
        right: MediaQuery.of(context).size.width * 0.05,
        child: Container(
            height: MediaQuery.of(context).size.height * 0.055,
            width: MediaQuery.of(context).size.width * 0.115,
            decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.all(Radius.circular(3.0))),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isfilled = !_isfilled;
                  });
                },
                child: Icon(Icons.favorite,
                    size: 25,
                    color:
                        _isfilled ? Appcolors.Appbuttoncolor : Colors.white))));
  }
}

