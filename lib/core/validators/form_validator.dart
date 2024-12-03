import 'package:responsive_form_app/core/utils/constants.dart';

class FormValidator {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.nameRequired;
    }
    return null;
  }

  static String? validateGender(String? value) {
    if (value == null) {
      return AppStrings.genderRequired;
    }
    return null;
  }

  static String? validateTermsAccepted(bool? value) {
    if (value == null || !value) {
      return AppStrings.termsAndConditionsNeeded;
    }
    return null;
  }
}
