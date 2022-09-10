import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muvver_app/app/ui/themes/app_text_styles.dart';
import '../../../themes/app_colors.dart';
import '../../../widgets/button/button_custom_widget.dart';
import '../../../widgets/text_form_field/text_form_field_custom_widget.dart';

class AddPoint extends StatelessWidget {
  const AddPoint({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    TextEditingController _cityController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close,
            color: AppColors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: AppColors.gradientColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ponto intermediário",
                style: AppTextStyles.textBold14,
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Insira os pontos intermediários na ',
                  style: AppTextStyles.textRegular16.cl(AppColors.labelText2),
                  children: [
                    const TextSpan(
                      text: 'sequencia exata',
                      style: AppTextStyles.textBold16,
                    ),
                    TextSpan(
                      text: ' em que você passará por eles',
                      style:
                          AppTextStyles.textRegular16.cl(AppColors.labelText2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              TextFormFieldCustom(
                controller: _cityController,
                textInputType: TextInputType.name,
                labelText: "Nome da cidade",
              ),
              Spacer(),
              ButtonCustom(
                height: 48,
                borderRadius: 3,
                width: double.infinity,
                title: "Confirmar",
                style: ButtonCustomStyle.primary,
                onPressed: () => Navigator.pop(
                  context,
                  _cityController.text.trim(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
