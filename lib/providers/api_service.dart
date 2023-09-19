import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pak_endo/constants/preferences.dart';

class Resource<T> {
  final String url;
  T Function(http.Response response) parse;

  Resource({required this.url, required this.parse});
}

class Api {
  get_(String url, [headers]) async {
    print('GET url: $url');
    var header = headers ??
        {
          'Accept': 'application/json',
          'Authorization': Pref.getString(Pref.TOKEN_KEY).toString()
        };

    final response = await http.get(Uri.parse(url), headers: header);
    // print('GET response: ${response.body}');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 500) {
      throw Exception('Server Error');
    } else {
      throw Exception('Failed to load data!');
    }
  }

  post_(String url, {params, headers}) async {
    var header = headers ??
        {
          'Accept': 'application/json',
          'Authorization': Pref.getString(Pref.TOKEN_KEY).toString(),
          // 'Content-Type': 'application/json'
        };

    print('POST url: $url');
    final response = params == null
        ? await http.post(Uri.parse(url), headers: header)
        : await http.post(Uri.parse(url), body: params, headers: header);
    print(
        'Status Code: ${response.statusCode}\nPOST response: ${response.body}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 204) {
      return 'Logged out';
    } else {
      throw (getMeaningfulError(response));
    }
  }

  String getMeaningfulError(http.Response response) {
    var errorMsg = '';
    try {
      var jsonError = jsonDecode(response.body);
      if (jsonError is List) {
        for (var e in jsonError) {
          errorMsg += e['message'] + '\n';
        }
        print('error: $errorMsg');
      } else {
        errorMsg = jsonError['message'];
      }
    } catch (e) {
      errorMsg = '${response.statusCode}: ${response.body}';
    }

    return errorMsg;
  }
}
