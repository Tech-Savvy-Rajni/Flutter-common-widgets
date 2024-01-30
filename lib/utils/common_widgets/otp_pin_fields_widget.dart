import 'package:flutter/cupertino.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../constants/app_theme.dart';
import '../shared/text_styles.dart';
import 'common.dart';

class OtpPinFieldsWidget extends StatelessWidget {
  final double fieldHeight;
  final double fieldWidth;
  final int maxlength;
  final double? textSize;
  final Color? textColor;
  final Color? defaultFieldBorderColor;
  final Color? activeFieldBorderColor;
  final Color? defaultFieldBackgroundColor;
  final Color? activeFieldBackgroundColor;
  final Color? cursorColor;
  final String? validaErrMsg;
  final double? validaErrMsgSize;
  final Color? validaErrMsgColor;
  OtpPinFieldsWidget(
      {Key? key,
      required this.fieldHeight,
      required this.fieldWidth,
      required this.maxlength,
      this.textSize,
      this.textColor,
      this.defaultFieldBorderColor,
      this.activeFieldBorderColor,
      this.defaultFieldBackgroundColor,
      this.activeFieldBackgroundColor,
      this.cursorColor,
      this.validaErrMsg,
      this.validaErrMsgSize,
      this.validaErrMsgColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(child: _otpTextField(context));
  }

  Widget _otpTextField(BuildContext context) {
    return Column(
      children: [
        OtpPinField(
          fieldHeight: fieldHeight,
          fieldWidth: fieldWidth,
          //   key: controllerState.otpPinFieldController,
          onSubmit: (text) {
            //    controllerState.otp = text;
          },
          onChange: (text) {
            //  controllerState.authBloc.add(const ClearValidation());
          },
          onCodeChanged: (code) {},
          otpPinFieldStyle: OtpPinFieldStyle(
            textStyle: Styles.mediumTextStyle(
                size: textSize ?? 24, color: textColor ?? AppTheme.textColor),
            defaultFieldBorderColor: defaultFieldBorderColor ??
                AppTheme.borderGreyColor.withOpacity(0.2),
            activeFieldBorderColor:
                activeFieldBorderColor ?? AppTheme.btnOrange1,
            defaultFieldBackgroundColor:
                defaultFieldBackgroundColor ?? AppTheme.whiteColor,
            activeFieldBackgroundColor:
                activeFieldBackgroundColor ?? AppTheme.whiteColor,
          ),
          maxLength: maxlength,
          cursorColor: cursorColor ?? AppTheme.orangeColor,
          mainAxisAlignment: MainAxisAlignment.center,
          otpPinFieldDecoration: OtpPinFieldDecoration.roundedPinBoxDecoration,
        ),
        vSpace(25),
        (validaErrMsg != null)
            ? Align(
                child: Text(
                  validaErrMsg!,
                  style: Styles.mediumTextStyle(
                      height: 0, size: validaErrMsgSize ?? 12, color: validaErrMsgColor ?? AppTheme.orangeColor),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
