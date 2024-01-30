// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import '../../../utils/constants/app_theme.dart';
import '../common.dart';
import '../text_widget.dart';

class AddItemButton extends StatefulWidget {
  // final String isAlcoholic;
  // final Color? color;
  // final Function(int) onTap;
  // final Function(int) onAddTap;
  // final Function(int) onSubtractTap;
  // int? quantity;

  AddItemButton(
       {Key? key}
      // required this.isAlcoholic,
      // this.color,
      // required this.onTap,
      // required this.onAddTap,
      // required this.onSubtractTap,
      // this.quantity = 0}
      )
      : super(key: key);

  @override
  AddItemButtonState createState() => AddItemButtonState();
}

class AddItemButtonState extends State<AddItemButton> {
  @override
  Widget build(BuildContext context) {
    return
      // widget.quantity! > 0
      //   ? addQuantity()
      //   :
      GestureDetector(
            onTap: () {
            //  widget.onTap(1);
            },
            child: Container(
              width: 90,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color:
                  //widget.color ??
                      AppTheme.redColor),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TextWidget(
                      'Add',
                      size: 16,
                      color: AppTheme.whiteColor,
                    ),
                    hSpace(10),
                    const Icon(
                      Icons.add,
                      color: AppTheme.whiteColor,
                      size: 17,
                    )
                  ]),
            ),
          );
  }

  Widget addQuantity() {
    return Container(
      height: 40,
      // width: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppTheme.redColor)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              // if (widget.quantity! > 1) {
              //   setState(() {
              //     widget.quantity = widget.quantity! - 1;
              //   });
              // } else {
              //   setState(() {
              //     widget.quantity = 0;
              //   });
              // }
              //
              // widget.onSubtractTap(widget.quantity!);
            },
            child: Container(
              color: AppTheme.whiteColor,
              height: 40 - 8,
              padding:
                  const EdgeInsets.only(right: 18, top: 5, bottom: 5, left: 8),
              child: const Icon(
                Icons.remove,
                size: 22,
                color: AppTheme.redColor,
              ),
            ),
          ),
          const SizedBox(
            width: 30,
            child: Center(
              child: TextWidget(
                "Haha",
              //  widget.quantity!.toString(),
                size: 16,
                color: AppTheme.redColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // log('Is isAlcoholic ${widget.isAlcoholic.toLowerCase()}');
              // if (widget.isAlcoholic.toLowerCase() == 'y' &&
              //     widget.quantity! >= 2) {
              //   toast('Max limit reached');
              // } else {
              //   widget.onSubtractTap(widget.quantity!);
              //
              //   setState(() {
              //     widget.quantity = widget.quantity! + 1;
              //   });
              //   widget.onAddTap(widget.quantity!);
              // }
            },
            child: Container(
              color: AppTheme.whiteColor,
              height: 40 - 8,
              padding:
                  const EdgeInsets.only(left: 18, top: 5, bottom: 5, right: 8),
              child: const Icon(
                Icons.add,
                size: 25,
                color: AppTheme.redColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
