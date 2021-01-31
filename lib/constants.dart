import 'package:flutter/material.dart';

//GOLDEN SECTION CONSTANTS:
abstract class GSConst {
  //COLOR
  static final mainColor = Colors.cyan;
  static final backColor = Colors.grey[300];
  static final pinkPastel = Color(0xFFE0BBE4);
  //static final firstElementColor = Color(0xFF6E0E0A);
  // static final secondElementColor = Color(0xFFD74E09);
  // static final thirdElementColor = Color(0xFFF2BB05);
  static final firstElementColor = Colors.grey;
  static final secondElementColor = Colors.grey[600];
  static final thirdElementColor = Colors.grey[700];
  static final textColor = Colors.white;

  //RADIUS
  static const double radiusComponent = 40;
  //SIZE ELEMENT
  static const double heightBottomElement = 50;
  static const double kDefaultPadding = 16;
  static const double kHeightBarRatio = 0.15;
  static const double kHeightElementRatio = 0.10;
  static const double sizeA = 0.618;
  static const double sizeB = 0.382;

  //PHI
  static const double goldenRatio = 1.618;
}
