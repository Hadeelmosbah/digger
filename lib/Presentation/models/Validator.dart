import '../../core/constant/strings.dart';


class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.enterEmail;
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return AppStrings.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.enterPassword;
    }
    if (value.length < 6) {
      return AppStrings.shortPassword;
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.enterUsername;
    }
    if (value.length < 3) {
      return AppStrings.shortUsername;
    }
    if (value.length > 20) {
      return AppStrings.longUsername;
    }
    return null;
  }
}
