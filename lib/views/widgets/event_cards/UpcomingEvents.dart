import 'package:flutter/material.dart';
import 'package:pak_endo/Model/event_model.dart';
import 'package:pak_endo/views/pages/details_page.dart';

import '../../../../Constants/app_colors.dart';
import '../../../../Model/event.dart';
import '../TextWidget/app_large_text.dart';

class UpComingEventsCard extends StatefulWidget {
  final List<EventModel> upcomingEvents;

  UpComingEventsCard({Key? key, required this.upcomingEvents})
      : super(key: key);

  @override
  State<UpComingEventsCard> createState() => _UpComingEventsCardState();
}

class _UpComingEventsCardState extends State<UpComingEventsCard> {
  bool _isfilled = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.upcomingEvents.length,
        itemBuilder: (context, index) {
          final event = widget.upcomingEvents[index];
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, "/detailPage",arguments: DetailPage(event: event,)),
            child: Container(
              padding: EdgeInsets.only(right: 7),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      color: Colors.white60,
                      boxShadow: [
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
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 24.0),
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  Positioned(
                    bottom: 5,
                    left: MediaQuery.of(context).size.width * 0.07,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        width: MediaQuery.of(context).size.width * 0.5,
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
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:8.0,left: 4.0,bottom: 3.0),
                                child: AppLargeText(
                                      text: event.title!,
                                      size: 16,
                                      color: Colors.black,
                                    ),
                              ),
                              Row(
                                children: [
                                  
                                  Icon(
                                    Icons.location_pin,
                                    color: Appcolors.Appbuttoncolor,
                                  ),
                                  Text(event.location!),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/Logo_Icon.png',
                                        height: 24,
                                        width: 25,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        event.organizer!,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Add the action you want to perform when the button is pressed
                                    },
                                    child: Text(
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
