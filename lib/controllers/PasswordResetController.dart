import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class PasswordResetController extends GetxController {
  Future<bool> sendResetLink(String email) async {
    final url =
        Uri.parse('http://quaidtech.ddns.net:8200/api/auth/forgotPassword/$email');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Password reset link sent successfully
        return true;
      } else {
        // Sending password reset link failed
        return false;
      }
    } catch (error) {
      // Handle exception
      print('API call exception: $error');
      return false;
    }
  }
}