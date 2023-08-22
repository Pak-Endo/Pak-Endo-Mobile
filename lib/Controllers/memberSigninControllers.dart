import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/member.dart';
import 'package:get/get.dart';

class MemberIdController extends GetxController {
  Future<bool> verifyMemberId(String memberId) async {
    final url = Uri.parse('http://quaidtech.ddns.net:8200/api/auth/checkIfMemberExistsWithPassword');

    try {
      final response = await http.post(
        url,
        body: {
          'memberID': memberId,
        },
      );

      if (response.statusCode == 200) {
        final responseData = MemberModel.fromJson(json.decode(response.body));
        // TODO: Perform your desired action after successful verification
        return true;
      } else {
        // TODO: Handle the error case
        return false;
      }
    } catch (error) {
      // Handle exception
      print('API call exception: $error');
      return false;
    }
  }
}

class AuthenticationController extends GetxController {
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
}
