import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static SharedPreferences? _prefsInstance;
  static const String TOKEN_KEY = "TOKEN_KEY";
  static const String USERID_KEY = "USERID_KEY";

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String? getString(String key, [String? defValue]) {
    return _prefsInstance?.getString(key);
  }

  static Future<bool> setString(String key, String value) async {
    SharedPreferences prefs = await _instance;
    return prefs.setString(key, value);
  }

  static Future<bool?> removeString(String key) async {
    return _prefsInstance?.remove(key);
  }

  static int? getInt(String key, [int? defValue]) {
    return _prefsInstance?.getInt(key) ?? defValue;
  }

  static Future<bool> setInt(String key, int value) async {
    SharedPreferences prefs = await _instance;
    return prefs.setInt(key, value);
  }

  static List<String> getList(String key, [List<String>? defValue]) {
    return _prefsInstance?.getStringList(key) ?? defValue ?? [];
  }

  static Future<bool> setList(String key, List<String> value) async {
    SharedPreferences prefs = await _instance;
    return prefs.setStringList(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    SharedPreferences prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static bool? getBool(String key, [bool? defValue]) {
    return _prefsInstance?.getBool(key) ?? defValue;
  }
}
