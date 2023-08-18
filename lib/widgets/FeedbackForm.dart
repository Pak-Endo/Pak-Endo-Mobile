import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/pages/details_page.dart';
import 'package:pak_endo/widgets/AppButtons/custom_button.dart';

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  double _rating1 = 0.0;
  double _rating2 = 0.0;
  double _rating3 = 0.0;
  double _rating4 = 0.0;
  TextEditingController _feedbackController = TextEditingController();

  void _submitFeedback() {
    // Process feedback here
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            color: Colors.white, // Background color of the previous screen
            child: Center(
              child: DetailsPage(),
            ),
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 9 / 11, // Cover 3/4 of the screen initially
          minChildSize: 1 / 3,
          maxChildSize: 1.0,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: ListView(
                controller: scrollController,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                       Expanded(
                         child: Text(
                         'Rate Your Experience',
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                         ),
                                         ),
                       ),
                    ],
                  ),
                  SizedBox(height: 16),
                  _buildRatingSection("Rate Food: ", _rating1, (newRating) {
                    setState(() {
                      _rating1 = newRating;
                    });
                  }),
                  SizedBox(height: 4),
                  _buildRatingSection("Rate Venue: ", _rating2, (newRating) {
                    setState(() {
                      _rating2 = newRating;
                    });
                  }),
                  SizedBox(height: 4),
                  _buildRatingSection("Rate Speaker: ", _rating3, (newRating) {
                    setState(() {
                      _rating3 = newRating;
                    });
                  }),
                  SizedBox(height: 4),
                  _buildRatingSection("Overall Experience: ", _rating4,
                      (newRating) {
                    setState(() {
                      _rating4 = newRating;
                    });
                  }),
                  SizedBox(height: 15),
                  TextField(
                    controller: _feedbackController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: 'Feedback (Optional)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomButton(navigator: "detailspage")
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildRatingSection(
      String title, double rating, Function(double) onRatingChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 1; i <= 5; i++)
              IconButton(
                onPressed: () {
                  onRatingChanged(i.toDouble());
                },
                icon: Icon(
                  Icons.star,
                  color: i <= rating ? Appcolors.Appbuttoncolor : Colors.grey,
                  size: 40,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
