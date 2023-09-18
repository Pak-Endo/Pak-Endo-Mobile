import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:pak_endo/constants/app_colors.dart';
import 'package:pak_endo/views/pages/faviortes.dart';
import 'package:pak_endo/views/pages/homepage.dart';
import 'package:pak_endo/views/pages/profile.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final _pageController = PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> bottomBarPages = [
    const HomePage(),
    FavoriteView(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
                bottomBarPages.length, (index) => bottomBarPages[index])),
        extendBody: true,
        bottomNavigationBar: (bottomBarPages.length <= maxCount)
            ? AnimatedNotchBottomBar(

                /// Provide NotchBottomBarController
                notchBottomBarController: _controller,
                color: Colors.white,
                showLabel: false,
                notchColor: Appcolors.appgreencolor,

                /// restart app if you change removeMargins
                removeMargins: false,
                bottomBarWidth: 500,
                durationInMilliSeconds: 300,
                bottomBarItems: const [
                  BottomBarItem(
                      inActiveItem: Icon(Icons.home_filled, color: Colors.grey),
                      activeItem: Icon(Icons.home_filled, color: Colors.white)),
                  BottomBarItem(
                      inActiveItem: Icon(Icons.favorite, color: Colors.grey),
                      activeItem: Icon(Icons.favorite, color: Colors.white)),
                  BottomBarItem(
                      inActiveItem: Icon(Icons.person, color: Colors.grey),
                      activeItem: Icon(Icons.person, color: Colors.white))
                ],
                onTap: (index) => _pageController.jumpToPage(index))
            : null);
  }
}

// void _showSignInDialog() {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Not Signed In'),
//         content:
//             const Text('You are not signed in. Please sign in to continue.'),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               Navigator.pushReplacementNamed(context, "/signin");
//             },
//             child: const Text('Sign In'),
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {});
//               Navigator.of(context).pop();
//             },
//             child: const Text('Cancel'),
//           ),
//         ],
//       );
//     },
//   );
// }
