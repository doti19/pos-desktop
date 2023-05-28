import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class MyColors {
  static Color background = const Color(0xff1f2029);
  static Color mainContainer = const Color(0xff17181f);
  // static Color primary = Colors.deepPurpleAccent;
  static Color primary = hexToColor('#DAA520');
  static Color primaryVariant = hexToColor('#B8860B');
  // static Color primaryVariant = Colors.deepPurple;

  static Color lightScaffoldBackgroundColor = hexToColor('#F9F9F9');
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = hexToColor('#5E92F3');
  static Color secondaryAppColorVariant = hexToColor('#202d75');

  static Color secondaryDarkAppColor = Colors.white;
}
