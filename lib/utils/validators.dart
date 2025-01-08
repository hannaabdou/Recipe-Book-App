bool isValidEmail(String email) {
  return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email);
}

bool isValidPassword(String password) {
  return password.length >= 6;
}

class Validators {
  static String? validateTextField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName cannot be empty';
    }
    if (value.length < 3) {
      return '$fieldName must be at least 3 characters';
    }
    return null;
  }
}
