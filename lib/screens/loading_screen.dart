import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apikey = "c294b698abb618104a3efac2ace94355";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lon;
  double lat;

  void getmylocationdata() async {
    Location loc = Location();
    await loc.getlocation();

    Network n = Network(
        url:
            "https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apikey");
    var wheatherdata = await n.fetchdata();
    var city = wheatherdata['name'];
    print(city);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationdwhether: wheatherdata,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getmylocationdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWanderingCubes(
          color: Colors.lightBlue,
          size: 75,
          //duration: const Duration(milliseconds: 2000),
        ),
      ),
    );
  }
}
