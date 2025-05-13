// import 'package:weather_ui_app/constants.dart';
import 'package:weather_ui_app/components/app_background.dart';
import 'package:weather_ui_app/components/color_filter_over_house.dart';
import 'package:weather_ui_app/components/house_widget.dart';
import 'package:weather_ui_app/components/text_data.dart';
import 'package:weather_ui_app/components/draggable_forecast_modal.dart';
import 'package:weather_ui_app/components/button_background.dart';
import 'package:flutter/material.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 9),
              height: 500,
              width: double.infinity,
              child: ColourFilterOverHouse(),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 151),
              height: 390,
              child: HouseWidget(),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 540, top: 90),
              height: 197,
              child: TextData(),
            ),
            DraggableForecastPanel(),
            ButtonBackground(),
          ],
        ),
      ),
    );
    ;
  }
}
