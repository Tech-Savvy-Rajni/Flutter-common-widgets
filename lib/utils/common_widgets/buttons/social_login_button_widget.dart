import 'package:flutter/material.dart';
import '../../../utils/constants/app_theme.dart';
import '../common.dart';
import '../text_widget.dart';

class SocialLoginButtonWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final double? textSize;
  final FontWeight? fontWeight;
  final Function onPressed;
  final String prefixImage;
  final Color? prefixImageColor;
  final String? suffixImage;
  final Color? suffixImageColor;
  final double? imageSize;
  final Color? imageColor;
  final double? width;
  final double? height;

  final FontWeight? textWeight;
  const SocialLoginButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.prefixImage,
    this.prefixImageColor,
    this.suffixImage,
    this.suffixImageColor,
    this.imageSize,
    this.color,
    this.textColor,
    this.textSize,
    this.imageColor,
    this.textWeight,
    this.fontWeight,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width,
      child: OutlinedButton(
        onPressed: () {
          onPressed();
        },
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor:
                MaterialStateProperty.all<Color?>(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              side: const BorderSide(color: AppTheme.borderColor, width: 1),
              borderRadius: BorderRadius.circular(6.0),

              // side: BorderSide(color: Colors.red)
            ))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            hSpace(MediaQuery.of(context).size.width * 0.07),
            Image.asset(
              prefixImage,
              height: imageSize ?? 23.31,
              width: imageSize ?? 23.31,
              color: imageColor,
            ),
            hSpace(
              MediaQuery.of(context).size.width * 0.11,
            ),
            TextWidget(
              text,
              color: textColor ?? AppTheme.textBlackColor,
              size: textSize ?? 13,
              weight: fontWeight ?? FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
