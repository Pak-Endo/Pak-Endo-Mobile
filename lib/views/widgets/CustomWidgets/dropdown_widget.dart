import 'package:flutter/material.dart';

class MyDropdownWidget extends StatefulWidget {
  final Function(String) onValueChanged; // Callback function

  const MyDropdownWidget({super.key, required this.onValueChanged});

  @override
  State<MyDropdownWidget> createState() => _MyDropdownWidgetState();
}

class _MyDropdownWidgetState extends State<MyDropdownWidget> {
  List<String> dropdownItems = ["Prof Dr.", "Dr"];
  String selectedItem = "Prof Dr.";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 15),
        child: DropdownButton<String>(
          value: selectedItem,
          items: dropdownItems.map((String item) {
            return DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: const TextStyle(color: Colors.black)));
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
