import 'package:get/get.dart';
import 'means_transport_controller.dart';

class MeansTransportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MeansTransportController());
  }
}