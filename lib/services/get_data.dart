import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_ui_app/constants.dart';
import 'get_location.dart';
import 'check_connection.dart';
import 'package:flutter/material.dart';

class GetData {
  String _cityName = 'loadding';
  String _currentTemperature = '--';
  String _weatherCondition = '--';
  String _dayHigh = '--';
  String _dayLow = '--';
  late Position position;

  GetPosition getPosition = GetPosition();

  Future<void> getPositionOfUser() async {
    position = await getPosition.getPosition();
  }

  Future<bool> checkEverything() async {
    bool isConnected = await CheckInternetConnection()
        .isConnected()
        .timeout(Duration(seconds: 10), onTimeout: () => false);
    bool isLocation = await getPosition
        .isLocationReady()
        .timeout(Duration(seconds: 10), onTimeout: () => false);
    if (isConnected && isLocation) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> apiGo(position) async {
    print('apiGo STARTED.');

    http.Response apiResponse = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$kApiKey"));

    if (apiResponse.statusCode == 200) {
      var data = jsonDecode(apiResponse.body);
      var temp = await data['main']['temp'] - 273.5;
      _currentTemperature = temp.toInt().toString();
      _weatherCondition = await data['weather'][0]['main'];
      _cityName = await getPosition.cityName();
      var dayLowTemp = await data['main']['temp_min'] - 273.5;
      _dayHigh = dayLowTemp.toInt().toString();
      var dayHighTemp = await data['main']['temp_max'] - 273.5;
      _dayLow = dayHighTemp.toInt().toString();
      // print('cityName: $_cityName  currentTemperature: $_currentTemperature  weatherCondition: $_weatherCondition  dayHigh: $_dayHigh  dayLow: $_dayLow');
    } else {
      print('---------------  API failed: ${apiResponse.statusCode}');
    }
  }

  String getCityName() {
    return _cityName;
  }

  String getCurrentTemperature() {
    return '$_currentTemperature°';
  }

  String getWeatherCondition() {
    return _weatherCondition;
  }

  String getDayHigh() {
    return '$_dayHigh°';
  }

  String getDayLow() {
    return '$_dayLow°';
  }
}
