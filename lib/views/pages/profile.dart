import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/constants/app_colors.dart';
import 'package:pak_endo/controllers/auth_controller.dart';
import 'package:pak_endo/controllers/profile_controller.dart';
import 'package:pak_endo/routes/navigations.dart';
import 'package:pak_endo/views/widgets/event_cards/AttendedEvents.dart';
import 'package:pak_endo/views/widgets/loaders.dart';

import '../../controllers/home_controller.dart';
import '../widgets/AppButtons/custom_button.dart';
import '../widgets/custom_text/app_large_text.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final AuthController authController = Get.put(AuthController());
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
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
                    Get.delete<HomeController>();
                    navigatorKey.currentState!
                        .pushReplacementNamed(PageRoutes.login);
                  }
                })),
        accountDeletionIOS(),
      ]),
        ));
  }

  userInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [
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
      ]),
    );
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
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: AppLargeText(
                    text: "Attended Events ",
                    size: 17.5,
                    color: Appcolors.Appbuttoncolor))
          ]),
      SizedBox(height: MediaQuery.of(Get.context!).size.width * 0.03),

      AttendedEventsCard(),
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

  accountDeletionIOS() {
    if (Platform.isIOS) {
      return TextButton(
          onPressed: deleteUserConfirmation,
          child: const Text('Delete Your Account',
              style: TextStyle(
                  decoration: TextDecoration.underline, color: Colors.red)));
    }

    return const SizedBox.shrink();
  }

  deleteUserConfirmation() {
    return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      context: Get.context!,
      pageBuilder: (context, anim1, anim2) {
        return Align(
            alignment: Alignment.center,
            child: AlertDialog(
              title: Text('Delete Account',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.red)),
              content: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text:
                            "Are you sure you want to delete your account?\n\n",
                        style: Theme.of(context).textTheme.headline5),
                    TextSpan(
                      text:
                          "By tapping delete all your account save data will be deleted permanently from the database.\n\n",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    TextSpan(
                      text:
                          "After submitting your deletion request will be transfer to admin. After reviewing request your account will be deleted.",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                  },
                  child: Text('Cancel'),
                ),
                CustomButton(onTap: () {
                  getLoader();
                  Future.delayed(const Duration(seconds: 3), () async {
                    getSuccess();
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                  });
                }),
              ],
            ));
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }
}
