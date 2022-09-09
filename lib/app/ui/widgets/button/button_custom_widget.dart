import 'package:flutter/material.dart';
import 'package:muvver_app/app/ui/themes/app_text_styles.dart';

import '../../themes/app_colors.dart';

class ButtonCustomStyle {
  static final primary = ButtonCustomStyle(
    backgroundColor: AppColors.primary,
    titleColor: AppColors.white,
    fontSize: 16,
    rippleColor: AppColors.white,
  );

  final Color backgroundColor;
  final Color titleColor;
  final double fontSize;
  final Color borderColor;
  final Color rippleColor;

  ButtonCustomStyle({
    required this.backgroundColor,
    required this.titleColor,
    required this.fontSize,
    required this.rippleColor,
    this.borderColor = Colors.white,
  });
}

class ButtonCustom extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final ButtonCustomStyle style;
  final void Function()? onPressed;
  final EdgeInsets? padding;
  final bool border;
  final double? borderRadius;
  final double? borderWidth;
  final bool disabled;
  final FocusNode? focusNode;
  final bool? hasIcon;
  final IconData? iconButton;

  const ButtonCustom({
    Key? key,
    required this.height,
    required this.width,
    required this.title,
    required this.style,
    required this.onPressed,
    this.padding,
    this.border = false,
    this.borderRadius,
    this.borderWidth,
    this.disabled = false,
    this.focusNode,
    this.hasIcon,
    this.iconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        focusNode: focusNode,
        onPressed: disabled ? null : onPressed,
        style: TextButton.styleFrom(
          elevation: 1,
          primary: style.rippleColor,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: disabled
              ? style.backgroundColor.withOpacity(0.5)
              : style.backgroundColor,
          shape: border
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 3),
                  side: BorderSide(
                    color: style.borderColor,
                    width: borderWidth ?? 1,
                  ),
                )
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 3),
                ),
        ),
        child: hasIcon == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: style.fontSize,
                      fontWeight: FontWeight.w400,
                      color: style.titleColor,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    iconButton ?? Icons.arrow_forward,
                    color: style.titleColor,
                  ),
                ],
              )
            : Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.textBold14
                    .cl(style.titleColor)
                    .fs(style.fontSize),
              ),
      ),
    );
  }
}
