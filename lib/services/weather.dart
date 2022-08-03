import 'dart:convert';

import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
class WeatherModel {
  Location locateObj=new Location();
  static const String apikey='bcc8854a89200f1c4978826c42cbe10e';
  Future<dynamic> getweathercitydata(var cityname) async{
    print('in weather object');
    NetworkHelper networkHelper=new NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey&units=metric');
    var weatherdata=await networkHelper.getData();
    try{
    locateObj.lat=weatherdata['coord']['lat'];
    locateObj.long=weatherdata['coord']['lon'];}
    catch(e){
      locateObj.lat=0.0;
      locateObj.long=0.0;
    }
    return weatherdata;
  }
  Future<dynamic> getweatherdata() async{
     print('in weather object');
    await locateObj.getCurrentLocation();
    double latitude=locateObj.lat;
    double longitude=locateObj.long;
    // print(latitude);
    // print(longitude);
    // getData()
    if(latitude==0.0 && longitude==0.0){
      return null;
    }
    NetworkHelper networkHelper=new NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey&units=metric');
    var weatherdata=await networkHelper.getData();
    print("after openweathermap api call");
    return weatherdata;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌁';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
