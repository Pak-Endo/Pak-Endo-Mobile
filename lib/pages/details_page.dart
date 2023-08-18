// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:pak_endo/widgets/CustomWidgets/VideoStreamingWidget.dart';
import 'package:pak_endo/widgets/TextWidget/app_large_text.dart';
import 'package:pak_endo/widgets/CustomWidgets/details_page_date_time.dart';
import 'package:pak_endo/widgets/CustomWidgets/timelinewidget.dart';
import '../Constants/app_colors.dart';
import '../widgets/FeedbackForm.dart';
import '../widgets/AppButtons/FeedbackButton.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  
  
  List<String> imageUrls = [
    // Add your image URLs here
    "assets/event1.jpg",
    "assets/login_background.png",
    "assets/event1.jpg"
  ];

  bool isclicked=false;

  bool _isFeedbackOpen = false;

  void _openFeedback() {
    setState(() {
      _isFeedbackOpen = true;
    });
  }

  void _closeFeedback() {
    setState(() {
      _isFeedbackOpen = false;
    });
  }

  void _showFeedbackBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FeedbackForm();
      },
    );
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/usermain"),
            child: Icon(Icons.arrow_back)),
        title: const Text("UpComing Events"),
        titleSpacing: 0.0,
        centerTitle: true,
        toolbarHeight: 73.2,
        toolbarOpacity: 0.8,
        shadowColor: Appcolors.appbluecolor.withOpacity(0.8),
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
              colors: [
                Colors.blue,
                Colors.green,
              ],
            ),
          ), 
        ),
        actions: [
          Container(padding:EdgeInsets.only(right:7.5) ,child:Icon(Icons.favorite))
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => YouTubePlayerPage(videoUrl: 'https://www.youtube.com/watch?v=ceMsPBbcEGg')
              ),
            );
        },
        child: Container(
            height: screenHeight* 0.085,
            width: screenWidth * 0.15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(9.0)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Appcolors.appbluecolor.withOpacity(0.5),
                      Appcolors.appgreencolor.withOpacity(0.5),
                    ])),
            child: Icon(
              Icons.live_tv,
              size: 30,
            )),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 5),
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 13),
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 270,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, _) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: imageUrls.map((imageName) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(),
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Image.asset(
                              imageName,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 150),
                child: DotsIndicator(
                  dotsCount: imageUrls.length,
                  position: _currentIndex,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    color: Colors.grey,
                    activeColor: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.only(left: 15),
                  child: AppLargeText(
                    text: "Kidney Cure 2022 | Doctors Associaton | 2023",
                    size: 25,
                    color: Colors.black,
                  )),
              SizedBox(height: 20),
              VenueDetails(),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.only(left: 15),
                  child: AppLargeText(
                    text: "About Event",
                    size: 25,
                    color: Colors.black,
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, left: 25, right: 9, bottom: 15),
                child: Text(
                  "Welcome to our healthcare event, where we prioritize your well-being and aim to enhance your understanding of the latest advancements in the healthcare industry.",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black87,
                    wordSpacing: 0.7,
                  ),
                ),
              ),

               SizedBox(
                height: screenHeight * 0.02,
              ),
              Container(
                  padding: EdgeInsets.only(left: 15),
                  child: AppLargeText(
                    text: "Timeline",
                    size: 25,
                    color: Colors.black,
                  )),
              SizedBox(
                height: screenHeight * 0.015,
              ),
              CustomTimelineWidget(
                items: [
                  TimelineItem(title: "\t", content: "\x1BIntroduction\x1B\n9:30 to 11:30"),
                  TimelineItem(
                title: '\t',
                content: 'Speaker\nDr John Doe\n9:30 to 11:30',
              ),
              TimelineItem(
                title: '\t',
                content: 'Lunch\nVenue: Hall no 2 \n1:30 to 11:30',
              ),
                ]),

              // Container(child: EventDetailsSection()),
              SizedBox(
                height: screenHeight * 0.06,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: screenWidth * 0.18),
                child: CustomFeedbackButton(
                  navigator: "feedbackform",
                  text: "Give Feedback",
                  width: screenWidth * 0.6,
                  textfont: 16,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.06,
              ),
            ],
          ),
        ),
      ),
    );
  }
}