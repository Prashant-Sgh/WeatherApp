import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:weather_ui_app/components/forecast_element.dart';
import 'package:weather_ui_app/constants.dart';
import 'get_location.dart';
import 'conver_to_hours.dart';
import 'package:weather_ui_app/components/forecast_content.dart';

class HourlyWidget {
  Future<List<Widget>> buildWidget() async {
    Position position = await GetPosition().getPosition();

    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=${position.latitude}&lon=${position.longitude}&appid=$kApiKey'));

    List<Widget> allElements = [];

    if (response.statusCode == 200) {
      var data = await jsonDecode(response.body);
      int length = data['list'].length;

      for (int i = 0; i < length; i++) {
        var temp = await (data['list'][i]['main']['temp']) - 273.5;
        var dt = await (data['list'][i]['dt']);
        String hour = ConvertToHours(dt: dt).getHours();

        allElements.add(ForecastElement(
          hourlyTemperature: temp.toStringAsFixed(0),
          hour: hour,
        ));
      }
      return allElements;
    } else {
      return allElements;
    }
  }
}
