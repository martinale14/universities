import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _localeSelected = 'locale_selected';
  static const String _viewType = 'view_type';

  Future<bool> setViewType(String viewType) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_viewType, viewType);
  }

  Future<String?> getViewType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_viewType);
  }

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
