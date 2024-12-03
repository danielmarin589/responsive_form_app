import 'package:test_tehnic_flaminjoy/core/utils/constants.dart';

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

  static String? validateDateOfBirth(DateTime? value) {
    if (value == null) {
      return AppStrings.dateOfBirthRequired;
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
