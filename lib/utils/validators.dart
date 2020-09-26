class Validate {
  static String email(String val) =>
      !_isValidEmail(val) ? "Enter a valid email" : null;
  static String phone(String val) =>
      !_isValidPhone(val) ? "Enter a valid phone" : null;
  static String name(String val) =>
      !_isValidName(val) ? "Enter a valid name" : null;

  static bool _isValidEmail(String val) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(val);
  }

  static bool _isValidPhone(String val) {
    return (RegExp(
          r'^[0-9]*$',
        ).hasMatch(val) &&
        val.length == 10);
  }

  static bool _isValidName(String val) {
    return (RegExp(
          r'^[a-zA-Z\s]*$',
        ).hasMatch(val) &&
        val.length > 0);
  }
}
