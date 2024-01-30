import 'package:flutter/material.dart';

class GenericBottomSheet extends StatelessWidget {
  final Widget child;
  final VoidCallback onClose;

  const GenericBottomSheet(
      {super.key, required this.child, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose,
      child: Container(
        color: Colors.transparent,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> openBottomSheet(BuildContext context, Widget child) async {
  await showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return GenericBottomSheet(
        child: child,
        onClose: () {
          Navigator.pop(context);
        },
      );
    },
  );
}
