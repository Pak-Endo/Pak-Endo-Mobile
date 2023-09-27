import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';

class CustomButton2 extends StatelessWidget {
  final String text;
  final double width;
  final double textfont;
  final double height;
  final onTap;

  const CustomButton2(
      {super.key,
      this.textfont = 13.0,
      this.text = "Submit",
      this.height = 50,
      this.width = 400,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5, top: 5, left: 5,right: 5),
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Appcolors.appbluecolor,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
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
