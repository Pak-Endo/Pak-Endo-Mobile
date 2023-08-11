// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/widgets/Upcomingeventcard.dart';
import 'package:pak_endo/widgets/previous_event_card.dart';

import '../widgets/app_large_text.dart';
import 'SearchPage.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final List<int> numbers = [1, 2, 3, 4, 5];
  TextEditingController _tabcontroller = TextEditingController();

  void _openSearchPage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SearchPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Contaainer for profile Icon
              Container(
                padding: EdgeInsets.only(top: 70, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 55,
                      width: 40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/Logo_Icon.png"),
                            fit: BoxFit.fill),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5,),
                      child: AppLargeText(
                        text: "Endo-Pak",
                        size: 20.5,
                        color: Color.fromARGB(255, 65, 163, 110),
                        fontFamily: "Poppins-SemiBold",
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.33,),
                    Text(
                      "Search",
                      style: TextStyle(color: Colors.grey),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 28,
                      ),
                      onPressed: () {
                        _openSearchPage(context);
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              //Row of Ongoing events title and See All
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: AppLargeText(
                      text: "Ongoing Events",
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, "/listevents"),
                      child: AppLargeText(
                        text: "See all >>",
                        color: Appcolors.Appbuttoncolor,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),

              //Container for Ongoing Events Display ListView
              Container(
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
                      onTap: () => Navigator.pushReplacementNamed(
                          context, "/detailspage"),
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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
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
                              bottom: 5,
                              left: MediaQuery.of(context).size.width * 0.07,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  width: MediaQuery.of(context).size.width *
                                      0.5, // Adjust the width of the sponsor container (less than image width)
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18.0)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black87.withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 1), // changes position of shadow
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
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),


              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5, left: 20),
                    child: AppLargeText(
                      text: "Upcoming Events",
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, "/listevents"),
                      child: AppLargeText(
                        text: "See all >>",
                        color: Appcolors.Appbuttoncolor,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),

              //  SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.06,
              // ),

              Container(
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
                      onTap: () => Navigator.pushReplacementNamed(
                          context, "/detailspage"),
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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
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
                              bottom: 5,
                              left: MediaQuery.of(context).size.width * 0.07,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  width: MediaQuery.of(context).size.width *
                                      0.5, // Adjust the width of the sponsor container (less than image width)
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18.0)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black87.withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 1), // changes position of shadow
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
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),

              //Row of Upcoming event title and See All
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: AppLargeText(
                      text: "Finished Events",
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, "/listevents"),
                      child: AppLargeText(
                        text: "See all >>",
                        color: Appcolors.Appbuttoncolor,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),

              //Container for UpComing Events Display ListView
              Container(
                padding: EdgeInsets.only(left: 5, top: 10),
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numbers.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(
                          19.0), // Set the border radius here
                      child: EventCard(),
                    );
                  },
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),

              
              //Container for Previous Events Display ListView
              // Container(
              //   margin: EdgeInsets.only(bottom: 10, top: 5, left: 5),
              //   padding: EdgeInsets.only(left: 5),
              //   height: MediaQuery.of(context).size.height * 0.45,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: numbers.length,
              //     itemBuilder: (context, index) {
              //       return GestureDetector(
              //           onTap: () => Navigator.pushReplacementNamed(
              //               context, "/detailspage"),
              //           child: PreviousEventCard());
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
