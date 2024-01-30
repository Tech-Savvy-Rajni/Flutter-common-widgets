import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {


  final CrossAxisAlignment crossAxisAlignment;
  final Color color;
  final Color borderColor;
  final Widget child;
  const MessageBox({Key? key,
    required this.crossAxisAlignment,
    required this.color,
    required this.child, required this.borderColor}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Container(
          constraints: const BoxConstraints(minHeight: 10, minWidth: 100,),

          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: borderColor, blurRadius: 1,offset: Offset.zero)],
              color: color,
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: child,
        ),
        ClipPath(

          clipper: crossAxisAlignment==CrossAxisAlignment.end?UserMessageClipper():AnswerMessageClipper(),
          child: Material(
            color: borderColor,
            child: Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              color: color,
            ),
          ),
        )
      ],
    );
  }
}



class UserMessageClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {

    var firstOffset = Offset(size.width * 0.94, 0.0);
    var secondPoint = Offset(size.width * 0.91, size.height);
    var lastPoint = Offset(size.width * 0.87, 0.0);
    var path = Path()
      ..moveTo(firstOffset.dx, firstOffset.dy)
      ..lineTo(secondPoint.dx, secondPoint.dy)
      ..lineTo(lastPoint.dx, lastPoint.dy)
      ..close();


    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

    return true;
  }

}
class AnswerMessageClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {

    var firstOffset = Offset(size.width * 0.14, 0.0);
    var secondPoint = Offset(size.width * 0.10, size.height*0.99 );
    var lastPoint = Offset(size.width * 0.06, 0.0
    );
    var path = Path()
      ..moveTo(firstOffset.dx, firstOffset.dy)
      ..lineTo(secondPoint.dx, secondPoint.dy)
      ..lineTo(lastPoint.dx, lastPoint.dy)
      ..close();


    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

    return true;
  }

}
