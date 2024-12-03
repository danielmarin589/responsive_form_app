import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  String _name = '';
  String _gender = '';
  DateTime? _dob;
  bool _termsAccepted = false;

  String get name => _name;
  String get gender => _gender;
  DateTime? get dob => _dob;
  bool get termsAccepted => _termsAccepted;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  set gender(String value) {
    _gender = value;
    notifyListeners();
  }

  set dob(DateTime? value) {
    _dob = value;
    notifyListeners();
  }

  set termsAccepted(bool value) {
    _termsAccepted = value;
    notifyListeners();
  }

  void resetForm() {
    _name = '';
    _gender = '';
    _dob = null;
    _termsAccepted = false;
    notifyListeners();
  }
}
