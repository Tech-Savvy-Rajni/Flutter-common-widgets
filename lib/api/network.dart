import 'dart:io';
import 'package:flutter/material.dart';

import '../utils/common_widgets/styles.dart';
class Utility {
  static Future<bool> checkNetwork() async {
    bool isConnected = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (_) {
      isConnected = false;
    }
    return isConnected;
  }
}

void showSnackBar({
  String? message,
  int milliSec = 1500,
  required BuildContext? context,
  VoidCallback? callback,
}) {
  if (context != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: milliSec),
        content: Text(
          message ?? "",
          style: Styles.mediumTextStyle(color: Colors.white),
        ),
        action: message!.contains("internet")
            ? SnackBarAction(
                onPressed: callback!,
                label: 're try',
              )
            : null,
        backgroundColor: Colors.black.withOpacity(0.7),
      ),
    );
  }
}
