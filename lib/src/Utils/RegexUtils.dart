class RegexUtils {

  static RegExp phone_regex = RegExp(r'^(?:\+?1[-.●]?)?\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$');
  static RegExp email_regex = RegExp(_email_regex_string);

  static const _email_regex_string = r'''(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])''';

  /// Returns true if [email] is a valid email address
  static bool isValidEmailAddress(String email) => email_regex.hasMatch(email);

  /// Returns true if [phone] is a valid North American Phone number
  /// The number must be contain the area code - i.e 7 digit numbers are not accepted
  static bool isValidNAPhoneNumber(String phone) => phone_regex.hasMatch(phone);

}