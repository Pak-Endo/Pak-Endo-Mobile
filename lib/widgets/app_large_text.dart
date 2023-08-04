import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';

class AppLargeText extends StatelessWidget {
  double size;
  String text;
  Color color;
  AppLargeText(
      {super.key,
      this.size = 30,
      this.color = Appcolors.appbluecolor,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold,letterSpacing: 3),
    );
  }
}