import 'package:muvver_app/app/data/models/volume_type.dart';

import '../../ui/themes/app_images.dart';
import '../models/transport.dart';

class MocksProvider {
  List<Transport> getMockTransport() {
    return [
      Transport(id: 0, name: "Carro", image: AppImages.icCar),
      Transport(id: 1, name: "Avião", image: AppImages.icAviao),
      Transport(id: 2, name: "Caminhão", image: AppImages.icCaminhao),
      Transport(id: 3, name: "Van", image: AppImages.icVan),
      Transport(id: 4, name: "Moto", image: AppImages.icMoto),
      Transport(id: 5, name: "Bicicleta", image: AppImages.icBike),
      Transport(id: 6, name: "Trem", image: AppImages.icTrem),
      Transport(id: 7, name: "Ônibus", image: AppImages.icBus),
      Transport(id: 8, name: "Embarcação", image: AppImages.icBarco),
    ];
  }

  List<VolumeType> getMockVolumeType() {
    return [
      VolumeType(id: 0, name: "Envelope", image: "image"),
      VolumeType(id: 1, name: "Livro", image: "image"),
      VolumeType(id: 2, name: "Caixa de sapato", image: "image"),
      VolumeType(id: 3, name: "Mochila", image: "image"),
      VolumeType(id: 4, name: "Mala grande", image: "image"),
      VolumeType(id: 5, name: "Caixa grande", image: "image"),
    ];
  }
}
