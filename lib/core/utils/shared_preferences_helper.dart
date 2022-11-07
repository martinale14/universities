import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _localeSelected = 'locale_selected';

  Future<bool> setLocale(String lang) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_localeSelected, lang);
  }

  Future<String?> getLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_localeSelected) ?? 'es';
  }

  Future<void> clearData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
