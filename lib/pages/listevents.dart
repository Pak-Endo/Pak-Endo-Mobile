// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/widgets/app_large_text.dart';

class UpComingEvents extends StatefulWidget {
  const UpComingEvents({super.key});

  @override
  State<UpComingEvents> createState() => _UpComingEventsState();
}

class _UpComingEventsState extends State<UpComingEvents> {
  final List<int> numbers = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UpComing Events"),
        titleSpacing: 0.0,
        centerTitle: true,
        toolbarHeight: 73.2,
        toolbarOpacity: 0.8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        elevation: 0.00,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: const [
                Colors.blue,
                Colors.green,
              ],
            ),
          ),
        ),
      ),
      body: Container(
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
                        height: MediaQuery.of(context).size.height * 0.20,
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
                            ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.height * 0.16,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  color: Appcolors.Appbuttoncolor,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        "assets/event1.jpg",
                                      ))),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 13, left: 10, bottom: 5, right: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "01st OCT - WED 10:30 Pm",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.only(top: 9.0, left: 5),
                                        child: AppLargeText(
                                          text: "Heart Health - PIMS Lahore",
                                          size: 16,
                                          color: Colors.black,
                                        )),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 9.0, left: 2),
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
                                            "PIMS doctor's association ",
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right:5.0,bottom: 2),
                                      child: Row(
                                        children: [
                                          Expanded(child: Container()),
                                          GestureDetector(
                                            onTap: () => Navigator
                                                .pushNamed(
                                                    context, "/detailspage"),
                                            child: Text(
                                              "View",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                  color: Appcolors
                                                      .Appbuttoncolor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
      ),
    );
  }
}
