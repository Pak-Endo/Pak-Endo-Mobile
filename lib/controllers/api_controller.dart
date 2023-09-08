import 'package:pak_endo/constants/consts.dart';
import 'package:pak_endo/providers/api_service.dart';

class ApiController {
  login(memberID, password) async {
    try {
      return await Api().post_('${MyConsts.baseUrl}auth/login', params: {
        'memberID': memberID,
        'password': password,
      });
    } catch (e) {
      rethrow;
    }
  }

  getAllEvents() async {
    try {
      return await Api().get_(
          '${MyConsts.baseUrl}events/getAllEventsByCategory?limit=5&offset=0');
    } catch (e) {
      rethrow;
    }
  }

  getProfile(String id) async {
    try {
      var json =  await Api().get_('${MyConsts.baseUrl}user/getUserById/$id');
      return ;
    } catch (e) {
      rethrow;
    }
  }
}
