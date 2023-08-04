// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';

import '../widgets/app_large_text.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final List<int> numbers = [1, 2, 3, 4, 5];
  TextEditingController _tabcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // fit: StackFit.expand,
        children: [
          Container(
            child: Image.asset(
              "assets/login_background.png",
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              // color: Colors.black.withOpacity(0.4),
              // colorBlendMode: BlendMode.colorDodge
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Appcolors.appbluecolor.withOpacity(0.5),
                  Appcolors.appgreencolor.withOpacity(0.5),
                ])),
          ),
          Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 70, left: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/profile.jpg"),
                                fit: BoxFit.fill),
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: AppLargeText(
                          text: "Ongoing Events",
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: AppLargeText(
                          text: "See all >>",
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    height: MediaQuery.of(context).size.height * 0.40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: numbers.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            // Background Image Container
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/login_background.png'), // Replace 'background_image.png' with your image asset path
                                  fit: BoxFit.cover,
                                ),
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 24.0),
                              width: MediaQuery.of(context).size.width * 0.6,
                              // Add child widgets here if needed
                            ),
                            // Sponsor Container at the bottom
                            Positioned(
                              bottom: 0,
                              left: MediaQuery.of(context).size.width * 0.07,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18.0)),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    width: MediaQuery.of(context).size.width *
                                        0.5, // Adjust the width of the sponsor container (less than image width)
                                    color: Colors.white,
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
                                                    width: 24,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    "Sponsor",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  // Add the action you want to perform when the button is pressed
                                                },
                                                child: Text(
                                                  "View",
                                                  style: TextStyle(
                                                      color: Colors.grey),
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
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: AppLargeText(
                          text: "Upcoming Events",
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: AppLargeText(
                          text: "See all >>",
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    height: MediaQuery.of(context).size.height * 0.40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: numbers.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            // Background Image Container
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/event1.jpg'), // Replace 'background_image.png' with your image asset path
                                  fit: BoxFit.cover,
                                ),
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 24.0),
                              width: MediaQuery.of(context).size.width * 0.6,
                              // Add child widgets here if needed
                            ),
                            // Sponsor Container at the bottom
                            Positioned(
                              bottom: 0,
                              left: MediaQuery.of(context).size.width * 0.07,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18.0)),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    width: MediaQuery.of(context).size.width *
                                        0.5, // Adjust the width of the sponsor container (less than image width)
                                    color: Colors.white,
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
                                                    width: 24,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    "Sponsor",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  // Add the action you want to perform when the button is pressed
                                                },
                                                child: Text(
                                                  "View",
                                                  style: TextStyle(
                                                      color: Colors.grey),
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
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: AppLargeText(
                          text: "Previous Events",
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: AppLargeText(
                          text: "See all >>",
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
