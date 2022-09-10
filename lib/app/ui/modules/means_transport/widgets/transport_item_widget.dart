import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/transport.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_text_styles.dart';
import '../means_transport_controller.dart';

class TransportItem extends GetView<MeansTransportController> {
  final Transport transport;
  final int myIndex;

  const TransportItem({
    Key? key,
    required this.transport,
    required this.myIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            controller.indexSelected.value = myIndex;
          },
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  transport.image,
                  height: 32,
                  width: 32,
                ),
                const SizedBox(width: 16),
                Text(
                  transport.name,
                  style: AppTextStyles.textBold14.fs(12),
                ),
                const Spacer(),
                Obx(
                  () => Container(
                    height: 16,
                    width: 16,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: myIndex == controller.indexSelected.value
                            ? AppColors.primary
                            : AppColors.labelText,
                      ),
                      color: Colors.transparent,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(360)),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: myIndex == controller.indexSelected.value
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(360)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          height: 22,
          color: AppColors.separate,
        )
      ],
    );
  }
}
