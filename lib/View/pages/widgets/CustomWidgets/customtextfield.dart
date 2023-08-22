import 'package:flutter/material.dart';

import '../../../../Constants/app_colors.dart';

class fieldtitle extends StatelessWidget {
  TextEditingController controller;
  String icontype;
  String? hinttext;
  
  
   fieldtitle({
    required this.controller,
    this.icontype="name",
    this.hinttext,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.07,
       width: 160,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: const Icon(
                Icons.email,
                color: Appcolors.Appbuttoncolor,
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 3, left: 5),
            child: TextFormField(
              controller: controller,
              validator: (value) {
                if (value == null) {
                  return "Please Fill the Field";
                } else if (controller == controller ||
                    !value.contains("@")) {
                  return "Please Enter Valid Email";
                }
                return null;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: const TextStyle(color: Colors.blueGrey),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintText: hinttext,
              ),
            ),
          )),
        ],
      ),
    );
  }
}



