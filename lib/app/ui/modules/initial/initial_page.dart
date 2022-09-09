import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_images.dart';
import '../../themes/app_text_styles.dart';
import 'initial_controller.dart';
import 'widgets/card_service_widget.dart';

class InitialPage extends GetView<InitialController> {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: _buildItemsNavigationBar(),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedLabelStyle:
            AppTextStyles.textRegular14.fs(10).cl(AppColors.iconBottomColor),
        selectedLabelStyle:
            AppTextStyles.textRegular14.fs(10).cl(AppColors.iconBottomColor),
        backgroundColor: AppColors.primary,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    AppImages.logo,
                    height: 15,
                    width: 80,
                    color: AppColors.black,
                  ),
                  Image.network(
                    AppImages.photoAvatar,
                    height: 32,
                    width: 32,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(height: 48),
              RichText(
                text: const TextSpan(
                  text: 'Facilitando seus ',
                  style: AppTextStyles.textRegular20,
                  children: [
                    TextSpan(
                      text: 'envios.',
                      style: AppTextStyles.textBold20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Entregue ou envie",
                style: AppTextStyles.textRegular16.cl(AppColors.labelText2),
              ),
              const SizedBox(height: 40),
              const CardService(
                title: "Remetente",
                description: "Para onde quer enviar seu\nobjeto?",
                pngImagePath: AppImages.icBox,
                onTap: null,
              ),
              const SizedBox(height: 24),
              CardService(
                title: "Viajante",
                description: "Vai viajar para onde?",
                pngImagePath: AppImages.deliveryTruck,
                onTap: () => controller.goToNextPage(),
                heightImage: 30,
                widthImage: 53,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildItemsNavigationBar() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home, color: AppColors.iconBottomColor),
        label: "Início",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.notifications, color: AppColors.iconBottomColor),
        label: "Notificações",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.chat_bubble, color: AppColors.iconBottomColor),
        label: "Chat",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.chat_bubble, color: AppColors.iconBottomColor),
        label: "Pedidos",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.drive_eta, color: AppColors.iconBottomColor),
        label: "Entregas",
      ),
    ];
  }
}
