import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  //REGULAR 14
  static const TextStyle textRegular14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.labelText,
    fontFamily: 'TitilliumWeb',
  );
  //REGULAR 16
  static const TextStyle textRegular16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.labelText,
    fontFamily: 'TitilliumWeb',
  );
  //REGULAR 18
  static const TextStyle textRegular18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.labelText,
    fontFamily: 'TitilliumWeb',
  );
  //REGULAR 20
  static const TextStyle textRegular20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.labelText,
    fontFamily: 'TitilliumWeb',
  );

  //TEXT BOLD 14
  static const TextStyle textBold14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.labelText,
    fontFamily: 'TitilliumWeb',
  );
  //TEXT BOLD 16
  static const TextStyle textBold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.labelText,
    fontFamily: 'TitilliumWeb',
  );
  //TEXT BOLD 18
  static const TextStyle textBold18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.labelText,
    fontFamily: 'TitilliumWeb',
  );
  //TEXT BOLD 20
  static const TextStyle textBold20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.labelText,
    fontFamily: 'TitilliumWeb',
  );
}

extension TxTheme on TextStyle {
  /// set fontSize to [fontSize]
  TextStyle fs(double fontSize) => copyWith(fontSize: fontSize);

  /// set Color to [color]
  TextStyle cl(Color color) => copyWith(color: color);
}
