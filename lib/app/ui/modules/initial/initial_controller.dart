import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class InitialController extends GetxController{
  goToNextPage() => Get.toNamed(AppRoutes.meansTransport);
}