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
       print('in location objecthe he');
       LocationPermission permission;

       // Test if location services are enabled.
       bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
       if(serviceEnabled==true){
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation ,timeLimit: Duration(seconds: 5));
      long=position.longitude;
      lat=position.latitude;}

      print("after gecoding api call");
      // print(position);
    } catch (e) {
      print(e);
    }

  }

}