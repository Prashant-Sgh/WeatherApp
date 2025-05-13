import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForecastElement extends StatefulWidget {
  final String hourlyTemperature;
  final String hour;

  const ForecastElement(
      {super.key, required this.hourlyTemperature, required this.hour});

  @override
  State<ForecastElement> createState() => _ForecastElementState();
}

class _ForecastElementState extends State<ForecastElement> {
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 146,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF000000).withAlpha((255 * 0.25).toInt()),
                  offset: Offset(10, 9),
                  blurRadius: 15,
                  spreadRadius: 0),
            ],
          ),
          child: SizedBox(
            height: 146,
            width: 60,
            child: Stack(
              children: [
                SizedBox(
                  height: 146,
                  width: 60,
                  child: SvgPicture.asset('assets/images/forecast_element.svg'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.5),
                      child: Text(
                        '${widget.hour}',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SFProDisplay',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: Text(
                        '${widget.hourlyTemperature}°',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'SFProDisplay',
                        ),
                      ),
                    )
                  ],
                ),
                Center(
                    child: Image.asset('assets/icons/Moon_cloud_mid_rain.png')),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 12,
        )
      ],
    );
  }
}
