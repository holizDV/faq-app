import 'package:flutter/material.dart';

import 'color_manager.dart';

abstract class FontFamily {
  static const String poppins = 'Poppins';
}

abstract class AppFontWeight {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

abstract class FontSize {
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s28 = 28.0;
  static const double s40 = 40.0;
}

abstract class Typograph {
  static TextStyle headline5 = const TextStyle(
    color: AppColors.text,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s24,
    fontWeight: AppFontWeight.bold,
    height: 32.0 / FontSize.s24,
  );

  static TextStyle headline6 = const TextStyle(
    color: AppColors.text,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s18,
    fontWeight: AppFontWeight.bold,
    height: 30.0 / FontSize.s18,
  );

  static TextStyle subtitle18m = const TextStyle(
    color: AppColors.text,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s18,
    fontWeight: AppFontWeight.semiBold,
    height: 28.0 / FontSize.s18,
  );

  static TextStyle subtitle16m = const TextStyle(
    color: AppColors.text,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s16,
    fontWeight: AppFontWeight.semiBold,
    height: 22.0 / FontSize.s16,
  );

  static TextStyle subtitle14m = const TextStyle(
    color: AppColors.text,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s14,
    fontWeight: AppFontWeight.semiBold,
    height: 20.0 / FontSize.s14,
  );

  static TextStyle label20m = const TextStyle(
    color: AppColors.text,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s20,
    fontWeight: AppFontWeight.medium,
    height: 32.0 / FontSize.s20,
  );

  static TextStyle label18m = const TextStyle(
    color: AppColors.text,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s18,
    fontWeight: AppFontWeight.medium,
    height: 28.0 / FontSize.s18,
  );

  static TextStyle label16m = const TextStyle(
    color: AppColors.text,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s16,
    fontWeight: AppFontWeight.medium,
    height: 24.0 / FontSize.s16,
  );

  static TextStyle label14m = const TextStyle(
    color: AppColors.text,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s14,
    fontWeight: AppFontWeight.medium,
    height: 20.0 / FontSize.s14,
  );

  static TextStyle label12m = const TextStyle(
    color: AppColors.text,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s12,
    fontWeight: AppFontWeight.medium,
    height: 16.0 / FontSize.s12,
  );

  static TextStyle label10m = const TextStyle(
    color: AppColors.text,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s10,
    fontWeight: AppFontWeight.medium,
    height: 14.0 / FontSize.s10,
  );
}
