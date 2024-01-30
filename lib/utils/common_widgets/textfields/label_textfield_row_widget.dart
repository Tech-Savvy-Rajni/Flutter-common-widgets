import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/constants/app_theme.dart';
import '../../shared/text_styles.dart';
import '../common.dart';
import '../text_widget.dart';

class LabelTextFieldRowWidget extends StatelessWidget {
  final String label;
  final String? hintText;
  final String? errorMessage;
  final bool? isObscure;
  final TextEditingController controller;

  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String)? onSubmited;
  final Function()? onEditingComplete;
  final bool? readOnly;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;

  const LabelTextFieldRowWidget(
      {Key? key,
      required GlobalKey<FormState> formKey,
      required this.label,
      this.hintText,
      this.errorMessage,
      required this.controller,
      this.keyboardType,
      this.onChanged,
      this.onTap,
      this.onSubmited,
      this.onEditingComplete,
      this.readOnly,
      this.suffixIcon,
      this.isObscure,
      this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: errorMessage == null ? 50 : 78,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                label,
                centerAlign: true,
                style: Styles.normalTextStyle(),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  TextField(
                    controller: controller,
                    keyboardType: keyboardType,
                    onChanged: onChanged,
                    readOnly: readOnly ?? false,
                    onTap: onTap,
                    inputFormatters: inputFormatters,
                    onSubmitted: (val) {
                      FocusScope.of(context).unfocus();
                      if (onSubmited != null) {
                        onSubmited!(val);
                      }
                    },
                    onEditingComplete: onEditingComplete,
                    obscureText: isObscure ?? false,
                    style: Styles.normalTextStyle(
                      size: 14,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 20, top: 10, bottom: 10, right: 20),
                      suffixIconConstraints:
                          const BoxConstraints(maxHeight: 50, maxWidth: 65),
                      suffixIcon: suffixIcon,
                      // errorText: errorMessage,
                      errorStyle: Styles.normalTextStyle(
                        size: 13,
                        color: AppTheme.errorTextColor,
                      ),

                      hintText: hintText,
                      hintStyle: Styles.normalTextStyle(
                        size: 13,
                        color: AppTheme.borderColor,
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
                        borderSide: const BorderSide(
                            width: 1, color: AppTheme.errorTextColor),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          width: 1,
                          color: AppTheme.borderColor,
                        ),
                      ),
                    ),
                  ),
                  errorMessage != null
                      ? Expanded(
                          child: Column(
                            children: [
                              vSpace(2),
                              TextWidget(
                                errorMessage!,
                                size: 12,
                                color: AppTheme.errorTextColor,
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
