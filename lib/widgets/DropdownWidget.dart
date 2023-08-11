import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';

class MyDropdownWidget extends StatefulWidget {
  @override
  _MyDropdownWidgetState createState() => _MyDropdownWidgetState();
}

class _MyDropdownWidgetState extends State<MyDropdownWidget> {
  List<String> dropdownItems = ["Prof Dr.", "Dr"];
  String selectedItem = "Prof Dr."; // Set an initial value if needed

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
          ),
        border: Border.all(color: Appcolors.Appbuttoncolor)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12,right: 15),
        child: DropdownButton<String>(
          
          value: selectedItem,
          items: dropdownItems.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          underline: Container(),
          onChanged: (String? newValue) {
            setState(() {
              selectedItem = newValue ?? dropdownItems[0]; // Set the default value if newValue is null
            });
          },
        ),
      ),
    );
  }
}
