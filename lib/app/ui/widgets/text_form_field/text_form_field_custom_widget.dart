import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class TextFormFieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String labelText;
  final bool hasIcon;

  const TextFormFieldCustom({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.labelText,
    this.hasIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      maxLines: 1,
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.labelText,
        fontFamily: 'TitilliumWeb',
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        prefixIcon: hasIcon
            ? const Icon(
                Icons.search,
                color: AppColors.labelText,
              )
            : null,
        labelStyle: const TextStyle(
          color: AppColors.labelText2,
          fontSize: 14,
          fontFamily: 'TitilliumWeb',
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.border,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.primary,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
}
