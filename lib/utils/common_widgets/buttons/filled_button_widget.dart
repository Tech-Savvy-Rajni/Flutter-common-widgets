import 'package:flutter/material.dart';
import '../../../utils/constants/app_theme.dart';
import '../styles.dart';

class FilledButtonWidget extends StatelessWidget {
  final void Function()? onSubmit;
  final String text;
  final double? paddingHorizontal;
  final double? paddingVertical;
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
  final double? borderRadiusCircular;
  final Color? leftGradientColor;
  final Color? rightGradientColor;
  final Color? borderColor;

  const FilledButtonWidget({
    Key? key,
    required this.onSubmit,
    required this.text,
    required this.paddingHorizontal,
    required this.paddingVertical,
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
    this.borderRadiusCircular,
    this.leftGradientColor,
    this.rightGradientColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 55,
      width: width,

      child: Scrollbar(
        child: ElevatedButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 0)),
              // elevation: MaterialStateProperty.all(elevated),
              backgroundColor: MaterialStateProperty.all<Color?>(
                  backgroundColor ?? AppTheme.transparent),
              shadowColor: MaterialStateProperty.all<Color?>(
                  backgroundColor ?? AppTheme.whiteColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                side: BorderSide(width: 2, color: borderColor ?? AppTheme.btnOrange),
                borderRadius:
                    BorderRadius.circular(borderRadiusCircular ?? 25.0),
                // side: BorderSide(color: Colors.red)
              ))),
          onPressed: onSubmit,
          child: Ink(
            //MAKE TEXTURE COLOR
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadiusCircular ?? 25),
              gradient: LinearGradient(colors: [
                leftGradientColor ?? AppTheme.btnOrange1,
                rightGradientColor ?? AppTheme.btnOrange
              ]),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //FOR PREFIX ICON
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
                //FOR TEXT DISPLAY
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width *
                            paddingHorizontal!,
                        vertical: MediaQuery.of(context).size.height *
                            paddingVertical!),
                    child: Text(text,
                        style: Styles.boldTextStyle(
                          color: textColor ?? AppTheme.whiteColor,
                          size: textSize ?? 16,
                        ))),
                //FOR SUFFIX ICON
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
      ),
      // ),
    );
  }
}
