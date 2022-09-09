import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_text_styles.dart';

class CardService extends StatelessWidget {
  final String title;
  final String description;
  final String pngImagePath;
  final void Function()? onTap;
  final double heightImage;
  final double widthImage;

  const CardService({
    Key? key,
    required this.title,
    required this.description,
    required this.pngImagePath,
    required this.onTap,
    this.heightImage = 43,
    this.widthImage = 43,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 129,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          gradient: LinearGradient(
            colors: AppColors.gradientColor,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 24,
              left: 58,
              child: Text(
                title,
                style: AppTextStyles.textBold20.cl(AppColors.white),
              ),
            ),
            Positioned(
              bottom: 24,
              left: 28,
              child: Text(
                description,
                style: AppTextStyles.textRegular14.cl(AppColors.white),
              ),
            ),
            Positioned(
              right: 40,
              top: 43,
              child: Image.asset(
                pngImagePath,
                height: heightImage,
                width: widthImage,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
