import 'package:flutter/material.dart';
import 'package:weather_ui_app/constants.dart';
import 'package:weather_ui_app/services/get_data.dart';
import 'package:weather_ui_app/main.dart';
import 'package:weather_ui_app/services/get_location.dart';
import 'package:geolocator/geolocator.dart';

class TextData extends StatefulWidget {
  const TextData({super.key});

  @override
  State<TextData> createState() => _TextDataState();
}

class _TextDataState extends State<TextData> {
  String cityName = 'No internet';
  String currentTemperature = '--';
  String weatherCondition = 'loading...';
  String dayHigh = '-';
  String dayLow = '-';

  Future<void> updateData() async {
    // GetData getData = GetData();
    Position position = await GetPosition().getPosition();
    await getData.apiGo(position);
    setState(() {
      cityName = getData.getCityName();
      currentTemperature = getData.getCurrentTemperature();
      weatherCondition = getData.getWeatherCondition();
      dayHigh = getData.getDayHigh();
      dayLow = getData.getDayLow();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('WWWWWWWWWWWWWWWWWWWWWWWWWW');
    updateData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          // 'Montreal', A.K.A - cityName
          cityName,
          style: kHomeLocationNameStyle,
        ),
        SizedBox(height: 9),
        Text(
          currentTemperature,
          style: kHomeTempStyle,
        ),
        SizedBox(height: 9),
        Text(
          // 'Mostly Clear', A.K.A - weatherCondition
          weatherCondition,
          style: kHomeWeathCondStyle,
        ),
        Text(
          // 'H: 24°  L: 19°', A.K.A - dayHigh, dayLow
          'H: ${dayHigh} L: ${dayLow}',
          style: kHomeHighLowStyle,
        ),
      ],
    );
  }
}
