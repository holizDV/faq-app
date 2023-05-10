import 'dart:async';

import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/config/config.dart';

void main() => Main();

class Main extends Env {
  @override
  FutureOr<StatelessWidget> onCreate() {
    ErrorWidget.builder = (details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return const SizedBox.shrink();
    };
    return MyApp();
  }
}
