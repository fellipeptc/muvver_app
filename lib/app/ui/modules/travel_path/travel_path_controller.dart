import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:muvver_app/app/domain/usecases/travel_path_usercase.dart';
import 'package:muvver_app/app/ui/themes/app_colors.dart';

import '../../../../main.dart';
import 'widgets/add_point_widget.dart';

class TravelPathController extends GetxController {
  final TextEditingController dateInitial = TextEditingController();
  final TextEditingController dateFinal = TextEditingController();
  final TextEditingController cityOriginController = TextEditingController();
  final TextEditingController cityDestinyController = TextEditingController();

  RxList<String> listPoints = <String>[].obs;
  RxList<AutocompletePrediction> predictions = <AutocompletePrediction>[].obs;
  RxList<Marker> allMarkers = <Marker>[].obs;

  final Completer<GoogleMapController> mapController = Completer();
  late List<CameraPosition> cameraPositions = [];
  late CameraPosition initialPosition = const CameraPosition(
    target: LatLng(37.43296265331129, -122.08832357078792),
    zoom: 18.151926040649414,
  );

  /// variables for draw positions on map
  RxMap<PolylineId, Polyline> polylines = <PolylineId, Polyline>{}.obs;
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  @override
  Future<void> onInit() async {
    cityOriginController.text = "Campo Grande, MS";
    cityDestinyController.text = "Dourados, MS";

    Position myPosition = await TravelPathUseCase.getPositionGps();

    initialPosition = CameraPosition(
      target: LatLng(myPosition.latitude, myPosition.longitude),
      zoom: 18.151926040649414,
    );

    await _getCitiesPositions();

    super.onInit();
  }

  Future<void> goToAddPoint() async {
    final result = await Navigator.push(
      Get.context!,
      MaterialPageRoute(builder: (context) => const AddPoint()),
    );
    if (result != null && result != "") {
      listPoints.add(result);
      print("Adicionado: $result");

      await _getCitiesPositions();
    }
  }

  Future<void> _getCitiesPositions() async {
    predictions.clear();
    cameraPositions.clear();
    List<String> auxlist = [...listPoints];
    auxlist.insert(0, cityOriginController.text.trim());
    auxlist.insert(auxlist.length, cityDestinyController.text.trim());
    predictions.value = await TravelPathUseCase.autoCompleteSearch(auxlist);
    cameraPositions = await TravelPathUseCase.getPositionsMap(predictions);
    await _addMarkersOnMap();
  }

  Future<void> _addMarkersOnMap() async {
    final GoogleMapController gmc = await mapController.future;
    allMarkers.clear();
    for (var camera in cameraPositions) {
      gmc.animateCamera(CameraUpdate.newCameraPosition(camera));
      allMarkers.add(
        Marker(
          markerId: MarkerId(camera.target.toString()),
          position: camera.target,
          infoWindow: const InfoWindow(
            title: 'Minha posição',
            snippet: 'PROMOKI',
          ),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ),
      );
    }
  }

  _addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: AppColors.primary, points: polylineCoordinates);
    polylines[id] = polyline;
  }

  getPolyline(CameraPosition start, CameraPosition end) async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      kGoogleApiKey,
      PointLatLng(start.target.latitude, start.target.longitude),
      PointLatLng(end.target.latitude, end.target.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }
}
