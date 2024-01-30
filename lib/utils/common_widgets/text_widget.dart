import 'package:flutter/material.dart';
import '../../utils/constants/app_assets.dart';
import '../../utils/constants/app_theme.dart';

class TextWidget extends StatefulWidget {
  final double? size;
  final String data;
  final Color? color;
  final FontWeight? weight;
  final bool? italic;
  final bool? centerAlign;
  final TextDecoration? decoration;
  final String? fontFamily;
  final double? height;
  final TextOverflow? overflow;
  final int? maxlines;
  final TextStyle? style;
  final void Function()? onTap;

  const TextWidget(this.data,
      {Key? key,
      this.size = 15,
      this.color,
      this.weight,
      this.decoration,
      this.italic,
      this.centerAlign,
      this.fontFamily,
      this.height,
      this.overflow,
      this.maxlines,
      this.style,
      this.onTap
      })
      : super(key: key);

  @override
  TextWidgetState createState() => TextWidgetState();
}

class TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Text(
        widget.data,
        textAlign: widget.centerAlign == null ? TextAlign.left : TextAlign.center,
        overflow: widget.overflow,
        maxLines: widget.maxlines,softWrap: true,
        style: widget.style ??
            TextStyle(
                height: widget.height,
                fontSize: widget.size??15,overflow: TextOverflow.ellipsis,
                color: widget.color ?? AppTheme.textBlackColor,
                fontWeight: widget.weight ?? FontWeight.normal,
                fontFamily: proximaNova,
                fontStyle:
                    widget.italic == null ? FontStyle.normal : FontStyle.italic,
                decoration: widget.decoration ?? TextDecoration.none),
      ),
    );
  }
}
