import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

class EmailValidator implements Validator {
  const EmailValidator();

  @override
  void validate(Object? value, String propertyName) {
    if(!_isEmail(value as String?)) {
      throw Exception("Not a valid Email");
    }
  }

  bool _isEmail(String? string) {
    if (string == null || string.isEmpty) {
      return false;
    }

    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }
}