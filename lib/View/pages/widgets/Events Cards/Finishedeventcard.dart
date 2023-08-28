// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/View/pages/widgets/TextWidget/app_large_text.dart';
import 'package:pak_endo/View/pages/widgets/AppButtons/custom_button.dart';
import '../../../../Model/event.dart';
import '../FeedbackForm.dart';

class FinishedEventCard extends StatefulWidget {
  final List<Event> finishedEvents;

  const FinishedEventCard({super.key, required this.finishedEvents, });

  @override
  State<FinishedEventCard> createState() => _FinishedEventCardState();
}

class _FinishedEventCardState extends State<FinishedEventCard> {
  bool _isfilled = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, top: 10),
      height: MediaQuery.of(context).size.height * 0.53,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.finishedEvents.length,
        itemBuilder: (context, index) {
          final event = widget.finishedEvents[index];
          final List<Map<String, dynamic>> agendaItems = event.agenda.cast<Map<String, dynamic>>();
          return ClipRRect(
            borderRadius: BorderRadius.circular(19.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
              height: MediaQuery.of(context).size.height * 0.47,
              width: MediaQuery.of(context).size.height * 0.38,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(19.0)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black87,
                    // spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Container(
                        // padding: EdgeInsets.all(300.0),
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          image: DecorationImage(
                              image: NetworkImage(
                                event.featuredImage,
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                          top: MediaQuery.of(context).size.height * 0.03,
                          right: MediaQuery.of(context).size.width * 0.04,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.055,
                            width: MediaQuery.of(context).size.width * 0.115,
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0))),
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
                          )),
                    ]),
                    Container(
                      margin: EdgeInsets.only(
                          top: 12, bottom: 12, left: 12, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text(event.startDate.toString()),
                          Text(agendaItems[0]['from'] as String),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.009,
                    ),
                    AppLargeText(
                      text: event.title,
                      size: 16,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    CustomButton(
                      navigator: "detailspage",
                      text: "Explore the Event",
                      width: 230,
                      height: 40,
                      textfont: 16,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12, right: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Location"),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Text(
                                event.location,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Guests"),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0073,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text("132 ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Icon(
                                    Icons.person,
                                    color: Appcolors.Appbuttoncolor,
                                    size: 15,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Rate"),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return FeedbackForm();
                                    },
                                  );
                                },
                                child: Text("Your feedback",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }
}
