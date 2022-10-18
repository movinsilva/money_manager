import 'package:flutter/material.dart';

class MyThemes {

  static Color tColor = const Color(0xff53fdd7).withOpacity(0.5);

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(),

  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
  );

}