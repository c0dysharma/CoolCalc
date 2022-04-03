import 'package:flutter/material.dart';

class MyTheme {
  // Light Theme
  static lightTheme(BuildContext context) => ThemeData(
        primaryColor: Colors.black,
        focusColor: const Color(0xfff9f9f9),
        highlightColor: const Color(0xfff7f7f7),
        errorColor: Colors.red,
        canvasColor: Colors.white,
        brightness: Brightness.light,
      );
  // Dark Theme
  static darkTheme(BuildContext context) => ThemeData(
        primaryColor: Colors.white,
        focusColor: const Color(0xff292d36),
        highlightColor: const Color(0xff272b33),
        errorColor: Colors.red,
        canvasColor: const Color(0xff22252d),
        brightness: Brightness.dark,
      );

  // Colors vars for keys
  static Color rightRowOrange = const Color(0xfff47a7a);
  static Color topColoumnCyan = const Color(0xff26f5cf);
}
