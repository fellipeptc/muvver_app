import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_images.dart';
import '../../../themes/app_text_styles.dart';

class MidPointItem extends StatelessWidget {
  final String city;
  final bool hasCloseButton;
  final void Function()? onTap;

  const MidPointItem({
    Key? key,
    required this.city,
    this.hasCloseButton = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Image.asset(
            AppImages.pointerSpot,
            height: 22,
            width: 14,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Text(
            city,
            style: AppTextStyles.textRegular14.cl(AppColors.labelText2),
          ),
          if (hasCloseButton) const Spacer(),
          if (hasCloseButton)
            GestureDetector(
              onTap: onTap,
              child: Container(
                color: Colors.transparent,
                child: const Icon(
                  Icons.close,
                  color: AppColors.labelText2,
                  size: 22,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
