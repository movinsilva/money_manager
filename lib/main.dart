import 'package:flutter/material.dart';
import 'package:money_manager/pages/fingerprint_page.dart';
import 'package:money_manager/utilities/my_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: FingerprintPage(),
    );
  }
}

