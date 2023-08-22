import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/View/pages/widgets/Events%20Cards/OnGoingEvents.dart';
import 'package:pak_endo/View/pages/widgets/TextWidget/app_large_text.dart';
import 'package:pak_endo/View/pages/widgets/AppButtons/custom_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 12, right: 3),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.056,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.175,
                      width: MediaQuery.of(context).size.width * 0.22,
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
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  AppLargeText(
                    text: "Profile",
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppLargeText(
                        text: "Name: ",
                        size: 20,
                        color: Colors.black,
                      ),
                      Expanded(
                          child: Text(
                        "John Doe",
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppLargeText(
                        text: "Email: ",
                        size: 20,
                        color: Colors.black,
                      ),
                      Expanded(
                          child: Text(
                        "abc@123.com",
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppLargeText(
                        text: "Ph No: ",
                        size: 20,
                        color: Colors.black,
                      ),
                      Expanded(
                          child: Text(
                        "+92 332 0000000",
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppLargeText(
                        text: "Member ID: ",
                        size: 20,
                        color: Colors.black,
                      ),
                      Expanded(
                          child: Text(
                        "PES/E/01",
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppLargeText(
                        text: "Attended Events ",
                        size: 17.5,
                        color: Appcolors.Appbuttoncolor,
                      ),
                     
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                  OngoingEventsCard(),
                   SizedBox(
                    height: MediaQuery.of(context).size.width * 0.035,
                  ),
                  CustomButton(navigator: "signin",text: "Logout",textfont: 25,width: 130,),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.25,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}