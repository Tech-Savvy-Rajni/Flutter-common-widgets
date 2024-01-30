import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:keystatus/utils/common_widgets/shared_pref.dart';
import '../../utils/constants/app_assets.dart';
import '../../utils/constants/app_theme.dart';
import '../constants/strings.dart';
import '../shared/text_styles.dart';
import 'buttons/filledbox_button_widget.dart';
import 'buttons/outlinebox_button_widget.dart';
import 'text_widget.dart';
import 'textfields/label_textfield_widget.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

Widget hSpace(double space) {
  return SizedBox(
    width: space,
  );
}

Widget vSpace(double space) {
  return SizedBox(
    height: space,
  );
}

void toast(String msg) async {
  await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
      fontSize: 16.0);
}

Widget thickDivider() {
  return Container(
    height: 4.5,
    decoration: const BoxDecoration(
      color: AppTheme.dividerColor,
      border: Border(top: BorderSide(color: AppTheme.greyColor, width: 1)),
    ),
  );
}

Widget circularProgressIndicator() {
  return const Center(
      child: CircularProgressIndicator(
    backgroundColor: AppTheme.btnOrange,
    valueColor: AlwaysStoppedAnimation(AppTheme.btnOrange1),
    strokeWidth: 10,
  ));
}

customSnackBar({
  required String content,
  required Color bcolor,
  required double elevation,
  required SnackBarBehavior behavior,
  required double margin,
}) {
  return SnackBar(
    content: Text(content),
    backgroundColor: bcolor,
    elevation: elevation,
    behavior: behavior,
    margin: EdgeInsets.all(margin),
  );
}

Future<void> bottomSheetWidget({
  required BuildContext context,
  required Widget childWidget,
  double? height,
  Function()? onclose,
  EdgeInsets? childPadding,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(5),
      topRight: Radius.circular(5),
    )),
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return SizedBox(
        height: height,
        // MediaQuery.of(context).size.height * 0.76,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  if (onclose != null) {
                    onclose();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: Image.asset(
                    closeIcon,
                  ),
                ),
              ),
            ),
            vSpace(20),
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                      color: AppTheme.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      )),
                  padding: childPadding ??
                      const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: childWidget),
            ),
          ],
        ),
      );
    },
  );
}

Future<String?> enterTipAmountHOLD(BuildContext context,
    {String? previousAmount}) async {
  TextEditingController customAmountController = TextEditingController();
  if (previousAmount != null && previousAmount.isNotEmpty) {
    customAmountController.text = previousAmount;
  }

  return showModalBottomSheet<String?>(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      transform: Matrix4.translationValues(
                          0.0, -45, 0.0), // translate up by 30
                      child: InkWell(
                        onTap: () {
                          customAmountController.clear();
                          Navigator.pop(context, '0.0');
                        },
                        child: SizedBox(
                          width: 35,
                          height: 35,
                          child: Image.asset(
                            cancelIcon,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: TextWidget(
                      'addTipAmount',
                      size: 16,
                      color: AppTheme.textBlackColor,
                      weight: FontWeight.w700,
                    ),
                  ),
                  vSpace(4),
                  LabelTextFieldWidget(
                      hintText: '00.00',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                                color: AppTheme.borderColor),
                            child: const Center(
                              child: TextWidget(
                                '\$',
                                size: 18,
                                weight: FontWeight.bold,
                              ),
                            )),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'(^\d*\.?\d{0,2})')),
                        LengthLimitingTextInputFormatter(6)
                      ],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      label: '',
                      controller: customAmountController),
                  vSpace(80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: OutlineBoxButtonWidget(
                          borderColor: AppTheme.redColor,
                          color: AppTheme.redColor,
                          height: 40,
                          text: reset,
                          onPressed: () {
                            customAmountController.text = '';
                            //Navigator.pop(context, '0.0');
                          },
                          textColor: AppTheme.redColor,
                          buttonBorderRadius: 5,
                        ),
                      ),
                      hSpace(20),
                      Expanded(
                        child: FilledBoxButtonWidget(
                          height: 40,
                          onSubmit: () {
                            Navigator.pop(context, customAmountController.text);
                          },
                          text: continueString,
                          elevated: 0,
                        ),
                      ),
                    ],
                  ),
                  vSpace(Platform.isAndroid ? 20 : 30),
                ])),
          ));
    },
  );
  // return customAmountController.text;
}

void cartCautionHOLD(
    {required BuildContext context,
    required Function() onDiscart,
    required Function() onGoToCart}) {
  showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(
          left: Radius.circular(5), right: Radius.circular(5)),
    ),
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                transform: Matrix4.translationValues(
                    0.0, -45, 0.0), // translate up by 30
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SizedBox(
                    width: 35,
                    height: 35,
                    child: Image.asset(
                      cancelIcon,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextWidget(
                '$hey! ${SharedPref.getString(SharedPref.userNameKey, def: "")}',
                size: 15,
                color: AppTheme.textBlackColor,
                weight: FontWeight.w600,
              ),
            ),
            const Divider(
              height: 8,
              thickness: 8,
              color: AppTheme.dividerColor,
            ),
            vSpace(15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: TextWidget(
                'We provide checkout for one shop at a time',
                size: 15,
                color: AppTheme.textBlackColor,
                weight: FontWeight.w500,
                centerAlign: true,
              ),
            ),
            vSpace(35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        OutlineBoxButtonWidget(
                          height: 40,
                          text: goToCart,
                          onPressed: () {
                            // Navigator.of(context).pop();
                            onGoToCart();
                          },
                          textColor: AppTheme.redColor,
                          borderColor: AppTheme.redColor,
                          textSize: 13.5,
                          buttonBorderRadius: 5,
                        ),
                        vSpace(10),
                        const TextWidget(
                          completePreviousOrder,
                          size: 12,
                          color: AppTheme.textBlackColor,
                          weight: FontWeight.w300,
                          centerAlign: true,
                        ),
                      ],
                    ),
                  ),
                  hSpace(10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FilledBoxButtonWidget(
                          height: 40,
                          onSubmit: () {
                            // Navigator.of(context).pop();
                            onDiscart();
                          },
                          text: 'Discard cart items',
                          textSize: 13.5,
                          elevated: 0,
                        ),
                        vSpace(10),
                        const TextWidget(
                          placeNewOrder,
                          size: 12,
                          color: AppTheme.textBlackColor,
                          weight: FontWeight.w300,
                          centerAlign: true,
                        ),
                      ],
                    ),
                  ),
                  vSpace(5),
                ],
              ),
            ),
            vSpace(Platform.isIOS ? 40 : 10),
          ],
        ),
      );
    },
  );
}

Future<void> commonAlertDialog(
    {required BuildContext context,
    required String? title,
    String? subtitle,
    required String cancelButtonText,
    required String submitButtonText,
    Function()? cancelButton,
    Function()? submitButton}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.only(top: 30),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.0), topLeft: Radius.circular(5.0)),
        ),
        title: TextWidget(
          title ?? '',
          size: 15,
          weight: FontWeight.w600,
          centerAlign: true,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            vSpace(20),
            TextWidget(
              subtitle ?? '',
              size: 12,
              centerAlign: true,
            ),
            vSpace(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlineBoxButtonWidget(
                    borderColor: AppTheme.redColor,
                    text: cancelButtonText,
                    onPressed: cancelButton,
                    textColor: AppTheme.redColor,
                    textSize: 16,
                    width: MediaQuery.of(context).size.width * 0.38,
                    height: 40,
                  ),
                ),
                hSpace(10),
                Expanded(
                  child: FilledBoxButtonWidget(
                    onSubmit: submitButton,
                    text: submitButtonText,
                    width: MediaQuery.of(context).size.width * 0.38,
                    height: 40,
                  ),
                ),
              ],
            ),
            vSpace(20)
          ],
        ),
        // actions: <Widget>[

        // ],
      );
    },
  );
}

onBackPopUp(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.only(top: 30),
        contentPadding: const EdgeInsets.only(bottom: 35, left: 24, right: 24),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            vSpace(30),
            TextWidget(
              'Are you sure you want to exit?',
              size: 20,
              style: Styles.semiBoldTextStyle(),
            ),
            vSpace(25),
            Row(
              children: [
                Expanded(
                  child: OutlineBoxButtonWidget(
                    borderColor: AppTheme.redColor,
                    height: 40,
                    text: 'No',
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    textColor: AppTheme.redColor,
                    buttonBorderRadius: 5,
                  ),
                ),
                hSpace(12),
                Expanded(
                  child: FilledBoxButtonWidget(
                    onSubmit: () async {
                      log("i m doing exiting app");
                      Navigator.of(context).pop();
                      if (Platform.isAndroid) {
                        SystemChannels.platform
                            .invokeMethod('SystemNavigator.pop');
                        //SystemNavigator.pop();
                      } else if (Platform.isIOS) {
                        exit(0);
                      }
                    },
                    text: 'Yes',
                    height: 40,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}

void popDialog(BuildContext context) {
  Navigator.of(context).pop();
}

String getUSFormatted(String number) {
  var formattedNumber = number.replaceAllMapped(
      RegExp(r"(\d{3})(\d{3})(\d+)"), (Match m) => "(${m[1]}) ${m[2]}-${m[3]}");
  return formattedNumber;
}

String dateFormat(String date) {
  try {
    return DateFormat('MM/dd/yyyy hh:mm a')
        .format(DateTime.parse(date).toLocal());
  } catch (e) {
    return date;
  }
}

String dateFormat2(String date) {
  try {
    return DateFormat('MM/dd/yyyy hh:mm a').format(DateTime.parse(date));
  } catch (e) {
    return date;
  }
}

String getFormattedDate(DateTime date) {
  final String formatted = DateFormat('MM/dd/yyyy')
      .format(date.add(const Duration(hours: 5, minutes: 30)));
  return formatted;
}
