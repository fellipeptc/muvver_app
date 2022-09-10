import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muvver_app/app/ui/modules/travel_path/widgets/map_tab_page_widget.dart';
import 'package:muvver_app/app/ui/modules/travel_path/widgets/route_tab_page_widget.dart';

import '../../themes/app_colors.dart';
import '../../widgets/appbar/appbar_custom_widget.dart';
import 'travel_path_controller.dart';

class TravelPathPage extends GetView<TravelPathController> {
  const TravelPathPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppbarCustom(
          title: "Viajante",
          descrition: "Qual o trajeto da sua viagem?",
          iconLeading: Icons.arrow_back,
          hasTabMenu: true,
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            RouteTabPage(),
            MapTabPage(),
          ],
        ),
      ),
    );
  }
}
