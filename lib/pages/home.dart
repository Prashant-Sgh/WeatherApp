import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                child: Stack(
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          Color(0xFF3A3F54).withAlpha((255 * 0.12).toInt()),
                          // Color(0xFF38103F).withAlpha((255 * 0.19).toInt()),
                          BlendMode.darken),
                      child: Image(
                        image: AssetImage('assets/images/house.png'),
                      ),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(bottom: 540, top: 90),
              // height: 183,
              // color: Colors.yellow,
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Montreal',
                    style: TextStyle(
                      letterSpacing: 0.37,
                      height: 1,
                      fontSize: 34,
                      fontFamily: 'SFProDisplay',
                    ),
                  ),
                  SizedBox(height: 9),
                  Text('19°',
                      style: TextStyle(
                          height: 1,
                          fontSize: 96,
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w100)),
                  SizedBox(height: 9),
                  Text(
                    'Mostly Clear',
                    style: TextStyle(
                        letterSpacing: 0.38,
                        height: 1,
                        fontSize: 20,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w600,
                        color:
                            Color(0xFFFFFFFF).withAlpha((255 * 0.40).toInt())),
                  ),
                  Text('H: 24°  L: 19°',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 0.38,
                        // height: 1,
                        fontSize: 20,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w600,
                      ))
                ],
              )),
            ),

            // XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
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
                    ListView(children: [
                      Container(
                        height: 325,
                        // width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/forecast_panel_background.png'),
                              fit: BoxFit.contain),
                        ),
                        child: Stack(
                          children: [
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
                                            color: Color(0xFFEBEBF5).withAlpha(
                                                (255 * 0.60).toInt()),
                                            fontFamily: 'SFProDisplay',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'Weekly update',
                                        style: TextStyle(
                                            height: 1,
                                            fontSize: 15,
                                            color: Color(0xFFEBEBF5).withAlpha(
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
                                      controller: controller,
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
                            ListView(
                              controller: controller,
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ]),
                );
              },
            )
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
                  offset: Offset(10, 6),
                  blurRadius: 13,
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
