import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/services/map.dart';

import 'package:weather_app/screens/about.dart';
class NavDrawer extends StatelessWidget {
  final void Function()? mapcallback;
  final void Function()? getcurrentweathercallback;
  final void Function()? citycallback;

  NavDrawer(this.mapcallback, this.getcurrentweathercallback,
      this.citycallback);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.white,
      child: ListView(
        // margin: EdgeInsets.symmetric(horizontal: 10.0),
        children: <Widget>[
          ListTile(
            title: CircleAvatar(
                radius: 160,
                backgroundColor: Colors.red,
                child: CircleAvatar(
                  radius: 150,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/menu.png'),
                )),
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )),
            child: TextButton(
              onPressed: getcurrentweathercallback,
              child: ListTile(
                leading: Icon(
                  Icons.location_on_outlined,
                  size: 20.0,
                  color: Colors.blue,
                ),
                title: Text(
                  'Current Location Weather',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 20.0,
                    color: Colors.grey,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )),
            child: TextButton(
              onPressed: mapcallback,
              child: ListTile(
                leading: Icon(
                  Icons.location_on_outlined,
                  size: 20.0,
                  color: Colors.blue,
                ),
                title: Text(
                  'Map',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 20.0,
                    color: Colors.grey,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )),
            child: TextButton(
              onPressed: citycallback,
              child: ListTile(
                leading: Icon(
                  Icons.location_city_sharp,
                  size: 20.0,
                  color: Colors.blue,
                ),
                title: Text(
                  'Any City Weather',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 20.0,
                    color: Colors.grey,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )),
            child: TextButton(
              onPressed: () async {
                // await _launchURL();
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return func();
                    }));
                Navigator.pop(context);
              }
              , child: ListTile(
              leading: Icon(
                Icons.info_outline,
                size: 20.0,
                color: Colors.blue,
              ),
              title: Text(
                'About Me',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 20.0,
                  color: Colors.grey,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }


}
