import 'package:flutter/material.dart';

import '../../../Constants/app_colors.dart';
import 'TextWidget/app_large_text.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final List<int> numbers = [1, 2, 3];
  final List<String> events = ['Ongoing', 'Upcoming', 'Previous'];
  final List<String> rcolors= ['appgreencolor',];

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
              height: MediaQuery.of(context).size.height * 0.023,
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: numbers.length,
                  itemBuilder: (_, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.18,
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
                                      top: MediaQuery.of(context).size.height*0.017, left: MediaQuery.of(context).size.width*0.025, bottom: 5, right: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment:
                                       CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.010),
                                        child: Text(
                                          "01st OCT - WED 10:30 Pm",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top:10,  left: MediaQuery.of(context).size.width*0.03),
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
                                          onTap: () =>
                                              Navigator.pushNamed(
                                                  context, "/detailPage"),
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
                            top: 20,
                            right: -10,
                            child: Transform.rotate(
                              angle: 0.785398, // 45 degrees in radians
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Appcolors.Appbuttoncolor.withOpacity(0.8),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  "${events[index]}",
                                  style: TextStyle(color: Colors.white,fontSize: 14),
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
