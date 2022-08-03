import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
class AppConstants {
  static const String mapBoxAccessToken = 'pk.eyJ1Ijoic2hlaWtoMTE4IiwiYSI6ImNsNWtwaWJlbjBhaTEzcGp2M21vYXk0amEifQ.WWwrnJ23ZEs7RsEGY5Ywig';
  static const String mapBoxStyleId = 'https://api.mapbox.com/styles/v1/sheikh118/cl62icjgh000y14s5z9gcwtdx/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2hlaWtoMTE4IiwiYSI6ImNsNWtwaWJlbjBhaTEzcGp2M21vYXk0amEifQ.WWwrnJ23ZEs7RsEGY5Ywig';

  static final myLocation = LatLng(13.113779,80.103763);
}

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 70.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
  color: Colors.white
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB', color: Colors.white
);

const kConditionTextStyle = TextStyle(
  fontSize: 70.0,
);
