import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/Model/event_model.dart';
import 'package:pak_endo/routes/navigations.dart';
import 'package:pak_endo/views/widgets/feedback_form.dart';

import '../AppButtons/custom_button.dart';
import '../TextWidget/app_large_text.dart';

class FinishedEventCard extends StatefulWidget {
  final List<EventModel> finishedEvents;

  const FinishedEventCard({super.key, required this.finishedEvents});

  @override
  State<FinishedEventCard> createState() => _FinishedEventCardState();
}

class _FinishedEventCardState extends State<FinishedEventCard> {
  bool _isFilled = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.53,
        child: ListView.builder(
            padding: const EdgeInsets.only(left: 5, top: 10),
            scrollDirection: Axis.horizontal,
            itemCount: widget.finishedEvents.length,
            itemBuilder: (context, index) {
              final event = widget.finishedEvents[index];
              return ClipRRect(
                  borderRadius: BorderRadius.circular(19.0),
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 9),
                      height: MediaQuery.of(context).size.height * 0.47,
                      width: MediaQuery.of(context).size.height * 0.38,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(19.0)),
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
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: AppLargeText(
                                  text: event.title!,
                                  size: 16,
                                  color: Colors.black),
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                            /// CUSTOM BUTTON
                            CustomButton(
                              text: "Explore the Event",
                              width: 230,
                              height: 40,
                              textfont: 16,
                              onTap: () => navigatorKey.currentState!.pushNamed(
                                  PageRoutes.detailPage,
                                  arguments: event),
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                            /// Event INFORMATION
                            eventInfo(event)
                          ])));
            }));
  }

  loadImage(event) {
    return Stack(children: [
      Container(
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              image: DecorationImage(
                  image: CachedNetworkImageProvider(event.featuredImage!),
                  fit: BoxFit.cover))),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.03,
          right: MediaQuery.of(context).size.width * 0.04,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.055,
              width: MediaQuery.of(context).size.width * 0.115,
              decoration: const BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.all(Radius.circular(3.0))),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isFilled = !_isFilled;
                    });
                  },
                  child: Icon(Icons.favorite,
                      size: 25,
                      color: _isFilled
                          ? Appcolors.Appbuttoncolor
                          : Colors.white))))
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
                Text(event.location!,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.002),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.star_rate, color: Colors.grey, size: 15),
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => const FeedbackForm(),
                  ),
                  child: const Text('Avg. Rating: 4.6',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.002),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.person, color: Colors.grey, size: 15),
                SizedBox(width: 6),
                Text("Guests: 132 ",
                    style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ));
  }
}
