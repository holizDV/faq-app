import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: AppColors.background,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(AppSize.zero),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.blue[200],
        disabledBackgroundColor: Colors.grey,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
      ),
    ),
  );
}
