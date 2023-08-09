// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:pak_endo/widgets/app_large_text.dart';
import 'package:pak_endo/widgets/custom_button.dart';
import 'package:pak_endo/widgets/details_page_date_time.dart';

import '../Constants/app_colors.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<String> imageUrls = [
    // Add your image URLs here
    "assets/event1.jpg",
    "assets/login_background.png",
    "assets/login_background.png",
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text("UpComing Events"),
      titleSpacing: 0.0,
      centerTitle: true,
      toolbarHeight: 73.2,
      toolbarOpacity: 0.8,
      shadowColor:Appcolors.appbluecolor.withOpacity(0.8),
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
                    height: 250.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, _) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: imageUrls.map((imageName) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(),
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.asset(
                            imageName,
                            fit: BoxFit.cover,
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
                    size: 28,
                    color: Colors.black,
                  )),
              SizedBox(height: 20),
              VenueDetails(),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.only(left: 15),
                  child: AppLargeText(
                    text: "About Event",
                    size: 34,
                    color: Colors.black,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 5,left: 25,right: 9,bottom: 15),
                child: Text(
                  "Welcome to our healthcare event, where we prioritize your well-being and aim to enhance your understanding of the latest advancements in the healthcare industry.",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black87,
                    wordSpacing: 0.7,
                    ),
                  
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(left: 90),
              //   child: CustomButton(
              //     navigator: "navigator",
              //     text: "Reserve your seat",
              //     width: 200,
              //     textfont: 16,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
