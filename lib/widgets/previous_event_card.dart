import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';

class PreviousEventCard extends StatefulWidget {
  const PreviousEventCard({super.key});

  @override
  State<PreviousEventCard> createState() => _PreviousEventCardState();
}

class _PreviousEventCardState extends State<PreviousEventCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 9),
        height: MediaQuery.of(context).size.height*0.6,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.38,
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black87,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage("assets/login_background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 20.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Icon(
                          Icons.location_on,
                          size: 20.0,
                          color: Colors.black,
                        ),
                        Text(
                          "PIMS, ISB",
                          style: TextStyle(
                            fontSize: 27.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                            color: Colors.black,
                          ),
                        ),
                        
                      ]),
                      SizedBox(height: MediaQuery.of(context).size.height*0.007,),
                      Row(
                        children: [
                          Icon(
                            Icons.abc,
                            size: 10.0,
                            color: Appcolors.Appbuttoncolor,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Abc",
                            style:
                                TextStyle(fontSize: 17.0, color: Colors.white),
                          ),
                          SizedBox(
                            width: 90.0,
                          ),
                           Text(
                            "view",
                            style:
                                TextStyle(fontSize: 17.0,
                                 color: Appcolors.Appbuttoncolor,
                                 fontWeight: FontWeight.bold,
                                 ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
               
              ],
            ),
          ],
        ),
      );
    
  }
}
