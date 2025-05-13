import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_ui_app/services/hourly_widget.dart';
import 'forecast_element.dart';
import 'package:weather_ui_app/main.dart';
import 'house_widget.dart';

class ForecastPanelContent extends StatefulWidget {
  final ScrollController controller;
  const ForecastPanelContent({super.key, required this.controller});

  @override
  State<ForecastPanelContent> createState() => _ForecastPanelContentState();
}

class _ForecastPanelContentState extends State<ForecastPanelContent> {
  List<Widget> hourlyWidget = [Container()];

  HourlyWidget foreCastElements = HourlyWidget();

  Future<void> getForecastElements() async {
    List<Widget> allElements = await HourlyWidget().buildWidget();

    setState(() {
      hourlyWidget = allElements;
    });
  }

  int forecastIndicator = 1;

  @override
  Widget build(BuildContext context) {
    getForecastElements();
    return Stack(children: [
      ListView(
        children: [
          Container(
            height: 325,
            // width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/forecastBackground.png'),
                  fit: BoxFit.contain),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 47,
                  child: SizedBox(
                    child: SvgPicture.asset(
                        'assets/icons/forecastIndicator$forecastIndicator.svg'),
                  ),
                ),
                ListView(
                  controller: widget.controller,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 32.0, right: 32.0, top: 27.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => {
                              setState(() {
                                forecastIndicator = 1;
                              })
                            },
                            child: Text(
                              'Hourly update',
                              style: TextStyle(
                                  height: 1,
                                  fontSize: 15,
                                  color: Color(0xFFEBEBF5)
                                      .withAlpha((255 * 0.60).toInt()),
                                  fontFamily: 'SFProDisplay',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => {
                              setState(() {
                                forecastIndicator = 2;
                              })
                            },
                            child: Text(
                              'Weekly update',
                              style: TextStyle(
                                  height: 1,
                                  fontSize: 15,
                                  color: Color(0xFFEBEBF5)
                                      .withAlpha((255 * 0.60).toInt()),
                                  fontFamily: 'SFProDisplay',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        height: 160,
                        // width: 300,
                        child: ListView(
                          // controller: controller,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: hourlyWidget,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}
