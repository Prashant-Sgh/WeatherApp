import 'package:flutter/material.dart';
import 'package:weather_ui_app/main.dart';
import 'package:weather_ui_app/pages/loading_page.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No internet.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoadingPage())),
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, foregroundColor: Colors.white),
              child: Text('Try again.'),
            )
          ],
        ),
      ),
    );
  }
}
