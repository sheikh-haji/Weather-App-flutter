import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/screens/about.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/services/map.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  final locationweather;

  LocationScreen({this.locationweather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String city = '';
  int temperature = 0;
  int condition = 0;
  String des = '';
  WeatherModel weather = new WeatherModel();
  String icon = '';
  String msg = '';
  dynamic weatherdata;

  @override
  void initState() {
    super.initState();

    weatherdata = widget.locationweather;
    updateUI(widget.locationweather);
  }

  void updateUI(dynamic weatherdata) {
    setState(() {
      if (weatherdata == null) {
        msg = 'error cannot get the weather';
        temperature = 0;
        icon = '⚠';
        return;
      }
      city = weatherdata['name'];
      double temperature1 = weatherdata['main']['temp'];
      temperature = temperature1.toInt();
      msg = weather.getMessage(temperature);
      msg += ' in $city';
      condition = weatherdata['weather'][0]['id'];
      icon = ' ' + weather.getWeatherIcon(condition);
      weather.locateObj.lat = weatherdata['coord']['lat'];
      weather.locateObj.long = weatherdata['coord']['lon'];
      des = weatherdata['weather'][0]['description'];
      print(weather.locateObj.lat);
      print(weather.locateObj.lat);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Text('Weather',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          backgroundColor: Colors.red,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return func();
                }));
              },
              child: Icon(
                Icons.info_outline,
                size: 20.0,
                color: Colors.white,
              ),
            ),
          ]),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherdata1 = await WeatherModel().getweatherdata();
                      setState(() {
                        weatherdata = weatherdata1;
                        // dynamic weatherdata=1;
                        updateUI(weatherdata);
                      });
                    },
                    child: Icon(Icons.near_me, size: 50.0, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () async{

                        await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MyApp(data: weatherdata);
                        }));

                    },
                    child: Icon(Icons.location_on_outlined,
                        size: 50.0, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () async{

                        var cityname = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }));
                        // city=cityname;
                        // print(cityname);
                        if (cityname == 'N') {
                          return;
                        }

                        var weatherdata1 =
                            await WeatherModel().getweathercitydata(cityname);
                        // dynamic weatherdata=1;
                        setState(() {
                          weatherdata=weatherdata1;
                          updateUI(weatherdata);
                        });


                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°C',
                      style: kTempTextStyle,
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(
                      icon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  msg,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// var city=weatherdata['name'];
// var temperature=weatherdata['main']['temp'];
// var icon=weatherdata['weather'][0]['id'];
// var des=weatherdata['weather'][0]['description'];
