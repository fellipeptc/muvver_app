import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:muvver_app/app/domain/usecases/travel_path_usercase.dart';
import '../travel_path_controller.dart';

class MapTabPage extends GetView<TravelPathController> {
  const MapTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GoogleMap(
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        markers: Set<Marker>.of(controller.allMarkers),
        polylines: Set<Polyline>.of(controller.polylines.values),
        mapToolbarEnabled: true,
        initialCameraPosition: controller.initialPosition,
        onMapCreated: (GoogleMapController gmp) {
          controller.mapController.complete(gmp);

          Future.delayed(const Duration(milliseconds: 2000), () {
            gmp.animateCamera(CameraUpdate.newLatLngBounds(
                TravelPathUseCase.boundsFromLatLngList(
                    controller.allMarkers.map((loc) => loc.position).toList()),
                1));
            controller.getPolyline(controller.cameraPositions.first, controller.cameraPositions.last);
          });
        },
      ),
    );
  }
}
