import 'package:do_it_flutter/utils/log.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesServices {
  static Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  static Future<bool> setString(String key, String value) async {
    final prefs = await _prefs;
    return prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  static void reload() async {
    final prefs = await _prefs;
    prefs.reload();
  }

  static Future<bool> remove(String key) async {
    final prefs = await _prefs;
    return prefs.remove(key);
  }

  static Future<bool> clear() async {
    final prefs = await _prefs;
    return prefs.clear();
  }
}
