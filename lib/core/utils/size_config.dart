import 'package:flutter/material.dart';

class SizeConfig {
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    orientation = MediaQuery.of(context).orientation;
    defaultSize = orientation == Orientation.landscape
        ? screenHeight! * 0.024
        : screenWidth! * 0.025;
    print("this is the default size $defaultSize");
  }
}
