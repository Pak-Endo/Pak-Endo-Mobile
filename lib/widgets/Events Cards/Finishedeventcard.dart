// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/widgets/app_large_text.dart';
import 'package:pak_endo/widgets/custom_button.dart';

import '../FeedbackForm.dart';
import '../blinktext.dart';

class FinishedEventCard extends StatefulWidget {
  const FinishedEventCard({super.key});

  @override
  State<FinishedEventCard> createState() => _FinishedEventCardState();
}

class _FinishedEventCardState extends State<FinishedEventCard> {
  bool _isfilled = false;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      image: AssetImage(
                        "assets/event1.jpg",
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
                        color: Colors.white60,
                        borderRadius: BorderRadius.all(Radius.circular(3.0))),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isfilled = !_isfilled;
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        size: 25,
                        color:
                            _isfilled ? Appcolors.Appbuttoncolor : Colors.white,
                      ),
                    ),
                  )),
            ]),
            Container(
              margin: EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Sun, Oct 29th"),
                  Text("11am"),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.009,
            ),
            AppLargeText(
              text: "Mental Health Facilities Study",
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
                        height: MediaQuery.of(context).size.height * 0.006,
                      ),
                      Text(
                        "LHR",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Guests"),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0073,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text("132 ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
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
                        height: MediaQuery.of(context).size.height * 0.006,
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
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
