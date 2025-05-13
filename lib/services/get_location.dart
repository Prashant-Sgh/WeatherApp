import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GetPosition {
  late Position position;
  LocationPermission _locationPermission = LocationPermission.denied;

  Future<void> _permission() async {
    _locationPermission = await Geolocator.checkPermission();
    if (_locationPermission == LocationPermission.denied ||
        _locationPermission == LocationPermission.deniedForever ||
        _locationPermission == LocationPermission.unableToDetermine) {
      _locationPermission = await Geolocator.requestPermission();
    }
  }

  Future<bool> isLocationReady() async {
    await _permission();
    if (_locationPermission == LocationPermission.whileInUse ||
        _locationPermission == LocationPermission.always) {
      return true;
    } else {
      return false;
    }
  }

  Future<Position> getPosition() async {
    position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high));
    return position;
  }

  Future<String> cityName() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    return placemarks[0].locality ?? 'error loading';
  }
}
