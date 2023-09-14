import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';

class CustomChip extends StatelessWidget {
  final String label;

  const CustomChip({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      backgroundColor: Appcolors.appgreencolor,
      label: Text(label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
