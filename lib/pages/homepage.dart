// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/widgets/Events%20Cards/OnGoingEvents.dart';
import 'package:pak_endo/widgets/Events%20Cards/UpcomingEvents.dart';
import 'package:pak_endo/widgets/Events%20Cards/Finishedeventcard.dart';

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

              //Top profile bar code
              Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1, left: MediaQuery.of(context).size.height*0.023),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.0895,
                      width: MediaQuery.of(context).size.width*0.130,
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
                    Expanded(child: SizedBox()),
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
                      onTap: () => Navigator.pushNamed(
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
             OngoingEventsCard(),


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


              UpComingEventsCard(),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),

              //Row of Finished event title and See All
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
                      onTap: () => Navigator.pushNamed(
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

              //Container for Fiished Events Display ListView
              Container(
                padding: EdgeInsets.only(left: 5, top: 10),
                height: MediaQuery.of(context).size.height * 0.53,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numbers.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(
                          19.0), // Set the border radius here
                      child: FinishedEventCard(),
                    );
                  },
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


