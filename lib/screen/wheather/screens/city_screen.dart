import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxapp/screen/theme/app_colors.dart';
import 'package:maxapp/widgets/custom_input_text.dart';

import '../../../utils/constants.dart';
import '../services/networking.dart';

import 'location_screen.dart';

String apiKey = 'e89bd566819a99dbec331372a8855ae5';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final TextEditingController _controller = TextEditingController();

  Future<void> getTemperature() async {

    String cityName = _controller.text.trim();
    String weatherAPIUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(weatherAPIUrl);
    var weatherData = await networkHelper.getData();

    // Navigate to LocationScreen with the retrieved weather data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(weatherData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundApp,
      body: Container(
        decoration: BoxDecoration(

        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(

            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Navigate back when back button is pressed
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                  ),
                ),
              ),
             SizedBox(height: 140,),
              InputText(
                controller: _controller,
                  hintText: "Enter the city name...", labelText: ""),
              SizedBox(height: 40,),
              CupertinoButton(
                color: AppColors.yellow,

                onPressed: getTemperature,
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
