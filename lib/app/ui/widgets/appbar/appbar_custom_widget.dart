import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muvver_app/app/ui/themes/app_text_styles.dart';

import '../../themes/app_colors.dart';

class AppbarCustom extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final String descrition;

  const AppbarCustom({
    Key? key,
    required this.title,
    required this.descrition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.primary,
      leading: GestureDetector(
        /// or use Get.back()
        onTap: () => Navigator.pop(context),
        child: Container(
          color: Colors.transparent,
          child: const Icon(
            Icons.close,
            color: AppColors.white,
            size: 24,
          ),
        ),
      ),
      title: Text(
        title,
        style: AppTextStyles.textRegular16.cl(AppColors.white),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: AppColors.gradientColor,
          ),
        ),
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(16),
        child: Text(
          descrition,
          style: AppTextStyles.textRegular20.cl(AppColors.white),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(141);
  //kToolbarHeight
}
