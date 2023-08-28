import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class tabbar extends StatefulWidget {
  @override
  _tabbarState createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> {

  List<String> days = ["Day 1", "Day 2", "Day 3"];// Add more days as needed
  List<String> Headings=['Intrduction','Lunch','Workshop']; 
  List<String> Time=["9:30Am - 11:45Am","12:30Pm - 1:30Pm","2:30Pm - 4:00Pm"];

  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: days.length,
        child: Column(
          children: [
            TabBar(
              labelColor: Colors.black,
              isScrollable: true,
              tabs: days.map((day) => Tab(text: day)).toList(),
            ),
             SizedBox(
                height: screenHeight * 0.02,
              ),
            Expanded(
              child: TabBarView(
                children: days.map((day) => buildDayTab(day)).toList(),
              ),
            ),
          ],
        ),
      );
  }

  Widget buildDayTab(String day) {
    return ListView.builder(
      itemCount: 3, // Adjust the count as needed
      itemBuilder: (context, index) {
        return TimelineTile(
          indicatorStyle: IndicatorStyle(color: Colors.blue),
          beforeLineStyle: LineStyle(color: Colors.blue),
          afterLineStyle: LineStyle(color: Colors.green),
          alignment: TimelineAlign.start,
          endChild: Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Headings[index], style: TextStyle(fontSize: 20, color: Colors.black)),
                Text(Time[index], style: TextStyle(fontSize: 15, color: Colors.grey)),
                Text("Venue: Hall no 3", style: TextStyle(fontSize: 15, color: Colors.grey)),
                Text("    "),
              ],
            ),
          ),
        );
      },
    );
  }
}