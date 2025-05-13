import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_ui_app/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          image: DecorationImage(
              image: AssetImage('assets/images/star_background.png'),
              fit: BoxFit.fill)),
      child: SizedBox(
        height: double.infinity,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                  // color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [Color(0xFF3A3F54).withAlpha(0), Color(0xFF3A3F54)],
                    stops: [0.12, 0.6],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
              margin: EdgeInsets.only(bottom: 9),
              height: 500,
              width: double.infinity,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 151),
              height: 390,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Color(0xFF3A3F54).withAlpha((255 * 0.12).toInt()),
                    BlendMode.darken),
                child: Image(
                  image: AssetImage('assets/images/house.png'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 540, top: 90),
              height: 197,
              // color: Colors.yellow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Montreal',
                    style: kHomeLocationNameStyle,
                  ),
                  SizedBox(height: 9),
                  Text(
                    '19°',
                    style: kHomeTempStyle,
                  ),
                  SizedBox(height: 9),
                  Text(
                    'Mostly Clear',
                    style: kHomeWeathCondStyle,
                  ),
                  Text(
                    'H: 24°  L: 19°',
                    style: kHomeHighLowStyle,
                  ),
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.435,
              minChildSize: 0.257,
              maxChildSize: 0.435,
              builder: (context, controller) {
                // Adding a listener to detect changes in the sheet's position
                controller.addListener(() {
                  // Get current position of the sheet// double currentPosition = controller.offset;// print("Current sheet position: $currentPosition");// You can perform custom actions based on the position
                });
                return ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(44),
                    topRight: Radius.circular(44),
                  ),
                  child: Stack(children: [
                    ListView(
                      children: [
                        Container(
                          height: 325,
                          // width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/forecastBackground.png'),
                                fit: BoxFit.contain),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 47,
                                child: SizedBox(
                                  child: SvgPicture.asset(
                                      'assets/icons/forecastIndicator1.svg'),
                                ),
                              ),
                              ListView(
                                controller: controller,
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 32.0, right: 32.0, top: 27.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Hourly update',
                                          style: TextStyle(
                                              height: 1,
                                              fontSize: 15,
                                              color: Color(0xFFEBEBF5)
                                                  .withAlpha(
                                                      (255 * 0.60).toInt()),
                                              fontFamily: 'SFProDisplay',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          'Weekly update',
                                          style: TextStyle(
                                              height: 1,
                                              fontSize: 15,
                                              color: Color(0xFFEBEBF5)
                                                  .withAlpha(
                                                      (255 * 0.60).toInt()),
                                              fontFamily: 'SFProDisplay',
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 28,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Container(
                                      height: 160,
                                      child: ListView(
                                        // controller: controller,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        children: [
                                          ForecastElements(),
                                          ForecastElements(),
                                          ForecastElements(),
                                          ForecastElements(),
                                          ForecastElements(),
                                          ForecastElements(),
                                          ForecastElements(),
                                          ForecastElements(),
                                          ForecastElements(),
                                        ],
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
                  ]),
                );
              },
            ),
            // -----------------------------------------------------------------

            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              height: 100,
              child: Stack(
                children: [
                  Container(
                    height: 88,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/tabBarBackground.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/tabBarSubtract.png'))),
                  ),
                  Positioned(
                    left: 34,
                    bottom: 24,
                    child: Container(
                      height: 44,
                      width: 44,
                      child: Image.asset('assets/icons/bHover.png'),
                    ),
                  ),
                  Positioned(
                    left: 163,
                    bottom: 20,
                    child: Container(
                      height: 66,
                      width: 66,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 20,
                              spreadRadius: -15,
                              color: Colors.white54,
                              offset: Offset(-10, -10))
                        ],
                      ),
                      margin: EdgeInsets.only(bottom: 5),
                      child: SvgPicture.asset('assets/icons/bPlus.svg'),
                    ),
                  ),
                  Positioned(
                    right: 34,
                    bottom: 24,
                    child: Container(
                      height: 44,
                      width: 44,
                      child: Image.asset('assets/icons/bList.png'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForecastElements extends StatelessWidget {
  const ForecastElements({
    super.key,
  });

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
                        '12 AM',
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
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        '19°',
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

// BackdropFilter(
// filter: ImageFilter.blur(sigmaX: 40, sigmaY: 50),
// child: ListView(controller: controller),

// ListView.builder(
//   controller: controller,
//   itemCount: 7,
//   itemBuilder: (context, index) {
//     return ListTile(
//       leading: Icon(Icons.cloud),
//       title: Text(
//         "Hourly Forecast:
