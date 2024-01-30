import 'dart:core';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/app_theme.dart';
import '../../shared/text_styles.dart';
import '../common.dart';
import '../text_widget.dart';

class DropDownWidget extends StatelessWidget {
  final String? hintText;
  final List<String>? items;
  final double? hintTextSize;
  final Color? hintTextColor;
  final double? itemTextSize;
  final Color? itemTextColor;
  final double? buttonStyleDataHeight;
  final double? buttonStyleDataWidth;
  final double? menuItemStyleDataHeight;
  final String? selectedValue;
  final Function(String)? onSubmitted;

  DropDownWidget(
      {Key? key,
      this.hintText,
      this.items,
      this.hintTextSize,
      this.hintTextColor,
      this.itemTextSize,
      this.itemTextColor,
      this.buttonStyleDataHeight,
      this.buttonStyleDataWidth,
      this.menuItemStyleDataHeight,
      this.selectedValue,
      this.onSubmitted
      })
      : super(key: key);

  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            hintText ?? '',
            style: TextStyle(
              fontSize: hintTextSize ?? 16,
              color: hintTextColor,
            ),
          ),
          //LIST OF ITEMS
          items: items
              ?.map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: itemTextSize ?? 16,
                        color: itemTextColor ?? AppTheme.textBlackColor,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            FocusScope.of(context).unfocus();
            print("-----------------------");
            print(value);
            if (value != null) {
              selectedValue ?? value;
              onSubmitted!(value!);
            }
          },
          //BUTTON STYLE
          buttonStyleData: ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppTheme.veryLightGrayColor,
              ),
              // color: Colors.redAccent,
            ),
            height: buttonStyleDataHeight ?? 45,
            width: buttonStyleDataWidth ?? 300,
          ),
          menuItemStyleData: MenuItemStyleData(
            height: menuItemStyleDataHeight ?? 40,
          ),
        ),
      ),
    ]);
  }
}
