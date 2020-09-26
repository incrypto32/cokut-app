import 'package:flutter/material.dart';

class ColorIt {
  static const String mainBody = "#F0F3FA";

  static Color hexToColor(String code) {
    return Color(
      int.parse(code.substring(1, 7), radix: 16) + 0xFF000000,
    );
  }
}
