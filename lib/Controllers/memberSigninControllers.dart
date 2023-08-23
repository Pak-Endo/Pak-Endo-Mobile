import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../Model/event.dart';


// class MemberIdController extends GetxController {
//   Future<bool> verifyMemberId(String memberId) async {
//     final url = Uri.parse('http://quaidtech.ddns.net:8200/api/auth/checkIfMemberExistsWithPassword');

//     try {
//       final response = await http.post(
//         url,
//         body: {
//           'memberID': memberId,
//         },
//       );
//       if (response.statusCode == 200) {
//         final responseData = MemberModel.fromJson(json.decode(response.body));
//         // TODO: Perform your desired action after successful verification
//         return true;
//       } else {
//         // TODO: Handle the error case
//         return false;
//       }
//     } catch (error) {
//       // Handle exception
//       print('API call exception: $error');
//       return false;
//     }
//   }
// }

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

  Future<List<EventModel>> fetchUpcomingEvents() async {
    final url = Uri.parse('your_api_endpoint_here');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> eventList = json.decode(response.body)['events'];
        final List<EventModel> upcomingEvents = eventList
            .where((event) => event['eventStatus'] == 'upcoming')
            .map((event) => EventModel.fromJson(event))
            .toList();
        return upcomingEvents;
      } else {
        throw Exception('Failed to load upcoming events');
      }
    } catch (error) {
      throw Exception('API call exception: $error');
    }
  }



}
