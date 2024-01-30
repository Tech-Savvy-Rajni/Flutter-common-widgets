
import 'package:flutter/material.dart';
import '../../../utils/constants/app_theme.dart';
import '../../shared/text_styles.dart';
import '../common.dart';
import '../text_widget.dart';

class LabelPasswordTextfieldWidget extends StatefulWidget {
  final String label;
  final String? hintText;
  final String? errorMessage;
  final bool? isObscure;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String)? onSubmited;
  final Function()? onEditingComplete;
  final bool? readOnly;
  final Widget? suffixIcon;

  const LabelPasswordTextfieldWidget(
      {Key? key,
      required GlobalKey<FormState> formKey,
      required this.label,
      this.hintText,
      required this.errorMessage,
      required this.controller,
      required this.keyboardType,
      required this.onChanged,
      this.onTap,
      this.onSubmited,
      this.onEditingComplete,
      this.readOnly,
      this.suffixIcon,
      this.isObscure})
      : super(key: key);

  @override
  State<LabelPasswordTextfieldWidget> createState() =>
      _LabelPasswordTextfieldWidgetState();
}

class _LabelPasswordTextfieldWidgetState
    extends State<LabelPasswordTextfieldWidget> {
  bool isObscured = false;

  @override
  void initState() {
    isObscured = widget.isObscure ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          widget.label,
          color: AppTheme.textBlackColor,
          size: 14,
          weight: FontWeight.w300,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          readOnly: widget.readOnly ?? false,
          onTap: widget.onTap,
          onSubmitted: (val) {
            FocusScope.of(context).unfocus();
            if (widget.onSubmited != null) {
              widget.onSubmited!(val);
            }
          },
          onEditingComplete: widget.onEditingComplete,
          obscureText: isObscured,
          style: Styles.normalTextStyle(size: 14),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 25, maxWidth: 45),
            suffixIcon: (() {
              if (widget.suffixIcon != null) {
                return widget.suffixIcon;
              } else if (widget.isObscure != null) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscured = !isObscured;
                        });
                      },
                      child: Icon(
                        isObscured
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppTheme.textBlackColor,
                      )),
                );
              } else {
                return null;
              }
            }()),
            errorStyle: Styles.normalTextStyle(
              size: 13,
              color: AppTheme.errorTextColor,
            ),
            hintText: widget.hintText,
            hintStyle: Styles.normalTextStyle(
              color: AppTheme.textBlackColor.withOpacity(0.4),
              size: 13,
            ),
            focusedBorder: widget.errorMessage == null
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
            border: widget.errorMessage == null
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
            enabledBorder: widget.errorMessage == null
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
          ),
        ),
        widget.errorMessage != null
            ? Column(
                children: [
                  vSpace(5),
                  TextWidget(
                    widget.errorMessage!,
                    style: Styles.normalTextStyle(size: 12),
                  ),
                ],
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
