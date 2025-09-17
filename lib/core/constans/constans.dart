import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppConstans {
  static const String hotelsData = "assets/data/hotels.json";
  static const String baseUrlImage =
      "https://dunijet.ir/content/project/hotelino/";
}

class AppColors {
  static const Color primeryColor = Color(0xffB27258);

  // light theme

  static const Color lightText = Colors.black;
  static const Color lightHint = Color(0xff9196A3);
  static const Color lightInputFill = Color(0xfff5f5f5);
  static const Color lightBorder = Color(0xff9196A3);
  static const Color lightFocusBorder = Colors.brown;

  // dark theme

  static const Color darkText = Colors.white;
  static const Color darkHint = Color(0xff9196A3);
  static const Color darkInputFill = Color(0xff303030);
  static const Color darkBorder = Color(0xff707070);
  static const Color darkFocusBorder = Colors.brown;
  static const Color darkButton = Color(0xff5d4037);
}
