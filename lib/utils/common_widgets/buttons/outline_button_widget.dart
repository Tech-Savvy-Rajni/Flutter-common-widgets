import 'package:flutter/material.dart';
import '../../../utils/constants/app_theme.dart';
import '../text_widget.dart';

class OutlineButtonWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final double? textSize;
  final double? texthorizontalPadding;
  final FontWeight? fontWeight;
  final Function onPressed;
  final String? prefixImage;
  final Color? prefixImageColor;
  final String? suffixImage;
  final Color? suffixImageColor;
  final double? imageSize;
  final Color? imageColor;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final double? borderRadius;
  final Color? borderColor;
  final EdgeInsets? padding;

  const OutlineButtonWidget(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.texthorizontalPadding,
      this.prefixImage,
      this.prefixImageColor,
      this.suffixImage,
      this.suffixImageColor,
      this.imageSize,
      this.color,
      this.textColor,
      this.textSize,
      this.imageColor,
      this.fontWeight,
      this.width,
      this.height,
      this.backgroundColor,
      this.borderRadius,
      this.borderColor,
      this.padding})
      : super(key: key);

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
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.only(left: 0, right: 0)),
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all<Color?>(
                backgroundColor ?? Colors.transparent),
            side: MaterialStateProperty.all<BorderSide>(
                BorderSide(color: borderColor ?? AppTheme.redColor, width: 1)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              // side: BorderSide(color: AppTheme.textBlackColor, width: 6),
              borderRadius: BorderRadius.circular(borderRadius ?? 5.0),

              // side: BorderSide(color: Colors.red)
            ))),
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefixImage != null)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.005,
                  ),
                  child: Image.asset(
                    prefixImage.toString(),
                    height: imageSize,
                    color: imageColor,
                  ),
                ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: texthorizontalPadding ?? 0),
                child: TextWidget(
                  text,
                  size: textSize ?? 15,
                  color: textColor ?? AppTheme.textBlackColor,
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
      ),
    );
  }
}
