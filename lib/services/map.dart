import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  final data;

  const MyApp({this.data});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double lat=0.0;
  double lon=0.0;
  String name='error';

  void initState(){
    super.initState();
  dynamic got=widget.data;
   try{
     lat=got['coord']['lat'];
         lon=got['coord']['lon'];
         name=got['name'];
   }catch(e){
      lat=13;
      lon=80;
     name='error';
   }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(


          title: Text(name,
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          backgroundColor: Colors.red,
          leading: Builder(
            builder: (BuildContext context) {
             return  IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 30.0,

                  color: Colors.white,
                ),
                padding: EdgeInsets.only(left:20.0),
                onPressed: () { Navigator.of(context,rootNavigator:true).pop(context);},
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
                  // Navigator.pop(context);
                  // Navigator.of(context,rootNavigator:true).pop(context);

            },
          ),

        ),
        body:


        Container(
          // margin: EdgeInsets.symmetric(vertical: 200.0,horizontal: 10.0),


          child: FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: double.infinity,
              zoom: 13,
              center: LatLng(lat,lon),
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                "https://api.mapbox.com/styles/v1/sheikh118/cl62icjgh000y14s5z9gcwtdx/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2hlaWtoMTE4IiwiYSI6ImNsNWtwaWJlbjBhaTEzcGp2M21vYXk0amEifQ.WWwrnJ23ZEs7RsEGY5Ywig",
                additionalOptions: {
                  'mapStyleId': AppConstants.mapBoxStyleId,
                  'accessToken': AppConstants.mapBoxAccessToken,
                },
              ),
              MarkerLayerOptions(
                markers: [
                  // for (int i = 0; i < mapMarkers.length; i++)
                  Marker(
                    height: 40,
                    width: 40,
                    point: LatLng(lat,lon),
                    builder: (_) {
                      return GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'images/map_marker.svg',
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],


          ),
        ),


      ),
    );
  }
}



