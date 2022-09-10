import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muvver_app/app/ui/modules/travel_path/widgets/mid_point_item_widget.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_text_styles.dart';
import '../../../widgets/button/button_custom_widget.dart';
import '../../../widgets/text_form_field/date_time_picker_custom_widget.dart';
import '../../../widgets/text_form_field/text_form_field_custom_widget.dart';
import '../travel_path_controller.dart';

class RouteTabPage extends GetView<TravelPathController> {
  const RouteTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Selecione a data e rota da sua viagem",
                      style: AppTextStyles.textBold16,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DateTimePickerCustom(
                          labelText: "Data de partida",
                          width: Get.mediaQuery.size.width * 0.42,
                          controller: controller.dateInitial,
                        ),
                        DateTimePickerCustom(
                          labelText: "Data de chegada",
                          width: Get.mediaQuery.size.width * 0.42,
                          controller: controller.dateFinal,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    TextFormFieldCustom(
                      controller: controller.cityOriginController,
                      textInputType: TextInputType.name,
                      labelText: "Cidade de origem",
                    ),
                    Obx(
                      () {
                        if (controller.listPoints.isNotEmpty) {
                          return Container(
                            height: 30.0 * (controller.listPoints.length + 1),
                            padding: const EdgeInsets.fromLTRB(16, 22, 16, 0),
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: controller.listPoints.length,
                              itemBuilder: (context, index) {
                                return MidPointItem(
                                  city: controller.listPoints[index],
                                  hasCloseButton: true,
                                  onTap: () {
                                    controller.listPoints.removeAt(index);
                                  },
                                );
                              },
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    TextFormFieldCustom(
                      controller: controller.cityDestinyController,
                      textInputType: TextInputType.name,
                      labelText: "Cidade de destino",
                    ),
                    const SizedBox(height: 28),
                    _buildButtonAddPoint(),
                    const SizedBox(height: 43),
                    ButtonCustom(
                      height: 48,
                      borderRadius: 3,
                      width: double.infinity,
                      title: "Avançar",
                      style: ButtonCustomStyle.primary,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildButtonAddPoint() {
    return Column(
      children: [
        GestureDetector(
          onTap: controller.goToAddPoint,
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.add_circle_outline,
                  color: AppColors.labelText,
                  size: 24,
                ),
                SizedBox(width: 1),
                Text(
                  "Adicionar ponto intermediário",
                  style: AppTextStyles.textBold14,
                ),
              ],
            ),
          ),
        ),
        Text(
          "E aumente sua chance de match",
          style: AppTextStyles.textRegular14.cl(
            AppColors.labelText2,
          ),
        ),
      ],
    );
  }
}
