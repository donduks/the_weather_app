import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:the_weather_app/screens/location_screen.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:the_weather_app/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    
    var weatherData = await WeatherModel().getLocationWeather();

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitThreeInOut(
          color: Colors.white10,
          size: 100,
        ),
      ),
    );
  }
}
