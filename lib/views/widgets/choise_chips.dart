// import 'package:flutter/material.dart';
//
// class CustomChoiceChip extends StatefulWidget {
//   const CustomChoiceChip({super.key});
//
//   @override
//   State<CustomChoiceChip> createState() => _CustomChoiceChipState();
// }
//
// class _CustomChoiceChipState extends State<CustomChoiceChip> {
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 12.0,
//       runSpacing: 4.0,
//       children: [].skills
//           .map((label) => Padding(
//           padding: const EdgeInsets.only(right: 8.0),
//           child: ChoiceChip(
//               label: Text(
//                 label.name,
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodyMedium!
//                     .copyWith(
//                     color: selectedSkills.contains(label.id)
//                         ? MyConsts.white
//                         : MyConsts.secondary,
//                     fontSize: 15),
//               ),
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(5)),
//               ),
//               selected: selectedSkills.contains(label.id),
//               onSelected: (bool newValue) {
//                 setState(() {
//                   if (selectedSkills.contains(label.id)) {
//                     selectedSkills.remove(label.id);
//                   } else {
//                     selectedSkills
//                         .add(label.id); // Update the selected state
//                   }
//                 });
//               },
//               selectedColor: MyConsts.primary,
//               selectedShadowColor: MyConsts.primary,
//               avatar: selectedSkills.contains(label.id)
//                   ? const Icon(Icons.check, color: Colors.white)
//                   : null // Add a check mark icon for the selected chip
//           )))
//           .toList(),
//     );
//   }
// }
