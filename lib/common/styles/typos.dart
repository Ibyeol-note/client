import 'package:flutter/material.dart';

class Typos {
  static final headLarge = TextStyle(fontFamily: "MinSans", height: 60 / 40, fontSize: 40, fontWeight: FontWeight.w500, letterSpacing: getSpacing(40, -2));
  static final headMedium = TextStyle(fontFamily: "MinSans", height: 48 / 32, fontSize: 32, fontWeight: FontWeight.w500, letterSpacing: getSpacing(32, -2));
  static final headSmall= TextStyle(fontFamily: "MinSans", height: 48 / 32, fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: getSpacing(32, -2));

  static final titleLarge = TextStyle(fontFamily: "SpoqaHanSansNeo", height: 42 / 28, fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: getSpacing(28, -2));
  static final titleMedium = TextStyle(fontFamily: "SpoqaHanSansNeo", height: 36 / 24, fontSize: 24, fontWeight: FontWeight.w500, letterSpacing: getSpacing(24, -2));
  static final titleSmall = TextStyle(fontFamily: "SpoqaHanSansNeo", height: 36 / 24, fontSize: 24, fontWeight: FontWeight.w300, letterSpacing: getSpacing(24, -2));

  static final bodyXLarge = TextStyle(fontFamily: "SpoqaHanSansNeo", height: 30 / 20, fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: getSpacing(20, -2));
  static final bodyLarge = TextStyle(fontFamily: "SpoqaHanSansNeo", height: 27 / 18, fontSize: 18, fontWeight: FontWeight.w300, letterSpacing: getSpacing(18, -2));
  static final bodyMedium = TextStyle(fontFamily: "SpoqaHanSansNeo", height: 24 / 16, fontSize: 16, fontWeight: FontWeight.w300, letterSpacing: getSpacing(16, -2));
  static final bodySmall = TextStyle(fontFamily: "SpoqaHanSansNeo", height: 21 / 14, fontSize: 14, fontWeight: FontWeight.w300, letterSpacing: getSpacing(14, -2));

  static final captionLarge = TextStyle(fontFamily: "SpoqaHanSansNeo", height: 21 / 14, fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: getSpacing(14, -2));
  static final captionMedium = TextStyle(fontFamily: "SpoqaHanSansNeo", height: 15 / 10, fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: getSpacing(10, 1));
  static final captionSmall = TextStyle(fontFamily: "NanumMyeongjo", height: 15 / 10, fontSize: 10, fontWeight: FontWeight.w600, letterSpacing: getSpacing(10, 1));
}

double getSpacing(double fontSize, double percentage) {
  return fontSize * percentage / 100;
}