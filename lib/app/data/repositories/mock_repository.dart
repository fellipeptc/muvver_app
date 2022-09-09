import 'package:muvver_app/app/data/providers/mocks_provider.dart';

import '../models/transport.dart';
import '../models/volume_type.dart';

class MockRepository {
  MocksProvider mocksProvider = MocksProvider();

  List<Transport> getMockTransport() {
    return mocksProvider.getMockTransport();
  }

  List<VolumeType> getMockVolumeType() {
    return mocksProvider.getMockVolumeType();
  }
}
