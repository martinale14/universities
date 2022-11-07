import 'package:flutter/material.dart';
import 'package:universities/core/utils/app_colors.dart';

final defaultTheme = ThemeData();

final theme = ThemeData(
  primaryColor: AppColors.primary,
  primaryColorDark: AppColors.primary,
  brightness: Brightness.light,
  backgroundColor: AppColors.background,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: 'Montserrat',
  colorScheme: defaultTheme.colorScheme.copyWith(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    selectionColor: AppColors.primary,
    cursorColor: AppColors.primary,
    selectionHandleColor: AppColors.primary,
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(color: Colors.black),
    toolbarTextStyle: TextStyle(color: Colors.black),
    backgroundColor: AppColors.background,
    foregroundColor: Colors.black,
  ),
);
