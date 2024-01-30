import 'package:flutter/material.dart';

class AppTheme {
  static Color secondaryDarkAppColor = Colors.white;
  static Color tipColor = hexToColor('#B6B6B6');
  static Color darkGray = const Color(0xFF9F9F9F);
  static Color black = const Color(0x00000000);
  static Color white = const Color(0xFFFFFFFF);
  static Color silver = const Color(0xFFEEDAC1);

  static Color grey = hexToColor("#F0F0F0");

  static Color transparent = hexToColor('#00ffffff');
  static Color unselectStar = hexToColor('#00ffffff');
  static Color backColor = hexToColor('#FFFFFF');
  static Color ticketChat = hexToColor('#E3E3E3');
  static Color openButton = hexToColor('#FEC431');
  static Color notificationShade = hexToColor('#7F7F7F');
  static Color progressLine = hexToColor('#B5B5B5');
  static Color starColor = hexToColor('#F0B000');
  static Color markRead = hexToColor('#1D78E2');
  static Color bottomLabels = hexToColor('#ADB5BD');
  static Color issueResolve = hexToColor('#0000001A');
  static Color resolveBorder = hexToColor('#0000001A');
  static Color confirmColor = hexToColor('#3EB400');
  static Color rateText = hexToColor('#331013');
  static Color lightText = hexToColor('#999999');
  static Color dropdownColor = hexToColor('#00000029');
  static Color whiteShade = hexToColor('#F0F0F0');
  static Color highlightColor = hexToColor('#DEDEDE');
  static Color refreshColor = hexToColor('#FFC431');
  static Color buttonColor = hexToColor('#E2192B');
  static Color txtColor = hexToColor('#000000');
  static Color mainTheme = hexToColor('#E2192B');
  static Color lightRed = hexToColor('#E2192B0D');
  //static Color borderColor = hexToColor('#E6E6E6');
  static Color textColork = hexToColor('#00ffffff');
  static Color offWhite = hexToColor('#F7F7F7');
  static Color buttonBG = hexToColor('#115B78');
  static Color textColor = hexToColor('#061A5D');
  static Color mainBgColor = hexToColor('#F8F7F1');
  static Color whiteBg = hexToColor('#FFFFFF0D');
  static Color brownBg = hexToColor('#372314');
  static Color lightGreyBg = hexToColor('#CCCCCC');
  static Color richTextColor = hexToColor('#125B78');
  static Color codeTextColor = hexToColor('#D75F32');
  static Color switchButtonGrey = hexToColor('#E4E4E4');
  static Color selectDrawerOptionColor = hexToColor('#EEDAC1');
  static Color errorColor = hexToColor('#FF0000');
  // static Color dividerColor = hexToColor('#707070');
  static Color borderGreyColor = hexToColor('#CBCBCB');
  //static Color yellowColor = hexToColor('#FABE14');
  static Color cardBgColor = hexToColor('#F8F8F8');
  static Color loaderColor = hexToColor('#fcfcfc');
  static Color calenderGreyColor = hexToColor('#8B8B8B');
  static Color timeSlotGreyColor = hexToColor('#003723140D');
  static Color questionTextColor = hexToColor('#005D7A');
  static Color listBorderColor = hexToColor('#DDDDDD');

  //seats git

  static const Color textBlackColor = Color(0xff000000);
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

  static const Color onBoardingGrey = Color(0xffBEBEBE);
  static const Color onBoardingLightGrey = Color(0xff999999);
  static const Color onBoardingMediumGrey = Color(0xff7F7F7F);
  static const Color lightYellowColor = Color(0xffFFFBE6);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
