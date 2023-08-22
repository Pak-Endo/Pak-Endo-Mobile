import 'package:flutter/material.dart';

import '../../../../Constants/app_colors.dart';

class UpComingEventsCard extends StatefulWidget {
  const UpComingEventsCard({super.key});

  @override
  State<UpComingEventsCard> createState() => _UpComingEventsCardState();
}

class _UpComingEventsCardState extends State<UpComingEventsCard> {
  bool _isfilled = true;
  final List<int> numbers = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      padding: EdgeInsets.only(
        left: 10,
      ),
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () =>
                Navigator.pushReplacementNamed(context, "/detailspage"),
            child: Container(
              padding: EdgeInsets.only(right: 7),
              child: Stack(
                children: [
                  // Background Image Container
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          // spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/login_background.png'), // Replace 'background_image.png' with your image asset path
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 24.0),
                    width: MediaQuery.of(context).size.width * 0.6,
                    // Add child widgets here if needed
                  ),
                  // Sponsor Container at the bottom
                  Positioned(
                    bottom: 5,
                    left: MediaQuery.of(context).size.width * 0.07,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        width: MediaQuery.of(context).size.width *
                            0.5, // Adjust the width of the sponsor container (less than image width)
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Appcolors.Appbuttoncolor,
                                  ),
                                  Text(" Karachi, Pakistan"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/Logo_Icon.png', // Replace 'sponsor_icon.png' with your sponsor icon asset path
                                        height: 24,
                                        width: 25,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Sponsor",
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
