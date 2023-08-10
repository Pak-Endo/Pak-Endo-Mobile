// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
      margin: EdgeInsets.only(left: 15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            //Date and time Row
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.06,
                  width: MediaQuery.of(context).size.height*0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.grey.withOpacity(0.5),
                    ),
                    child: Icon(
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
                    Text("20 February, 2023", style: TextStyle(fontSize: 18),),

                    SizedBox(height:MediaQuery.of(context).size.width*0.01),
                    
                    Text("Monday, 10:00 AM to 12:00 PM", 
                    style: TextStyle(color: Colors.black26,
                    fontSize:14,
                    ),
                    ),
                  ],),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.06,
                  width: MediaQuery.of(context).size.height*0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.grey.withOpacity(0.5),
                    ),
                    child: Icon(
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
                    Text("Islammabad", style: TextStyle(
                      fontSize: 18,
                      ),),

                    SizedBox(height:MediaQuery.of(context).size.width*0.01),
                    
                    Text("Serena Hotel, Main Hall", 
                    style: TextStyle(color: Colors.black38,
                    fontSize:14,
                    ),
                    ),
                  ],),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.06,
                  width: MediaQuery.of(context).size.height*0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.grey.withOpacity(0.5),
                    image: DecorationImage(image: AssetImage("assets/profile.jpg"),fit: BoxFit.cover)
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Pakistan Doctors Association", style: TextStyle(
                      fontSize: 18,
                      ),),

                    SizedBox(height:MediaQuery.of(context).size.width*0.01),
                    
                    Text("Organizer", 
                    style: TextStyle(color: Colors.black38,
                    fontSize:14,
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