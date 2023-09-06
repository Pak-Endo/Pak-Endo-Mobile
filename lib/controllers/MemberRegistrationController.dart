import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  Future<bool> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String gender,
    required String city,
    required String selectedValue,
  }) async {
    final url = Uri.parse('YOUR_REGISTER_API_URL');

    final requestBody = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "prefix": selectedValue, // Make sure to include the correct field name
      "phoneNumber": phoneNumber,
      "gender": gender,
      "city": city,
    };

    try {
      final response = await http.post(
        url,
        body: json.encode(requestBody),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        // User registered successfully
        return true;
      } else {
        // Registration failed
        return false;
      }
    } catch (error) {
      // Handle exception
      print('API call exception: $error');
      return false;
    }
  }
}
