// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../utils/constants/app_theme.dart';
import '../text_widget.dart';

class AddTimeDelayButton extends StatefulWidget {
  //final Function(int) getTime;
  final Color? borderColor;
  final Color? textColor;
  final double? height;
  final double? width;
  //final bool isdisabled;
  int? time;
//  final bool disableTap;
  //final int? maxTime;
  final Color? buttonColor;

  AddTimeDelayButton(
      {Key? key,
     // required this.getTime,
      this.textColor,
      this.borderColor,
      this.height,
      this.width,
    //  this.isdisabled = false,
      this.time = 00,
    //  this.disableTap = false,
    //  this.maxTime,
      this.buttonColor})
      : super(key: key);

  @override
  AddTimeDelayButtonState createState() => AddTimeDelayButtonState();
}

class AddTimeDelayButtonState extends State<AddTimeDelayButton> {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
     // absorbing: widget.isdisabled,
      child: Container(
        height: widget.height ?? 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: widget.borderColor ?? AppTheme.redColor,
            )),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                // if (widget.disableTap) {
                //   toast('Please select any mandatory variation');
                // } else {
                //   if (widget.time! > 1) {
                //     setState(() {
                //       widget.time = widget.time! - 1;
                //     });
                //   } else {
                //     setState(() {
                //       widget.time = 0;
                //     });
                //   }
                //   widget.getTime(widget.time!);
                // }
              },
              child: Container(
                color: AppTheme.whiteColor,
                height: widget.height ?? 40 - 8,
                padding: const EdgeInsets.only(
                    right: 18, top: 5, bottom: 5, left: 8),
                child: Icon(
                  Icons.remove,
                  size: 15,
                  color: widget.buttonColor ?? AppTheme.redColor,
                ),
              ),
            ),
            SizedBox(
              width: widget.width ?? 25,
              child: Center(
                child: TextWidget(
                  widget.time!.toString().padLeft(2, '0'),
                  size: 16,
                  color: widget.textColor ?? AppTheme.redColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // if (widget.maxTime != null) {
                //   if (widget.time! < widget.maxTime!) {
                //     if (widget.disableTap) {
                //       // toast('Please select any mandatory variation');
                //     } else {
                //       setState(() {
                //         widget.time = widget.time! + 1;
                //       });
                //       widget.getTime(widget.time!);
                //     }
                //   } else {
                //     toast('Maximum delay time is 15 min');
                //   }
                // } else {
                //   if (widget.disableTap) {
                //     // toast('Please select any mandatory variation');
                //   } else {
                //     setState(() {
                //       widget.time = widget.time! + 1;
                //     });
                //     widget.getTime(widget.time!);
                //   }
                // }
              },
              child: Container(
                color: AppTheme.whiteColor,
                height: widget.height ?? 40 - 8,
                padding: const EdgeInsets.only(
                    left: 18, top: 5, bottom: 5, right: 8),
                child: Icon(
                  Icons.add,
                  size: 15,
                  color: widget.buttonColor ?? AppTheme.redColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
