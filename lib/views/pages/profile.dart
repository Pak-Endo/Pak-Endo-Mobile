import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/Controllers/auth_controller.dart';
import 'package:pak_endo/Controllers/home_controller.dart';
import 'package:pak_endo/controllers/profile_controller.dart';
import 'package:pak_endo/routes/navigations.dart';
import 'package:pak_endo/views/widgets/event_cards/Finishedeventcard.dart';

import '../widgets/AppButtons/custom_button.dart';
import '../widgets/custom_text/app_large_text.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final AuthController authController = Get.put(AuthController());
  final HomeController homeController = Get.put(HomeController());
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        header(),

        /// USERPROFILE
        userInfo(),

        /// ATTENDED EVENTS
        attendedEvents(),

        /// BUTTON
        CustomButton(
            text: "Logout",
            textfont: 25,
            width: 130,
            onTap: () => authController.logout().then((value) {
                  if (value == true) {
                    navigatorKey.currentState!
                        .pushReplacementNamed(PageRoutes.login);
                  }
                })),
        SizedBox(height: Get.height * 0.10)
      ]),
    ));
  }

  userInfo() {
    return Column(children: [
      SizedBox(height: MediaQuery.of(Get.context!).size.width * 0.02),
      const AppLargeText(text: "Profile", color: Colors.black),
      SizedBox(height: MediaQuery.of(Get.context!).size.width * 0.02),
      displayInfo('Name: ', profileController.user.fullName!),
      SizedBox(height: MediaQuery.of(Get.context!).size.width * 0.02),
      displayInfo('Email: ', profileController.user.email!),
      SizedBox(height: MediaQuery.of(Get.context!).size.width * 0.02),
      displayInfo('Ph No: ', profileController.user.phoneNumber!),
      SizedBox(height: MediaQuery.of(Get.context!).size.width * 0.02),
      displayInfo('Member ID: ', profileController.user.memberID!),
      SizedBox(height: MediaQuery.of(Get.context!).size.width * 0.06)
    ]);
  }

  displayInfo(String a, String b) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      AppLargeText(text: a, size: 20, color: Colors.black),
      Expanded(
          child: Text(b,
              style: const TextStyle(fontSize: 18, color: Colors.black54)))
    ]);
  }

  attendedEvents() {
    return Column(children: [
      const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppLargeText(
                text: "Attended Events ",
                size: 17.5,
                color: Appcolors.Appbuttoncolor)
          ]),
      SizedBox(height: MediaQuery.of(Get.context!).size.width * 0.03),
      FinishedEventCard(finishedEvents: homeController.finishedEvents),
      SizedBox(height: MediaQuery.of(Get.context!).size.width * 0.075)
    ]);
  }

  header() {
    return Column(children: [
      SizedBox(height: MediaQuery.of(Get.context!).size.width * 0.059),
      Container(
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Logo_Icon.png"),
                  fit: BoxFit.contain),
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(8.0))))
    ]);
  }
}
