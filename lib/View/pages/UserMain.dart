// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/View/pages/Faviortes_Page.dart';
import 'package:pak_endo/View/pages/Profile_User.dart';
import 'package:pak_endo/View/pages/homepage.dart';

import '../../Constants/SharedPreferences.dart';

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

  //Methods:

  void _showSignInDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Not Signed In'),
          content: Text('You are not signed in. Please sign in to continue.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, "/signin");
              },
              child: Text('Sign In'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                });
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }



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
              bottomBarItems:  [
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
                _pageController.jumpToPage(index);
                // perform action on tab change and to update pages you can update pages without pages
                // if (index == 1 || index == 2) {
                //   if( Constants.prefs?.getBool("Loggedin") == false){
                //     _pageController.jumpToPage(index);
                //   }
                //   else{
                //     _showSignInDialog();
                //   }
                // } else {
                //   _pageController.jumpToPage(index);
                // }
                
              },
            )
          : null,

    );
  }
}