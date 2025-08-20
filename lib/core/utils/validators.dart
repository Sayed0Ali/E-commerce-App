class AppValidators {
  static String? validateEmail(String? value) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (value == null) {
      return 'This field is required';
    } else if (value.trim().isEmpty) {
      return 'This field is required';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    RegExp passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$');
    if (value == null) {
      return 'This field is required';
    } else if (value.trim().isEmpty) {
      return 'This field is required';
    } else if (value.length < 8 || !passwordRegex.hasMatch(value)) {
      return 'Password must be at least 8 characters long and contain letters and numbers';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    } else if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validateUserNme(String? value) {
    RegExp userNameRegex = RegExp(r'^[a-zA-Z0-9_]{3,}$');
    if (value == null) {
      return 'This field is required';
    } else if (value.trim().isEmpty) {
      return 'This field is required';
    } else if (!userNameRegex.hasMatch(value)) {
      return 'Username must be at least 3 characters long and can contain letters, numbers, and underscores';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null) {
      return 'This field is required';
    } else if (int.tryParse(value.trim()) == null) {
      return 'This field is required';
    } else if (value.trim().length != 11) {
      return 'Phone number must be 11 digits long';
    }
    return null;
  }

  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    } else {
      return null;
    }
  }
}
