import 'package:flutter/material.dart';
import 'package:muvver_app/app/ui/themes/app_text_styles.dart';

import '../../themes/app_colors.dart';

class AppbarCustom extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final String descrition;
  final bool hasTabMenu;
  final IconData iconLeading;

  const AppbarCustom({
    Key? key,
    required this.title,
    required this.descrition,
    this.hasTabMenu = false,
    this.iconLeading = Icons.close,
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
          child: Icon(
            iconLeading,
            color: AppColors.white,
            size: 24,
          ),
        ),
      ),
      title: Text(
        title,
        style: AppTextStyles.textRegular16.cl(AppColors.white),
      ),
      bottom: hasTabMenu
          ? TabBar(
              tabs: [
                Tab(
                  height: 37,
                  child: Text(
                    "Rotas",
                    style: AppTextStyles.textBold14.cl(AppColors.white),
                  ),
                ),
                Tab(
                  height: 37,
                  child: Text(
                    "Mapa",
                    style: AppTextStyles.textBold14.cl(AppColors.white),
                  ),
                ),
              ],
            )
          : null,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: AppColors.gradientColor,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!hasTabMenu) const SizedBox(height: kToolbarHeight),
            Text(
              descrition,
              style: AppTextStyles.textRegular20.cl(AppColors.white),
            ),
            if (hasTabMenu) const SizedBox(height: 37),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(141);
  //kToolbarHeight
}
