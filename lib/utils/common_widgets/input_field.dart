import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/colors.dart';


class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String labelText;
  final String placeholder;
  final Color txtColor;
  final Color hintTextColor;
  final Color labelTextColor;
  final Color? fillColor;
  final EdgeInsets? contentPadding;
  final double txtFontSize;
  final int? maxLength;
  final double labelFontSize;
  final FontWeight labelFontWeight;
  final FontWeight txtFontWeight;
  final bool password;
  final bool readOnly;
  final bool isSpacingDisable;
  final List<TextInputFormatter>? filteringTextInputFormatter;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final VoidCallback? onTap;

   const InputField(
      {Key? key,
       this.controller,
      this.keyboardType = TextInputType.text,
      this.labelText = '',
      this.placeholder = '',
      this.txtColor = Colors.black,
      this.labelTextColor = Colors.white,
      this.fillColor,
      this.contentPadding,
      this.hintTextColor = Colors.black,
      this.txtFontSize = 14.0,
      this.maxLength,
      this.labelFontSize = 14.0,
      this.labelFontWeight = FontWeight.w500,
      this.txtFontWeight = FontWeight.w500,
      this.password = false,
      this.readOnly = false,
      this.isSpacingDisable = true,
      this.filteringTextInputFormatter,
      this.validator,
      this.onChange,
      this.onTap,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength:maxLength ,
      inputFormatters: filteringTextInputFormatter!=null? filteringTextInputFormatter!: isSpacingDisable?[FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))]:[],
      decoration: InputDecoration(
          counterText: "",
          contentPadding:contentPadding??
              const EdgeInsets.only(left: 8.0, bottom: 12.0, top: 15.0),

          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color:  Colors.grey)),

          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color:  Colors.grey.shade300,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          ),
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText.isNotEmpty ? labelText : null,
          labelStyle: TextStyle(
            fontFamily: "Poppins",
            fontSize: labelFontSize,
            overflow: TextOverflow.ellipsis,

            color: labelTextColor,
            height: 1.2,
            fontWeight: FontWeight.w500,
          ),
          hintText: placeholder,
          hintStyle: TextStyle(
            fontFamily: "Poppins",
            fontSize: txtFontSize,
            color: AppTheme.txtColor.withOpacity(0.5),
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400,
          ),
          isDense: true,
          suffixIcon: suffixIcon),
      onChanged: onChange,
      controller: controller,
      onTap: onTap,
      style: TextStyle(
        color: txtColor,
        fontFamily: "Poppins",
        fontSize: txtFontSize,
overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w400,
      ),
      keyboardType: keyboardType,
      obscureText: password,
      cursorHeight: 18,
      cursorColor: Colors.grey,
      autocorrect: false,
      validator: validator,
      readOnly: readOnly,

    );

  }
}


