import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muvver_app/app/ui/modules/means_transport/widgets/transport_item.dart';
import 'package:muvver_app/app/ui/themes/app_text_styles.dart';
import 'package:muvver_app/app/ui/widgets/appbar/appbar_custom_widget.dart';
import 'package:muvver_app/app/ui/widgets/button/button_custom_widget.dart';

import '../../themes/app_colors.dart';
import 'means_transport_controller.dart';

class MeansTransportPage extends GetView<MeansTransportController> {
  const MeansTransportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppbarCustom(
        title: "Viajante",
        descrition: "Qual será o meio de transporte da sua viagem?",
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Transporte",
                style: AppTextStyles.textBold16,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.mockTransport.length,
                  itemBuilder: (context, index) {
                    return TransportItem(
                      transport: controller.mockTransport[index],
                      myIndex: index,
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              ButtonCustom(
                height: 48,
                borderRadius: 3,
                width: double.infinity,
                title: "Avançar",
                style: ButtonCustomStyle.primary,
                onPressed: () {
                  controller.goNextPage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
