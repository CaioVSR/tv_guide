/// The [FieldsValidators] class contains static methods for validating
/// common form inputs such as email addresses, passwords, and required fields.
///
class FieldsValidators {
  /// Private constructor to prevent instantiation of this class.
  const FieldsValidators._();

  /// Validates an email address.
  ///
  /// This validator checks if the email field is not empty and matches
  /// a regular expression pattern for valid email addresses.
  ///
  /// Returns an error message if the email is invalid or null if the email is valid.
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is required';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  /// Validates a password.
  ///
  /// This validator checks if the password field is not empty and has
  /// at least 6 characters.
  ///
  /// Returns an error message if the password is invalid or null if the password is valid.
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is required';
    } else if (value.length < 5) {
      return 'Password must be at least 5 characters long';
    }
    return null;
  }
}
