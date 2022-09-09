import 'package:get/get.dart';
import 'package:muvver_app/app/data/repositories/mock_repository.dart';

import '../../../data/models/transport.dart';
import '../../../domain/usecases/means_transport_usecase.dart';

class MeansTransportController extends GetxController {
  RxList<Transport> mockTransport = <Transport>[].obs;
  RxInt indexSelected = 0.obs;
  final MockRepository mockRepository = MockRepository();

  @override
  void onInit() {
    mockTransport.value =
        MeansTransportUsecase.getMockTransport(mockRepository);
    super.onInit();
  }

  void goNextPage(){
    Transport transportSelected = mockTransport[indexSelected.value];
    transportSelected.isSelected = true;
    Get.toNamed("page", arguments: transportSelected);
  }
}
