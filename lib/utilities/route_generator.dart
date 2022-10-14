import 'package:flutter/material.dart';
import 'package:money_manager/main.dart';
import 'package:money_manager/pages/fingerprint_page.dart';
import 'package:money_manager/pages/home_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/authenticate':
        return MaterialPageRoute(builder: (_) => FingerprintPage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}