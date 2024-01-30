import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../utils/constants/app_theme.dart';
import '../text_widget.dart';

class FilledBoxButtonWidget extends StatelessWidget {
  final void Function()? onSubmit;
  final String text;
  final double? textSize;
  final Color? textColor;
  final Color? imageColor;
  final Color? backgroundColor;
  final String? prefixImage;
  final Color? prefixImageColor;
  final String? suffixImage;
  final Color? suffixImageColor;
  final double? imageSize;
  final double? elevated;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;
  final double? buttoncircularRadius;
  final Widget? childWidget;

  const FilledBoxButtonWidget(
      {Key? key,
      required this.onSubmit,
      required this.text,
      this.textSize,
      this.textColor,
      this.backgroundColor,
      this.prefixImage,
      this.prefixImageColor,
      this.suffixImage,
      this.suffixImageColor,
      this.imageSize,
      this.elevated,
      this.imageColor,
      this.fontWeight,
      this.width,
      this.height,
      this.buttoncircularRadius,
      this.childWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 45,
      width: width,

      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(elevated),
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 8)),
            backgroundColor: MaterialStateProperty.all<Color?>(
                backgroundColor ?? vendorThemeColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttoncircularRadius ?? 6.0),
              // side: BorderSide(color: Colors.red)
            ))),
        onPressed: onSubmit,
        child: childWidget ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  child: TextWidget(
                    text,
                    size: textSize ?? 16,
                    weight: fontWeight ?? FontWeight.w500,
                    color: textColor ?? AppTheme.whiteColor,
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
      // ),
    );
  }
}
