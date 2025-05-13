import 'package:flutter/material.dart';

String kApiKey = 'b4832a74c2333d1e250b10d674f9fb50';

const TextStyle kHomeLocationNameStyle = TextStyle(
  letterSpacing: 0.37,
  height: 1,
  fontSize: 34,
  fontFamily: 'SFProDisplay',
);

const TextStyle kHomeTempStyle = TextStyle(
    height: 1,
    fontSize: 96,
    fontFamily: 'SFProDisplay',
    fontWeight: FontWeight.w100);

final TextStyle kHomeWeathCondStyle = TextStyle(
    letterSpacing: 0.38,
    height: 1,
    fontSize: 20,
    fontFamily: 'SFProDisplay',
    fontWeight: FontWeight.w600,
    color: Color(0xFFFFFFFF).withAlpha((255 * 0.40).toInt()));

const TextStyle kHomeHighLowStyle = TextStyle(
  letterSpacing: 0.38,
  // height: 1,
  fontSize: 20,
  fontFamily: 'SFProDisplay',
  fontWeight: FontWeight.w600,
);
