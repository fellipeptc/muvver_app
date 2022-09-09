import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

final ThemeData appThemeData = ThemeData(
  fontFamily: 'TitilliumWeb',
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      color: AppColors.black,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'TitilliumWeb',
    ),
  ),
  scaffoldBackgroundColor: AppColors.white,
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: AppTextStyles.textRegular14,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.border,
      ),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.primary, //thereby
  ),
);
