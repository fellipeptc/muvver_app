import 'package:get/get.dart';

import '../ui/modules/initial/initial_binding.dart';
import '../ui/modules/initial/initial_page.dart';
import '../ui/modules/means_transport/means_transport_binding.dart';
import '../ui/modules/means_transport/means_transport_page.dart';
import '../ui/modules/travel_path/travel_path_binding.dart';
import '../ui/modules/travel_path/travel_path_page.dart';
part 'app_routes.dart';

class AppPages {
  static final pages = [
    //INIIAL PAGE
    GetPage(
      name: AppRoutes.initial,
      page: () => const InitialPage(),
      binding: InitialBinding(),
    ),

    //MEANS TRANSPORT PAGE
    GetPage(
      name: AppRoutes.meansTransport,
      page: () => const MeansTransportPage(),
      binding: MeansTransportBinding(),
    ),

    //TRAVEL PATH PAGE
    GetPage(
      name: AppRoutes.travelPath,
      page: () => const TravelPathPage(),
      binding: TravelPathBinding(),
    ),
  ];
}
