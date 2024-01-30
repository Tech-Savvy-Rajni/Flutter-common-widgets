import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/app_theme.dart';
import '../../shared/text_styles.dart';
import '../common.dart';
import '../text_widget.dart';

class LabelTextFieldWidget extends StatelessWidget {
  final String label;
  final String? hintText;
  final String? errorMessage;
  final bool? isObscure;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final Function()? onEditingComplete;
  final bool? readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final int? maxLines;
  final FontWeight? labelFontWeight;
  final double? labelTextFieldSpacing;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;

  const LabelTextFieldWidget({
    Key? key,
    GlobalKey<FormState>? formKey,
    required this.label,
    this.hintText,
    this.errorMessage,
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
    this.isObscure,
    this.maxLines,
    this.labelFontWeight,
    this.labelTextFieldSpacing,
    this.textCapitalization,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          label,
          color: AppTheme.textBlackColor,
          size: 14,
          weight: labelFontWeight ?? FontWeight.w300,
        ),
        vSpace(labelTextFieldSpacing ?? 5),
        TextField(
          maxLines: maxLines,
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          readOnly: readOnly ?? false,
          onTap: onTap,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          inputFormatters: inputFormatters,
          onSubmitted: (val) {
            FocusScope.of(context).unfocus();
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
            contentPadding:
                const EdgeInsets.only(left: 20, top: 20, bottom: 0, right: 20),
            // errorText: errorMessage,

            suffixIconConstraints:
                const BoxConstraints(maxHeight: 50, maxWidth: 65),
            suffixIcon: suffixIcon,
            errorStyle: Styles.normalTextStyle(
              size: 13,
              color: AppTheme.errorTextColor,
            ),
            hintText: hintText,
            hintStyle: Styles.regularTextStyle(
              size: 14,
              color: AppTheme.textBlackColor.withOpacity(0.4),
            ),
            focusedBorder: errorMessage == null
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppTheme.borderColor,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                        width: 1, color: AppTheme.errorTextColor),
                  ),
            border: errorMessage == null
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppTheme.borderColor,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                        width: 1, color: AppTheme.errorTextColor),
                  ),
            enabledBorder: errorMessage == null
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppTheme.borderColor,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                        width: 1, color: AppTheme.errorTextColor),
                  ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide:
                  const BorderSide(width: 1, color: AppTheme.errorTextColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                width: 1,
                color: AppTheme.borderColor,
              ),
            ),
            prefixIconConstraints: prefixIconConstraints,
            prefixIcon: prefixIcon,
          ),
        ),
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
            : const SizedBox.shrink()
      ],
    );
  }
}
