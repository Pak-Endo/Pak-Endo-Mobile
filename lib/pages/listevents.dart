import 'package:flutter/material.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/widgets/app_large_text.dart';


class UpComingEvents extends StatefulWidget {
  const UpComingEvents({super.key});

  @override
  State<UpComingEvents> createState() => _UpComingEventsState();
}



class _UpComingEventsState extends State<UpComingEvents> {
  final List<int> numbers = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text("UpComing Events"),
      titleSpacing: 0.0,
      centerTitle: true,
      toolbarHeight: 73.2,
      toolbarOpacity: 0.8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
      ),
      elevation: 0.00,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.green,
            ],
          ),
        ),
      ),
    ),
      body: Padding(
        padding:const EdgeInsets.only(left: 5,right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.04,
            ),
        AppLargeText(text: "UpComing Events",color: Colors.black,),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.001,
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: numbers.length,
              itemBuilder: (_, index) {
                return Container(
                  height: 140,
                  margin: const EdgeInsets.only(
                      top: 17, right: 8, left: 8, bottom: 6),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(95, 24, 21, 21),
                          blurRadius: 10,
                          offset: Offset(2, 2),
                        )
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                         width: MediaQuery.of(context).size.height*0.15,
                        decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Appcolors.Appbuttoncolor,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/event1.jpg",))
                        ),
                      ),
                       Expanded(
                        child: Padding(
                          padding:  EdgeInsets.only(top: 9,left: 7,bottom: 5,right: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "01st OCT - WED 10:30 Pm",
                                style: TextStyle(
                                    color: Appcolors.appbluecolor, fontSize: 12),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 9.0),
                                child: AppLargeText(text: "Heart Health - PIMS ISLAMMABAD",size: 16,color: Colors.black,)
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 9.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.location_pin,color: Appcolors.Appbuttoncolor,),
                                    Text("PIMS doctor's association ",style: TextStyle(color:Colors.blueGrey, fontSize: 12),),
                                ],),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        )
          ],
        ),
      ),
    );
  }
}