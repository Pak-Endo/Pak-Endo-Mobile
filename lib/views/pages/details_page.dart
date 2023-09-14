import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/Model/event_model.dart';
import 'package:pak_endo/routes/navigations.dart';
import 'package:pak_endo/views/widgets/AppButtons/custom_button.dart';
import 'package:pak_endo/views/widgets/TabBar.dart';
import 'package:pak_endo/views/widgets/blinking_icon.dart';
import 'package:pak_endo/views/widgets/feedback_form.dart';

import '../../Constants/app_colors.dart';
import '../widgets/CustomWidgets/details_page_date_time.dart';
import '../widgets/custom_text/app_large_text.dart';

class DetailPage extends StatefulWidget {
  final EventModel event;

  const DetailPage({super.key, required this.event});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: getAppBar(),
        floatingActionButton: getFAB(),
        body: Container(
            margin: const EdgeInsets.only(top: 5),
            height: double.maxFinite,
            width: double.maxFinite,
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  /// CAROUSAL SLIDER
                  getImage(),

                  /// INFORMATION
                  eventInfo(),

                  ///TIMELINES
                  timelines(),

                  /// CUSTOM BUTTON
                  Center(
                      child: CustomButton(
                          text: "Give Feedback",
                          width: screenWidth / 2,
                          height: 40,
                          textfont: 16,
                          onTap: _showFeedbackBottomSheet)),
                  SizedBox(height: screenHeight * 0.06)
                ]))));
  }

  _showFeedbackBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => const FeedbackForm(),
    );
  }

  getAppBar() {
    return AppBar(
      leading: GestureDetector(
          onTap: () => navigatorKey.currentState!.pop(),
          child: const Icon(Icons.arrow_back)),
      title: Text(widget.event.eventStatus!.toUpperCase()),
      titleSpacing: 0.0,
      centerTitle: true,
      toolbarHeight: 73.2,
      toolbarOpacity: 0.8,
      shadowColor: Appcolors.appbluecolor.withOpacity(0.8),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25))),
      elevation: 0.00,
      flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.green],
              ))),
      actions: [
        Container(
            padding: const EdgeInsets.only(right: 7.5),
            child: const Icon(Icons.favorite))
      ],
    );
  }

  getFAB() {
    return GestureDetector(
      onTap: () => navigatorKey.currentState!.pushNamed(PageRoutes.youtubeVideo,
          arguments: 'https://www.youtube.com/watch?v=ceMsPBbcEGg'),
      child: Container(
          height: 55,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(9.0)),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Appcolors.appbluecolor.withOpacity(0.5),
                    Appcolors.appgreencolor.withOpacity(0.5),
                  ])),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.live_tv, size: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlinkingIcon(),
                  Text('Live'),
                ],
              )
            ],
          )),
    );
  }

  getImage() {
    return Column(
      children: [
        const SizedBox(height: 10),
        CarouselSlider(
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
            items: widget.event.gallery!.map((galleryItem) {
              return Builder(builder: (BuildContext context) {
                return ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(),
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: widget.event.gallery![0].mediaUrl![0])));
              });
            }).toList()),
        const SizedBox(height: 10),
        DotsIndicator(
            dotsCount: widget.event.gallery!.length,
            position: _currentIndex,
            mainAxisAlignment: MainAxisAlignment.center,
            decorator: const DotsDecorator(
                size: Size.square(9.0),
                activeSize: Size(18.0, 9.0),
                color: Colors.grey,
                activeColor: Appcolors.appgreencolor)),
        const SizedBox(height: 20),
      ],
    );
  }

  eventInfo() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          padding: const EdgeInsets.only(left: 15),
          child: AppLargeText(
              text: widget.event.title!, size: 25, color: Colors.black)),
      const SizedBox(height: 20),
      const VenueDetails(),
      const SizedBox(height: 20),
      Container(
          padding: const EdgeInsets.only(left: 15),
          child: const AppLargeText(
              text: "About Event", size: 25, color: Colors.black)),
      Padding(
          padding:
              const EdgeInsets.only(top: 5, left: 25, right: 9, bottom: 15),
          child: Text(widget.event.description!,
              style: const TextStyle(
                  fontSize: 17, color: Colors.black87, wordSpacing: 0.7))),
      SizedBox(height: Get.height * 0.02)
    ]);
  }

  timelines() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              padding: const EdgeInsets.only(left: 15),
              child: const AppLargeText(
                  text: "Timeline", size: 25, color: Colors.black)),
          SizedBox(height: Get.height * 0.02),

          //---------------------------------------------------------------
          //              Add Timeline to listview builder
          //---------------------------------------------------------------
          Container(
              height: Get.height * 0.4,
              margin: EdgeInsets.only(left: Get.width * 0.1),
              child: const TimeLineBar()),
        ]);
  }
}