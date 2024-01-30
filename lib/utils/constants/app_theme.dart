import 'package:flutter/material.dart';

class AppTheme {
  // static const Color textBlackColor = Color(0xff000000);
  // static const Color errorTextColor = Color(0xffE2192B);
  // static const Color textFieldBorderColor = Color.fromRGBO(17, 52, 134, 1);
  // static const Color whiteColor = Color(0xffFFFFFF);
  // static const Color redColor = Color(0xffE2192B);
  // static const Color borderColor = Color(0xffE6E6E6);
  // static const Color lightGreyColor = Color(0xffF7F7F7);
  // static const Color checkBoxBorderColor = Color(0xff707070);
  // static const Color yellowColor = Color(0xffF7B502);
  // static const Color unselectedLabelColor = Color(0xffADB5BD);
  // static const Color greyColor = Color(0xffDEDF79535EDE);
  // static const Color grey100Color = Color(0xffF0F0F0);
  // static const Color shadowColor = Color.fromRGBO(77, 0, 0, 0.15);
  // static const Color grey50Color = Color(0xE2192B0D);
  // static const Color orangeColor = Color(0xffFEC431);
  // static const Color dividerColor = Color(0xffF0F0F0);
  // static const Color lightRedColor = Color.fromRGBO(226, 25, 43, 0.05);
  // static const Color thinDividerColor = Color(0xffDEDEDE);
  // static const Color greyTextFAQColor = Color(0xff7F7F7F);
  // static const Color greyBoxColor = Color(0xffF2F2F2);
  //
  // static const Color onBoardingGrey = Color(0xffBEBEBE);
  // static const Color onBoardingLightGrey = Color(0xff999999);
  // static const Color LIGHTGREY2 = Color(0xffDEDEDE);
  // static const Color LIGHTGREY3 = Color(0xffF0F0F0);
  // static const Color YELLOWCOLOR = Color(0xffF0B000);
  // static const Color GREYMIDIEUM = Color(0xff7F7F7F);
  // static const Color LIGHTREDCOLOR = Color.fromRGBO(226, 25, 43, 0.05);
  static Color textColor = hexToColor('#061A5D');
  static Color borderGreyColor = hexToColor('#CBCBCB');
  static const Color textBlackColor = Color(0xff000000);
  static const Color headingtextBlackColor = Color(0xff333333);
  static const Color errorTextColor = Color(0xffE2192B);
  static const Color textFieldBorderColor = Color.fromRGBO(17, 52, 134, 1);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color redColor = Color(0xffE2192B);
  static const Color borderColor = Color(0xffE6E6E6);
  static const Color lightGreyColor = Color(0xffF7F7F7);
  static const Color checkBoxBorderColor = Color(0xff707070);
  static const Color yellowColor = Color(0xffF7B502);
  static const Color unselectedLabelColor = Color(0xffADB5BD);
  static const Color greyColor = Color(0xffDEDEDE);
  static const Color shadowColor = Color.fromRGBO(77, 0, 0, 0.15);
  static const Color grey50Color = Color(0xE2192B0D);
  static const Color orangeColor = Color(0xffFEC431);
  static const Color dividerColor = Color(0xffF0F0F0);
  static const Color lightRedColor = Color.fromRGBO(226, 25, 43, 0.05);
  static const Color greyBoxColor = Color(0xffF2F2F2);
  static const Color couponIconColor = Color(0xffB2B2B2);
  static const Color markReadColor = Color(0xff1D78E2);
  static const Color greenColor = Color(0xff3EB431);
  static const Color blueColor = Colors.blue;
  static const Color transparent = Colors.transparent;
  static const Color onBoardingGrey = Color(0xffBEBEBE);
  static const Color onBoardingLightGrey = Color(0xff999999);
  static const Color onBoardingMediumGrey = Color(0xff7F7F7F);
  static const Color lightYellowColor = Color(0xffFFFBE6);
  static Color starColor = hexToColor('#F0B000');
  static Color confirmColor = hexToColor('#3EB400');
  static Color disableGreyColor = hexToColor('#575757');
  static const Color btnOrange = Color(0xFFF15A25);
  static const Color btnOrange1 = Color(0xFFF79535);

  static const Color hintColor = Color(0xFF666666);
  static const Color iconGrayColor = Color(0xFF666666);
  static const Color lightgrayColor = Color(0xFFEFEDF0);
  static const Color veryLightGrayColor = Color(0xFFE5E5E5);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
