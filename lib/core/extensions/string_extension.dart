import 'dart:convert';

extension StringExtension on String {
  bool isJson() {
    try {
      json.encode(this);
    } catch (e) {
      return false;
    }
    return true;
  }

  Map<String, dynamic> toJson() {
    return json.decode(trim());
  }
}
