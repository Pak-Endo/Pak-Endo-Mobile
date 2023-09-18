import 'dart:convert';

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

  getUpcomingEvents(limit, offset) async {
    try {
      return await Api().get_(
          '${MyConsts.baseUrl}events/getUpcomingEvents?limit=$limit&offset=$offset');
    } catch (e) {
      rethrow;
    }
  }

  getOngoingEvents(limit, offset) async {
    try {
      return await Api().get_(
          '${MyConsts.baseUrl}events/getOngoingEvents?limit=$limit&offset=$offset');
    } catch (e) {
      rethrow;
    }
  }

  getFinishedEvents(limit, offset) async {
    try {
      return await Api().get_(
          '${MyConsts.baseUrl}events/getFinishedEvents?limit=$limit&offset=$offset');
    } catch (e) {
      rethrow;
    }
  }

  getSearchedEvents(limit, offset,
      {title, location, type, startDate, endDate, speaker}) async {
    try {
      final url =
          '${MyConsts.baseUrl}events/getAllEvents?limit=$limit&offset=$offset'
          '&title=${title ?? ''}&location=${location ?? ''}&type=${type ?? ''}'
          '&startDate=${startDate ?? ''}&endDate=${endDate ?? ''}&speaker=${speaker ?? ''}';

      return await Api().get_(url);
    } catch (e) {
      rethrow;
    }
  }

  // getProfile(String id) async {
  //   try {
  //     var json = await Api().get_('${MyConsts.baseUrl}user/getUserById/$id');
  //     return;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  getFavEvents(limit, offset) async {
    try {
      return await Api().get_(
          '${MyConsts.baseUrl}favorites/getAllFavorites?limit=$limit&offset=$offset');
    } catch (e) {
      rethrow;
    }
  }

  addAndRemoveFavEvent(String id, bool isAddToFav) async {
    try {
      if (isAddToFav) {
        await Api().post_('${MyConsts.baseUrl}favorites/addToFavorites',
            params: jsonEncode({"eventID": id}));
      } else {
        await Api()
            .get_('${MyConsts.baseUrl}favorites/removeFromFavourites/$id');
      }
    } catch (e) {
      rethrow;
    }
  }

  addToAttendedEvents(String id) async {
    try {
      await Api().post_('${MyConsts.baseUrl}attended/addToAttendedEvents',
          params: jsonEncode({"eventID": id}));
    } catch (e) {
      rethrow;
    }
  }

  getAttendedEvents(limit, offset) async {
    try {
      return await Api().get_(
          '${MyConsts.baseUrl}attended/getAllAttended?limit=$limit&offset=$offset');
    } catch (e) {
      rethrow;
    }
  }
}
