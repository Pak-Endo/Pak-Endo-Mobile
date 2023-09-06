
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/Constants/app_colors.dart';

import '../../Controllers/Controllers.dart';
import '../../Model/event.dart';
import '../widgets/TextWidget/app_large_text.dart';

class UpComingEvents extends StatefulWidget {
  const UpComingEvents({super.key});

  @override
  State<UpComingEvents> createState() => _UpComingEventsState();
}

class _UpComingEventsState extends State<UpComingEvents> {
  final Controllers _controllers = Get.put(Controllers());

  @override
  void initState() {
    super.initState();
    fetchUpcomingEvents(limit: 2, offset: 0);
    fetchOngoingEvents(limit: 5, offset: 0);
    fetchUFinishedEvents(limit: 5, offset: 0);
  }

  Future<List<Event>> fetchUpcomingEvents(
      {required int limit, required int offset}) async {
    try {
      final events = await _controllers.fetchUpcomingEvents(limit, offset);
      print("\n\nList of Events");
      return events;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Event>> fetchOngoingEvents({required int limit, required int offset}) async {
    try {
      final events = await _controllers.fetchOngoingEvents(limit, offset);
      return events;
    } catch (error) {
      throw error;
    }
  }
  Future<List<Event>> fetchUFinishedEvents({required int limit, required int offset}) async {
    try {
      final events = await _controllers.fetchFinishedEvents(limit, offset);
      return events;
    } catch (error) {
      throw error;
    }
  }
  @override
  Widget build(BuildContext context) {
    
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;

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
              colors: const [
                Colors.blue,
                Colors.green,
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.023,
              ),
              Expanded(
                child: FutureBuilder<List<Event>>(
                  future: fetchUpcomingEvents(limit: 5, offset: 0),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Display a circular progress indicator while loading
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    else if (snapshot.hasError) {
                      // Handle error case
                      return Center(
                        child: Text("Error loading data"),
                      );
                    } else if(snapshot.hasData){
                      return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        final event = snapshot.data![index];
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.18,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.height * 0.16,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: Appcolors.Appbuttoncolor,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                         event.featuredImage,
                                        ))),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 13, left: 10, bottom: 5, right: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          event.startDate.toString(),
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                      ),
                                      Padding(
                                          padding:
                                              EdgeInsets.only(top: 9.0, left: 5),
                                          child: AppLargeText(
                                            text: event.title,
                                            size: 16,
                                            color: Colors.black,
                                          )),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: 9.0, left: 2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.location_pin,
                                              color: Appcolors.Appbuttoncolor,
                                            ),
                                            Text(
                                              event.organizer,
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: screenHeight*0.02,),
                                      Padding(
                                        padding: const EdgeInsets.only(right:5.0,bottom: 2),
                                        child: Row(
                                          children: [
                                            Expanded(child: Container()),
                                            GestureDetector(
                                              onTap: () => Navigator
                                                  .pushNamed(
                                                      context, "/detailPage"),
                                              child: Text(
                                                "View",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                    color: Appcolors
                                                        .Appbuttoncolor),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                    }
                    else {
                      // No data case
                      return const Center(
                        child: Text("No ongoing events available."),
                      );
                    }

                  },
                  
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
