import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesServices {
  static Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  static void setString(String key, String value) async {
    final prefs = await _prefs;
    prefs.setString(key, value);
  }

  static Future<String> getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key) ?? "";
  }

  static void reload() async {
    final prefs = await _prefs;
    prefs.reload();
  }

  static void remove(String key) async {
    final prefs = await _prefs;
    prefs.remove(key);
  }

  static void clear() async {
    final prefs = await _prefs;
    prefs.clear();
  }
}
