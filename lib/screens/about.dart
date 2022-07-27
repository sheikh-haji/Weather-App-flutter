import 'package:flutter/material.dart';

void main() {
  runApp(func());
}

class func extends StatefulWidget {
  const func({Key? key}) : super(key: key);

  @override
  State<func> createState() => _funcState();
}

class _funcState extends State<func> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(

            title: Text('Ceg,Chennai',
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
          backgroundColor: Colors.teal,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/location_background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
            child: SafeArea(

                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.red,
                        backgroundImage: AssetImage('images/temps.png'),
                      ),
                      Text("Sheikh Haji",
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 40.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("WEB DEVELOPER",
                          style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 20.0,
                              color: Colors.teal.shade100,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 4.0)),
                      SizedBox(
                        height: 20.0, width: 200.0,
                        child:Divider(color: Colors.white,),
                      ),
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical:10,horizontal:25.0),
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.phone,
                              color: Colors.teal,
                            ),
                            SizedBox(width: 20.0),
                            Text("9367587134",
                                style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 20.0,
                                  color: Colors.teal.shade900,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical:10,horizontal:25.0),
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.email ,
                              color: Colors.teal,
                            ),
                            SizedBox(width: 20.0),
                            Text("sheikhhaji18@gmail.com",
                                style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 20.0,
                                  color: Colors.teal.shade900,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                      )

                    ])),
          ),
        ));
  }
}

