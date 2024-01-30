import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/app_theme.dart';
import '../../shared/text_styles.dart';
import '../common.dart';
import '../text_widget.dart';

class HintTextFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final double? hintTextSize;
  final String? errorMessage;
  final Color? hintTextColor;
  final bool? isObscure;
  final double? borderRadiusCircular;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final Function(String)? validator;
  final Function()? onEditingComplete;
  final bool? readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final int? maxLines;
  final FontWeight? labelFontWeight;
  final double? labelTextFieldSpacing;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final bool? filled;
  final Color? filledColor;

  const HintTextFormFieldWidget(
      {Key? key,
      GlobalKey<FormState>? formKey,
      this.hintText,
      this.hintTextSize,
      this.errorMessage,
      this.hintTextColor,
      this.borderRadiusCircular,
      required this.controller,
      this.keyboardType,
      this.onChanged,
      this.onTap,
      this.onSubmitted,
      this.onEditingComplete,
      this.readOnly,
      this.suffixIcon,
      this.prefixIcon,
      this.prefixIconConstraints,
      this.suffixIconConstraints,
      this.isObscure,
      this.maxLines=1,
      this.labelFontWeight,
      this.labelTextFieldSpacing,
      this.textCapitalization,
      this.inputFormatters,
      this.filled,
      this.filledColor,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          maxLines: maxLines,
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          readOnly: readOnly ?? false,
          onTap: onTap,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          inputFormatters: inputFormatters,
          onFieldSubmitted: (val) {
            FocusScope.of(context).unfocus();
            print("hahah");
            if (onSubmitted != null) {
              onSubmitted!(val);
            }
          },
          onEditingComplete: onEditingComplete,
          obscureText: isObscure ?? false,
          style: Styles.normalTextStyle(
            size: 14,
          ),
          decoration: InputDecoration(
            filled: filled ?? false,
            fillColor: filledColor ?? AppTheme.whiteColor,
            contentPadding:
                const EdgeInsets.only(left: 20, top: 20, bottom: 0, right: 20),
            //  errorText: errorMessage,
            suffixIconConstraints: suffixIconConstraints,
            // const BoxConstraints(maxHeight: 50, maxWidth: 65),
            suffixIcon: suffixIcon,
            errorStyle: Styles.normalTextStyle(
              size: 13,
              color: AppTheme.errorTextColor,
            ),
            hintText: hintText,
            hintStyle: Styles.regularTextStyle(
              size: hintTextSize ?? 16,
              color: hintTextColor ?? AppTheme.textBlackColor.withOpacity(0.4),
            ),
            focusedBorder: errorMessage == null
                ? OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(borderRadiusCircular ?? 25),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppTheme.btnOrange,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(borderRadiusCircular ?? 25),
                    borderSide: const BorderSide(
                        width: 1, color: AppTheme.errorTextColor),
                  ),
            border: errorMessage == null
                ? OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(borderRadiusCircular ?? 25),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppTheme.borderColor,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(borderRadiusCircular ?? 25),
                    borderSide: const BorderSide(
                        width: 1, color: AppTheme.errorTextColor),
                  ),
            enabledBorder: errorMessage == null
                ? OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(borderRadiusCircular ?? 25),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppTheme.borderColor,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(borderRadiusCircular ?? 25),
                    borderSide: const BorderSide(
                        width: 1, color: AppTheme.errorTextColor),
                  ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusCircular ?? 25),
              borderSide:
                  const BorderSide(width: 1, color: AppTheme.errorTextColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusCircular ?? 25),
              borderSide: const BorderSide(
                width: 1,
                color: AppTheme.borderColor,
              ),
            ),
            prefixIconConstraints: prefixIconConstraints,
            prefixIcon: prefixIcon,
          ),
        ),
        //SHOW ERROR MESSAGE
        errorMessage != null
            ? Column(
                children: [
                  vSpace(5),
                  TextWidget(
                    errorMessage!,
                    size: 12,
                    color: AppTheme.errorTextColor,
                  ),
                ],
              )
            : const SizedBox(height:15)
      ],
    );
  }
}
