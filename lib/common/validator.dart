//final nameRegex = RegExp(r'[a-zA-Z]\s');
final RegExp nameRegex = RegExp(r'[a-zA-Z]');
final emailRegex = RegExp(r'\S+@\S+\.\S+');
final emailRegex1 = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final usNumberRegex = RegExp(r'(\d{3})(\d{3})(\d+)');
final numberInputFieldRegex = RegExp('[0-9]');
final spaceRegex = RegExp('^[a-zA-Z][a-zA-Z- ]*');
final spaceRegex1 = RegExp('[a-zA-Z]');
final alphanumericRegex = RegExp(r'[A-Za-z0-9#+-.]');
final linkRegex = RegExp(r'[A-Za-z0-9\-._~:/?#[\]@!$&()*%+,;=]+');
final linkRegex1 = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+\.[a-zA-Z]+");
final linkRegex3 = RegExp(
    r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)');
final emoji = RegExp(r'^[^.-]*');
final passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
final lengthRegex = RegExp(r'^.{8,}$');
final oneUpperCaseRegex = RegExp(r'^(?=.*?[A-Z])');
final onelowerCaseRegex = RegExp(r'^(?=.*?[a-z])');
final oneSymboleRegex = RegExp(r'^(?=.*?[!@#\$&*~])');

/// phone number regex
final specialCharRegex = RegExp(r'[*#@$()]+');
final firstThreeCharRegex = RegExp(r'^\+\d{1,3}');
final hypeCharRegex = RegExp(r'\s+|-');

class Validator {
  static bool? isTextValid(String? name) {
    if (name == null || name.isEmpty || !nameRegex.hasMatch(name)) return false;
    return nameRegex.hasMatch(name);
  }

  static bool isRegexValid({required String value}) {
    if (value.isEmpty || !nameRegex.hasMatch(value)) return false;
    return nameRegex.hasMatch(value);
  }

  static bool isEmailValid({required String value}) {
    if (value.isEmpty || !emailRegex.hasMatch(value)) return false;
    return emailRegex.hasMatch(value);
  }

  static bool isLinkValid({required String value}) {
    if (value.isEmpty || !linkRegex1.hasMatch(value)) return false;
    return linkRegex1.hasMatch(value);
  }

  static String getUSFormatted(String number) {
    final formattedNumber = number.replaceAllMapped(usNumberRegex, (Match m) => '${m[1]}-${m[2]}-${m[3]}');
    return formattedNumber;
  }

  static int getPhoneNumber(String number) {
    final formattedNumber = int.parse(number.replaceAll(specialCharRegex, '').replaceAll(firstThreeCharRegex, '').replaceAll(hypeCharRegex, ''));
    return formattedNumber;
  }
  static bool isPasswordValid({required String value}) {
    if (value.isEmpty || !passwordRegex.hasMatch(value)) return false;
    return passwordRegex.hasMatch(value);
  }
  static bool isPasswordlengthValid({required String value}) {
    if (value.isEmpty || !lengthRegex.hasMatch(value)) return false;
    return lengthRegex.hasMatch(value);
  }
  static bool isoneUpperCaseRegexValid({required String value}) {
    if (value.isEmpty || !oneUpperCaseRegex.hasMatch(value)) return false;
    return oneUpperCaseRegex.hasMatch(value);
  }
  static bool isonelowerCaseRegexValid({required String value}) {
    if (value.isEmpty || !onelowerCaseRegex.hasMatch(value)) return false;
    return onelowerCaseRegex.hasMatch(value);
  }
  static bool isoneSymboleRegexValid({required String value}) {
    if (value.isEmpty || !oneSymboleRegex.hasMatch(value)) return false;
    return oneSymboleRegex.hasMatch(value);
  }
}

