import 'package:flutter/material.dart';

import '../../../../Constants/app_colors.dart';


class CustomButton extends StatelessWidget {
  String text;
  String navigator;
  double width;
  double textfont;
  double height;
   CustomButton({
    super.key,
    this.textfont=13.0,
    this.text = "Submit",
    this.height = 50,
    this.width = 400,
    required this.navigator,
     
    });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/$navigator");
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 25, top: 5, left: 5),
        height: height,
        width: width,
        decoration: const BoxDecoration(
            // color: Appcolors.Appbuttoncolor,
             gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.green,
            ],
          ),
            borderRadius: BorderRadius.all(Radius.circular(37))),
        child: Center(
          child: Text(
            text,
            style:  TextStyle(
                fontSize: textfont,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1),
          ),
        ),
      ),
    );
  
}
}