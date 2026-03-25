// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// sharedPreference provider
// final sharedPreferencesProvider = Provider<SharedPreferences>(
//   (ref) => throw UnimplementedError(),
// );

class SharedPrefencesService {
  static late SharedPreferences _prefsInstance;

  static Future<void> init() async {
    _prefsInstance = await SharedPreferences.getInstance();
  }

  static String? getString(String key) => _prefsInstance.getString(key);
  static Future<bool> setString(String key, String value) =>
      _prefsInstance.setString(key, value);
}
