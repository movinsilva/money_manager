import 'package:flutter/material.dart';

class MyThemes {

  static Color mColor = const Color(0xff53fdd7);
  static Color tColor = const Color(0xff53fdd7).withOpacity(0.5);

  static Color inflowColor = Colors.blue;
  static Color outflowColor = const Color(0xffff5182);

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(),

  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
  );

}