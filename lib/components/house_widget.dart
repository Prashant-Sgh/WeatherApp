import 'package:flutter/material.dart';

class HouseWidget extends StatelessWidget {
  const HouseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
            Color(0xFF3A3F54).withAlpha((255 * 0.12).toInt()),
            BlendMode.darken),
        child: Image(
          image: AssetImage('assets/images/house.png'),
        ),
      ),
    );
  }
}
