import 'dart:core';

class RegexConst {
  static RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");


  static RegExp passwordValidRegex = RegExp(
   r"(?=.*[a-z])(?=.*[A-Z])(?=.*?[0-9])\w+" );
}

