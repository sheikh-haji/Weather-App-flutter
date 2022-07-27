import 'package:geolocator/geolocator.dart';

class Location{
  double lat=0.0;
  double long=0.0;

  Location(){
    this.lat=0.0;
    this.long=0.0;
  }
  Future<void> getCurrentLocation() async {
    try {

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);
      long=position.longitude;
      lat=position.latitude;
      // print(position);
    } catch (e) {
      print(e);
    }

  }

}