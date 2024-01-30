import 'package:flutter/material.dart';
import '../../utils/constants/app_theme.dart';
import 'styles.dart';
import 'text_widget.dart';

class CentertTextDivider extends StatelessWidget {
  final String text;
  const CentertTextDivider({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: AppTheme.borderColor,
          ),
        ),
        const SizedBox(width: 5),
        TextWidget(
          text,
          style: Styles.regularTextStyle(size: 16),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Container(
            height: 1,
            color: AppTheme.borderColor,
          ),
        )
      ],
    );
  }
}
