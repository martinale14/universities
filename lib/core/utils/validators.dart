import 'package:universities/core/utils/translations.dart';

class Validators {
  static String? requiredFieldValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    } else {
      return lang.requiredFieldValidation;
    }
  }
}
