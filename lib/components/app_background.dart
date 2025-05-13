import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({super.key, required this.child});

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
            fit: BoxFit.fill),
      ),
      child: SizedBox(
        child: child,
      ),
    );
  }
}
