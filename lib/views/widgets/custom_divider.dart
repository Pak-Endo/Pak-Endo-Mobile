import 'package:flutter/material.dart';
import 'package:pak_endo/constants/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Appcolors.appbluecolor, Appcolors.appgreencolor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)));
  }
}
