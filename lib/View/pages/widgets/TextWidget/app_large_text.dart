import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';

class AppLargeText extends StatelessWidget {
  double size;
  double? lettersspacing;
  String text;
  Color color;
  String fontFamily;
  bool isbold;
  AppLargeText(
      {super.key,
      this.isbold=false,
      this.size = 30,
      this.fontFamily='Poppins-Medium',
      this.lettersspacing,
      this.color = Appcolors.appbluecolor,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color,
          fontSize: size,
          fontFamily: fontFamily, 
          fontWeight:(isbold)?FontWeight.bold:FontWeight.normal,
          letterSpacing: lettersspacing),
    );
  }
}