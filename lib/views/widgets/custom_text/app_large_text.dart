import 'package:flutter/material.dart';
import 'package:pak_endo/constants/app_colors.dart';

class AppLargeText extends StatelessWidget {
  final double size;
  final double? letterSpacing;
  final String text;
  final Color color;
  final String fontFamily;
  final bool isBold;

  const AppLargeText(
      {super.key,
      this.isBold = false,
      this.size = 30,
      this.fontFamily = 'Poppins-Medium',
      this.letterSpacing,
      this.color = Appcolors.appbluecolor,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: color,
            fontSize: size,
            fontFamily: fontFamily,
            fontWeight: (isBold) ? FontWeight.bold : FontWeight.normal,
            letterSpacing: letterSpacing));
  }
}