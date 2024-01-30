import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../utils/constants/app_theme.dart';
import '../text_widget.dart';

class OutlineBoxButtonWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final double? textSize;
  final FontWeight? fontWeight;
  final Function()? onPressed;
  final String? prefixImage;
  final Color? prefixImageColor;
  final String? suffixImage;
  final Color? suffixImageColor;
  final double? imageSize;
  final Color? imageColor;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final double? buttonBorderRadius;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final Color? borderColor;

  final FontWeight? textWeight;
  const OutlineBoxButtonWidget(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.prefixImage,
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
      this.backgroundColor,
      this.buttonBorderRadius,
      this.contentPaddingHorizontal,
      this.contentPaddingVertical,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            elevation: 0,
            backgroundColor: backgroundColor ?? Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonBorderRadius ?? 8.0)),
            side: BorderSide(
                color: borderColor ?? vendorThemeColor ??  AppTheme.redColor,
                style: BorderStyle.solid,
                width: 1.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixImage != null)
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.004),
                child: Image.asset(
                  prefixImage.toString(),
                  height: imageSize,
                  color: imageColor,
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: contentPaddingHorizontal ??
                      MediaQuery.of(context).size.width * 0.004,
                  vertical: contentPaddingVertical ??
                      MediaQuery.of(context).size.height * 0.01),
              child: TextWidget(
                text,
                color: textColor ?? AppTheme.textBlackColor,
                size: textSize ?? 15,
                weight: fontWeight ?? FontWeight.normal,
              ),
            ),
            if (suffixImage != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Image.asset(
                  suffixImage.toString(),
                  height: imageSize,
                  color: imageColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class RateDeliveryBtn extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onClick;
  final EdgeInsets margin;
  final TextStyle? textStyle;

  const RateDeliveryBtn(
      {Key? key,
      required this.text,
      this.textStyle,
      required this.color,
      this.onClick,
      this.margin = const EdgeInsets.symmetric(horizontal: 15, vertical: 15)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onClick,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.42,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.textBlackColor),
            borderRadius: BorderRadius.circular(18),
            color: color,
          ),
          // margin: this.margin,
          child: Center(
            child: Text(
              text,
              style: textStyle ??
                  const TextStyle(
                      color: AppTheme.textBlackColor,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.3),
            ),
          ),
        ));
  }
}
