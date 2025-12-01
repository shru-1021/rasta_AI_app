import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static SharedPreferences? _prefs;

  // Initialize once (call in main)
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save String
  static Future saveString(String key, String value) async {
    await _prefs!.setString(key, value);
  }

  // Read String
  static String? getString(String key) {
    return _prefs!.getString(key);
  }

  // Save Boolean
  static Future saveBool(String key, bool value) async {
    await _prefs!.setBool(key, value);
  }

  // Read Boolean
  static bool? getBool(String key) {
    return _prefs!.getBool(key);
  }

  // Remove One
  static Future remove(String key) async {
    await _prefs!.remove(key);
  }

  // Clear All
  static Future clear() async {
    await _prefs!.clear();
  }
}
