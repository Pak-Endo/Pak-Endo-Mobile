import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../Model/event.dart';

class Controllers extends GetxController {
  Future<bool> verifyCredentials(String memberID, String password) async {
    final url = Uri.parse('http://quaidtech.ddns.net:8200/api/auth/login');

    try {
      final response = await http.post(
        url,
        body: {
          'memberID': memberID,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Successful verification
        return true;
      } else {
        // Verification failed
        return false;
      }
    } catch (error) {
      // Handle exception
      print('API call exception: $error');
      return false;
    }
  }

  Future<List<Event>> fetchAllEvents() async {
    final url = Uri.parse(
        'http://quaidtech.ddns.net:8200/api/events/getAllEvents?limit=10&offset=0');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> eventList = json.decode(response.body)['events'];
        final List<Event> allEvents =
            eventList.map((event) => Event.fromJson(event)).toList();
        print(allEvents);
        return allEvents;
      } else {
        throw Exception('Failed to load events');
      }
    } catch (error) {
      throw Exception('API call exception: $error');
    }
  }

  Future<List<Event>> fetchUpcomingEvents(int limit, int offset) async {
    final url = Uri.parse(
        'http://quaidtech.ddns.net:8200/api/events/getAllEvents?limit=$limit&offset=$offset');
    final response = await http.get(url);
    // final Map json = response.body as Map;
    // print(json);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      // print("Decoded JSON Data: $jsonData"); // Print the decoded JSON
      final List<dynamic> eventList = jsonData['events'];
      final List<Event> eventsdata = eventList
          .where((event) => event['eventStatus'] == 'upcoming')
          .map((event) => Event.fromJson(event))
          .toList();
      // print("\n\nEvent list: $eventList");
      // print("Events specific data $eventsdata");

      return eventsdata;
    }
    return [];
  }

  Future<List<Event>> fetchOngoingEvents(int limit, int offset) async {
    final url = Uri.parse(
        'http://quaidtech.ddns.net:8200/api/events/getAllEvents?limit=$limit&offset=$offset');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> eventList = json.decode(response.body)['events'];
        final List<Event> ongoingEvents = eventList
            .where((event) => event['eventStatus'] == 'ongoing')
            .map((event) => Event.fromJson(event))
            .toList();
        return ongoingEvents;
      } else {
        throw Exception('Failed to load ongoing events');
        // ignore: dead_code
        if (kDebugMode) {
          print("Failed to load ongoing events");
        }
      }
    } catch (error) {
      throw Exception('API call exception: $error');
      // ignore: dead_code
      if (kDebugMode) {
        print("API call exception: $error");
      }
    }
  }

 Future<List<Event>> fetchFinishedEvents(int limit, int offset) async {
  final url = Uri.parse(
      'http://quaidtech.ddns.net:8200/api/events/getAllEvents?limit=$limit&offset=$offset');
  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      print('API Response: ${response.body}');
      final List<dynamic> eventList = jsonData['data']['events']; // Adjusted field path
      final List<Event> finishedEventsData = eventList
          .where((event) => event['eventStatus'] == 'finished')
          .map((event) => Event.fromJson(event))
          .toList();
      print("Finished Events mapped data $finishedEventsData");
      return finishedEventsData;
    } else {
      throw Exception('Failed to load finished events');
    }
  } catch (error) {
    throw Exception('API call exception: $error');
  }
}


}
