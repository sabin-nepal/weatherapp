import 'package:geolocator/geolocator.dart';

getCurrentLocation() async {
  LocationPermission permission;
  permission = await Geolocator.checkPermission();
  permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.denied) {
    //nothing to do
  }
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  return "${position.latitude},${position.longitude}";
}

stringToUrl(String fileString) {
  fileString = "http:$fileString";
  return fileString;
}
