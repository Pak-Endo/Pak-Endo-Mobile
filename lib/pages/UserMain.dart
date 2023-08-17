import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/pages/Faviortes_Page.dart';
import 'package:pak_endo/pages/Profile_User.dart';
import 'package:pak_endo/pages/SearchPage.dart';
import 'package:pak_endo/pages/homepage.dart';

class UserMain extends StatefulWidget {
  const UserMain({super.key});

  @override
  State<UserMain> createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  final _pageController=PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);

  int maxcount=3;

  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> bottomBarpages = [
    homepage(),
    FavioratePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
         controller: _pageController,
         physics: const NeverScrollableScrollPhysics(),
         children: List.generate(bottomBarpages.length, (index) => bottomBarpages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarpages.length <= maxcount)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: Colors.white,
              showLabel: false,
              notchColor:Appcolors.appgreencolor,

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 300,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color:Colors.grey,
                  ), activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),),

                  BottomBarItem(
                  inActiveItem: Icon(
                    Icons.favorite,
                    color:Colors.grey,
                  ), activeItem: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),),

                   BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color:Colors.grey,
                  ), activeItem: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),),

              ],
              onTap: (index) {
                /// perform action on tab change and to update pages you can update pages without pages
                _pageController.jumpToPage(index);
              },
            )
          : null,

    );
  }
}