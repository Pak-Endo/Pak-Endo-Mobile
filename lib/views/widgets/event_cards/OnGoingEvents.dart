import 'package:flutter/material.dart';
import 'package:pak_endo/Model/event_model.dart';
import 'package:pak_endo/views/pages/details_page.dart';

import '../../../../Constants/app_colors.dart';
import '../TextWidget/app_large_text.dart';

class OngoingEventsCard extends StatefulWidget {
  final List<EventModel> ongoingEvents;

  const OngoingEventsCard({Key? key, required this.ongoingEvents})
      : super(key: key);

  @override
  State<OngoingEventsCard> createState() => _OngoingEventsCardState();
}

class _OngoingEventsCardState extends State<OngoingEventsCard> {
  bool _isfilled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: MediaQuery.of(context).size.height * 0.4,
      child:widget.ongoingEvents.isEmpty
          ? const Center(
              child: Text(
                "No ongoing events available.",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.ongoingEvents.length,
        itemBuilder: (context, index) {
          final event = widget.ongoingEvents[index];
          return GestureDetector(
            onTap: () { Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  DetailPage(event: event,),
      ),
    );},
            child: Container(
              padding: EdgeInsets.only(right: 7),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black87,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(event.featuredImage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 24.0),
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  Positioned(
                    bottom: 5,
                    left: MediaQuery.of(context).size.width * 0.07,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        width: MediaQuery.of(context).size.width * 0.50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppLargeText(
                                text: event.title!, // Use event title here
                                size: 17,
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.location_pin,
                                    color: Appcolors.Appbuttoncolor,
                                    size: 18,
                                  ),
                                  AppLargeText(
                                    text: event.location!, // Use event location here
                                    size: 12,
                                    color: Colors.black38,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/Logo_Icon.png', // Replace with sponsor icon asset path
                                        height: 24,
                                        width: 25,
                                      ),
                                      const SizedBox(width: 5),
                                      const Text(
                                        "Sponsor",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Add the action you want to perform when the button is pressed
                                    },
                                    child: const Text(
                                      "View",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.045,
                    right: MediaQuery.of(context).size.width * 0.05,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.055,
                      width: MediaQuery.of(context).size.width * 0.115,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isfilled = !_isfilled;
                          });
                        },
                        child: Icon(
                          Icons.favorite,
                          size: 25,
                          color: _isfilled
                              ? Appcolors.Appbuttoncolor
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

