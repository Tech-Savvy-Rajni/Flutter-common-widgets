import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../utils/constants/app_theme.dart';
import '../common.dart';
import '../text_widget.dart';

class MultiSelectRadioListtileWidget extends StatefulWidget {
  final String? titleText;
  final String? trailingText;
  final bool? isSelected;
  final bool? isEnable;
  final Function(bool) onChange;
  final bool disableTap;
  final Color? color;

  const MultiSelectRadioListtileWidget(
      {Key? key,
      this.titleText,
      this.trailingText,
        this.isSelected,
      this.isEnable = false,
      this.disableTap = false,
      required this.onChange,
      this.color})
      : super(key: key);

  @override
  MultiSelectRadioListtileWidgetState createState() =>
      MultiSelectRadioListtileWidgetState();
}

class MultiSelectRadioListtileWidgetState
    extends State<MultiSelectRadioListtileWidget> {
  bool isEnabled = false;

  @override
  void initState() {
    setState(() {
      isEnabled = widget.isEnable ?? false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.disableTap) {
          toast('Please select any mandatory variation');
        } else {
          setState(() {
            isEnabled = !isEnabled;
          });
          widget.onChange(isEnabled);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              ? vendorThemeColor ?? AppTheme.redColor
                              : AppTheme.textBlackColor,
                          width: 1)),
                  child: isEnabled
                      ? Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: vendorThemeColor ?? AppTheme.redColor),
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
                    weight:
                        widget.isEnable! ? FontWeight.w600 : FontWeight.w400,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
