import 'package:muvver_app/app/data/repositories/mock_repository.dart';

import '../../data/models/transport.dart';

abstract class MeansTransportUsecase {

  static List<Transport> getMockTransport(MockRepository mockRepository) {
    ///Poderia tratar algumas regras aqui
    return mockRepository.getMockTransport();
  }
}
