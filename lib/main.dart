import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_ui_app/services/get_data.dart';
import 'pages/home.dart';
import 'pages/homepage.dart';
import 'pages/no_internet.dart';
import 'services/check_connection.dart';
import 'services/hourly_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'pages/loading_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

GetData getData = GetData();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    startApp(); // Call test() once when the widget is initialized
  }

  void noInternet() {
    _navigatorKey.currentState
        ?.push(MaterialPageRoute(builder: (context) => NoConnection()));
  }

  void connected() {
    _navigatorKey.currentState
        ?.push(MaterialPageRoute(builder: (context) => WeatherApp()));
  }

  Future<void> startApp() async {
    if (await getData
            .checkEverything()
            .timeout(Duration(seconds: 15), onTimeout: () => false) ==
        true) {
      await getData.getPositionOfUser();
      await getData.apiGo(getData.position);
      await HourlyWidget().buildWidget();
      if (mounted) {
        connected();
        print('Weather app navigation triggered');
      }
    } else {
      if (mounted) {
        noInternet();
        print('No internet, navigating to NoConnection');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey, // Attach the global key to the MaterialApp
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoadingPage(),
      ),
    );
  }
}
