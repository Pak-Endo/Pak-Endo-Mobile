import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';

class VenueDetails extends StatefulWidget {
  const VenueDetails({super.key});

  @override
  State<VenueDetails> createState() => _VenueDetailsState();
}

class _VenueDetailsState extends State<VenueDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //Date and time Row
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.height*0.06,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  child: const Icon(
                    Icons.calendar_month,
                    color: Appcolors.Appbuttoncolor,
                    size: 30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "20 February, 2023",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.width * 0.01),
                      const Text(
                        "Monday, 10:00 AM to 12:00 PM",
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  child: const Icon(
                    Icons.location_pin,
                    color: Appcolors.Appbuttoncolor,
                    size: 30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Islamabad",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),

                    SizedBox(height:MediaQuery.of(context).size.width*0.01),
                      const Text(
                        "Sereena Hotel, Main Hall",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.grey.withOpacity(0.5),
                      image: const DecorationImage(
                          image: AssetImage("assets/profile.jpg"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Dr Ahmed Kamal",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),

                    SizedBox(height:MediaQuery.of(context).size.width*0.01),
                      const Text(
                        "Speaker",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                        ),
                      ),
                  ],),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}