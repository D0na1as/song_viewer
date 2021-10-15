
import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primarySwatch: AppColors.accentMaterialColor,
    primaryColor: AppColors.accentMaterialColor[500],
    primaryColorBrightness: Brightness.light,
    backgroundColor: AppColors.backgroundColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
  );
}