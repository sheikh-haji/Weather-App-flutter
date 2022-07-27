import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/weather.dart';
import 'package:geolocator/geolocator.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude=0.0;
  double longitude=0.0;



  @override
  void initState() {
    super.initState();
    // helper_func();
    getlocation();

  }
  Future helper_func()async {
    await _determinePosition();
  }
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
  }


  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.

  void getlocation() async{
     await helper_func();
    dynamic weatherdata=await WeatherModel().getweatherdata();
    Navigator.push(context,MaterialPageRoute(builder: (context){
      return LocationScreen(locationweather:weatherdata);
    }));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
          child: SpinKitWave(
            color: Colors.white,
            size: 100.0,
          ),
        ));
  }
}
