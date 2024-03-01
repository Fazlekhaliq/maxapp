import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../utils/constants.dart';
import '../services/weather.dart';
import 'city_screen.dart';
import 'loading_screen.dart';

class LocationScreen extends StatefulWidget {
  final weatherData;
  LocationScreen(this.weatherData);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var myWeatherData;

  int? temperature;
  String? cityName;
  int? condition;
  String? weatherIcon;
  String? weatherMessage;

  @override
  void initState() {
    super.initState();
    // Check if weatherData is not null
    if (widget.weatherData != null) {
      myWeatherData = widget.weatherData;
      // Perform null checks before accessing properties
      if (myWeatherData["main"] != null &&
          myWeatherData["main"]["temp"] != null &&
          myWeatherData["name"] != null &&
          myWeatherData["weather"] != null &&
          myWeatherData["weather"].isNotEmpty &&
          myWeatherData["weather"][0]["id"] != null) {
        // Assign values if not null
        temperature = myWeatherData["main"]["temp"].toInt();
        cityName = myWeatherData["name"];
        condition = myWeatherData["weather"][0]["id"];
        WeatherModel weatherModel = WeatherModel();
        weatherIcon = weatherModel.getWeatherIcon(condition!);
        weatherMessage = weatherModel.getMessage(condition!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/im.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => LoadingScreen()));
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => CityScreen()));
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle.copyWith(
                        color: Colors.white
                      ),
                    ),
                    Text(
                      weatherIcon ?? '',
                      style: kConditionTextStyle.copyWith(
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in ${cityName ?? 'Unknown'}!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle.copyWith(
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
