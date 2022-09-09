import 'package:get/get.dart';
import 'travel_path_controller.dart';

class TravelPathBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TravelPathController());
  }
}