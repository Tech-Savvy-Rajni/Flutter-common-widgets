import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../utils/constants/app_theme.dart';
import '../common.dart';
import '../text_widget.dart';

class RadioListtileWidget extends StatefulWidget {
  final String value;
  final bool? isSelected;
  final String groupValue;
  final String? titleText;
  final String? trailingText;
  final bool? isEnable;
  final Function(String) onChange;
  final Color? borderColor;
  final IconData? tickIcon;

  const RadioListtileWidget(
      {Key? key,
      required this.value,
      this.isSelected,
      required this.groupValue,
      this.titleText,
      this.trailingText,
      this.isEnable = false,
      required this.onChange,
      this.borderColor,
      this.tickIcon})
      : super(key: key);

  @override
  RadioListtileWidgetState createState() => RadioListtileWidgetState();
}

class RadioListtileWidgetState extends State<RadioListtileWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChange(widget.value);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  child: Container(
                    height: 20,
                    width: 20,
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                            color: widget.isSelected ?? false
                                ? widget.borderColor ??
                                    vendorThemeColor ??
                                    AppTheme.redColor
                                : AppTheme.textBlackColor,
                            width: 1)),
                    child: widget.isSelected ?? false
                        ? Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: widget.borderColor ??
                                  vendorThemeColor ??
                                  AppTheme.redColor,
                            ),
                            child: const Icon(Icons.check,
                                size: 15, color: AppTheme.whiteColor),
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
                hSpace(10),
                widget.titleText != null
                    ? TextWidget(widget.titleText!,
                        size: 14,overflow:TextOverflow.ellipsis ,
                        weight: widget.isSelected ?? false
                            ? FontWeight.w600
                            : FontWeight.w400)
                    : const SizedBox.shrink(),
              ],
            ),
            widget.trailingText != null
                ? TextWidget(
                    widget.trailingText!,
                    size: 14,
                    weight: widget.isSelected ?? false
                        ? FontWeight.w600
                        : FontWeight.w400,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class RadioListtileWidget2 extends StatefulWidget {
  final bool? isSelected;
  final String? titleText;
  final String? trailingText;
  final Color? borderColor;

  const RadioListtileWidget2(
      {Key? key,
      this.isSelected,
      this.titleText,
      this.trailingText,
      this.borderColor})
      : super(key: key);

  @override
  RadioListtileWidget2State createState() => RadioListtileWidget2State();
}

class RadioListtileWidget2State extends State<RadioListtileWidget2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                height: 20,
                width: 20,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: widget.isSelected ?? false
                            ? widget.borderColor ??
                                vendorThemeColor ??
                                AppTheme.redColor
                            : AppTheme.textBlackColor,
                        width: 1)),
                child: widget.isSelected ?? false
                    ? Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.borderColor ??
                                vendorThemeColor ??
                                AppTheme.redColor),
                      )
                    : const SizedBox.shrink(),
              ),
              hSpace(10),
              widget.titleText != null
                  ? TextWidget(
                      widget.titleText!,
                      size: 14,
                      weight: widget.isSelected ?? false
                          ? FontWeight.w600
                          : FontWeight.w400,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          widget.trailingText != null
              ? TextWidget(
                  widget.trailingText!,
                  size: 14,
                  weight: widget.isSelected ?? false
                      ? FontWeight.w600
                      : FontWeight.w400,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
