import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonBackground extends StatefulWidget {
  const ButtonBackground({super.key});

  @override
  State<ButtonBackground> createState() => _ButtonBackgroundState();
}

class _ButtonBackgroundState extends State<ButtonBackground> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
              image: AssetImage('assets/images/tabBarSubtract.png'),
            ),
          ),
        ),
        Positioned(
          left: 34,
          bottom: 24,
          child: SizedBox(
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
                  offset: Offset(-10, -10),
                ),
              ],
            ),
            margin: EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset('assets/icons/bPlus.svg'),
          ),
        ),
        Positioned(
          right: 34,
          bottom: 24,
          child: SizedBox(
            height: 44,
            width: 44,
            child: Image.asset('assets/icons/bList.png'),
          ),
        ),
      ],
    );
  }
}
