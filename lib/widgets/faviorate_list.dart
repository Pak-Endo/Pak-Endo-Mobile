import 'package:flutter/material.dart';

import '../Constants/app_colors.dart';
import 'app_large_text.dart';

class ListFaviorates extends StatefulWidget {
  const ListFaviorates({super.key});

  @override
  State<ListFaviorates> createState() => _ListFavioratesState();
}

class _ListFavioratesState extends State<ListFaviorates> {
  bool filled = true;
  final List<int> numbers = [1, 2, 3];
  final List<String> events = ['Ongoing', 'Upcoming', 'Previous'];
  final List<String> rcolors = [
    'appgreencolor',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            AppLargeText(text: "Favourite Events", color: Colors.black,),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.023,
            // ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: numbers.length,
                  itemBuilder: (_, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.195,
                      margin: const EdgeInsets.only(
                          top: 17, right: 8, left: 8, bottom: 6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(95, 24, 21, 21),
                            blurRadius: 10,
                            offset: Offset(2, 2),
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.height * 0.16,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  color: Appcolors.Appbuttoncolor,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("assets/event1.jpg"),
                                  ),
                                ),
                              ),
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
                                          "01st OCT - WED 10:30 Pm",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 1.0,
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.005),
                                        child: AppLargeText(
                                            text: "Heart Health - PIMS Lahore",
                                            size: 16,
                                            color: Colors.black),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 7.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.location_pin,
                                              color: Appcolors.Appbuttoncolor,
                                            ),
                                            Text(
                                              "Gulberg, Lahore",
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.47),
                                        child: GestureDetector(
                                          onTap: () => Navigator.pushNamed(
                                              context, "/detailspage"),
                                          child: const Text(
                                            "View",
                                            style: TextStyle(
                                                color:
                                                    Appcolors.Appbuttoncolor),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 15,
                            right: -0.001,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  filled =! filled;
                                });
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width: MediaQuery.of(context).size.width * 0.08,
                                padding: EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                    // color: Colors.grey.withOpacity(0.3),
                                    // borderRadius: BorderRadius.only(
                                    //   topRight: Radius.circular(10),
                                    //   bottomLeft: Radius.circular(10),
                                    // ),
                                    ),
                                child: Icon(
                                  Icons.favorite,
                                  color: filled
                                      ? Appcolors.Appbuttoncolor
                                      : Colors
                                          .grey, // Set color based on favorite state
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
