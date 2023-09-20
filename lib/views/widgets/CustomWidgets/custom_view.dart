import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/constants/app_colors.dart';

class CustomView extends StatelessWidget {
  const CustomView(this.title, this.icon, {super.key});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: Get.width / 1.5,
            height: 40,
            margin: const EdgeInsets.fromLTRB(22, 0, 22, 10),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                color: Appcolors.appgreencolor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12)),
            alignment: Alignment.center,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500)),
                  Container(
                    padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Appcolors.appgreencolor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Icon(icon, size: 15, color: Colors.white))
                ])));
  }
}
