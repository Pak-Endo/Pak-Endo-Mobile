import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/routes/navigations.dart';

import 'AppButtons/custom_button.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  double _rating1 = 0.0;
  double _rating2 = 0.0;
  double _rating3 = 0.0;
  double _rating4 = 0.0;
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 9 / 11, // Cover 3/4 of the screen initially
        minChildSize: 1 / 3,
        maxChildSize: 1.0,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, -3))
                ],
              ),
              child: ListView(controller: scrollController, children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  IconButton(
                      onPressed: () => navigatorKey.currentState!.pop(),
                      icon: const Icon(Icons.close, color: Colors.grey)),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  const Expanded(
                      child: Text('Rate Your Experience',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)))
                ]),
                const SizedBox(height: 16),
                _buildRatingSection("Rate Food: ", _rating1, (newRating) {
                  setState(() {
                    _rating1 = newRating;
                  });
                }),
                const SizedBox(height: 4),
                _buildRatingSection("Rate Venue: ", _rating2, (newRating) {
                  setState(() {
                    _rating2 = newRating;
                  });
                }),
                const SizedBox(height: 4),
                _buildRatingSection("Rate Speaker: ", _rating3, (newRating) {
                  setState(() {
                    _rating3 = newRating;
                  });
                }),
                const SizedBox(height: 4),
                _buildRatingSection("Overall Experience: ", _rating4,
                    (newRating) {
                  setState(() {
                    _rating4 = newRating;
                  });
                }),
                const SizedBox(height: 15),
                TextField(
                    controller: _feedbackController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                        labelText: 'Feedback (Optional)',
                        border: OutlineInputBorder())),
                const SizedBox(height: 20),
                CustomButton(onTap: () {
                  navigatorKey.currentState!.pop();
                })
              ]));
        });
  }

  Widget _buildRatingSection(
      String title, double rating, Function(double) onRatingChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        for (int i = 1; i <= 5; i++)
          IconButton(
              onPressed: () {
                onRatingChanged(i.toDouble());
              },
              icon: Icon(Icons.star,
                  color: i <= rating ? Appcolors.Appbuttoncolor : Colors.grey,
                  size: 40))
      ])
    ]);
  }
}
