import 'package:flutter/material.dart';
import 'package:moneta_note/core/theme/app_colors.dart';
import 'package:moneta_note/core/theme/app_text_styles.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    secondary: AppColors.secondary,
    onSecondary: AppColors.textPrimary,
    error: Colors.red,
    onError: Colors.white,
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.background,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: AppColors.textPrimary,
      fontSize: AppTextTitle.fontSize,
    ),
  ),
  bottomAppBarTheme: BottomAppBarThemeData(
    shape: CircularNotchedRectangle(),
    shadowColor: Color.fromARGB(20, 0, 0, 0),
  ),
  cardTheme: CardThemeData(
    color: AppColors.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
    ),
    shadowColor: Color.fromARGB(20, 0, 0, 0),
  ),
  textTheme: TextTheme(
    titleMedium: TextStyle(
      fontSize: AppTextTitle.fontSize,
      fontWeight: AppTextTitle.fontWeight,
    ),
    bodyMedium: TextStyle(
      fontSize: AppTextBody.fontSize,
      fontWeight: AppTextBody.fontWeight,
    ),
    bodySmall: TextStyle(
      fontSize: AppTextCaption.fontSize,
      color: AppTextCaption.fontColor,
    ),
  ),
);
