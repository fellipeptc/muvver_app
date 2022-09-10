import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

import '../../../main.dart';

abstract class TravelPathUseCase {
  static Future<Position> getPositionGps() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  static Future<List<AutocompletePrediction>> autoCompleteSearch(
      List<String> values) async {
    final googlePlace = GooglePlace(kGoogleApiKey);
    List<AutocompletePrediction> predictions = [];
    for (String value in values) {
      var result = await googlePlace.autocomplete.get(value);
      if (result != null && result.predictions != null) {
        print(result.predictions!.first.description);
        print(result.predictions!.first.placeId);
        predictions.add(result.predictions!.first);
      }
    }
    return predictions;
  }

  static Future<List<CameraPosition>> getPositionsMap(
      List<AutocompletePrediction> predictions) async {
    final googlePlace = GooglePlace(kGoogleApiKey);
    List<CameraPosition> cameraPositions = [];
    for (AutocompletePrediction p in predictions) {
      final details = await googlePlace.details.get(p.placeId!);
      if (details != null && details.result != null) {
        DetailsResult? result = details.result;
        double lat = result!.geometry!.location!.lat!;
        double lng = result.geometry!.location!.lng!;
        cameraPositions.add(
          CameraPosition(
            target: LatLng(lat, lng),
            zoom: 18.151926040649414,
          ),
        );
      }
    }
    return cameraPositions;
  }

  static LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    double? x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
        northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
  }
}
