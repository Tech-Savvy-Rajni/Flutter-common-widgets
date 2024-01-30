import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
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
  final InputDecoration? decoration;

  const TextFieldWidget({
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
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Text Field");
  }
}
