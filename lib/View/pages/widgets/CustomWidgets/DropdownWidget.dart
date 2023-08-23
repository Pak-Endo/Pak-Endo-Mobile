import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';

class MyDropdownWidget extends StatefulWidget {
  final Function(String) onValueChanged; // Callback function

  MyDropdownWidget({required this.onValueChanged});

  @override
  _MyDropdownWidgetState createState() => _MyDropdownWidgetState();
}

class _MyDropdownWidgetState extends State<MyDropdownWidget> {
  List<String> dropdownItems = ["Prof Dr.", "Dr"];
  String selectedItem = "Prof Dr.";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        border: Border.all(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 15),
        child: DropdownButton<String>(
          value: selectedItem,
          items: dropdownItems.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
          underline: Container(),
          onChanged: (String? newValue) {
            setState(() {
              selectedItem = newValue ?? dropdownItems[0];
              widget.onValueChanged(selectedItem); // Call the callback with the selected value
            });
          },
        ),
      ),
    );
  }
}
