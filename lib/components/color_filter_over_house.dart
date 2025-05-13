import 'package:flutter/material.dart';

class ColourFilterOverHouse extends StatelessWidget {
  const ColourFilterOverHouse({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.black,
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [Color(0xFF3A3F54).withAlpha(0), Color(0xFF3A3F54)],
          stops: [0.12, 0.6],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
