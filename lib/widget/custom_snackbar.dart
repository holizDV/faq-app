import 'package:flutter/material.dart';

import '../core/manager/font_manager.dart';

class CustomSnackbar {
  CustomSnackbar._();

  static showError(BuildContext context, String message) {
    final snackbar = SnackBar(
      content: Text(
        message,
        style: Typograph.label14m.copyWith(color: Colors.white),
      ),
      backgroundColor: Colors.redAccent,
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}
