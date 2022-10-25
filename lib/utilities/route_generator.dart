import 'package:flutter/material.dart';
import 'package:money_manager/main.dart';
import 'package:money_manager/pages/fingerprint_page.dart';
import 'package:money_manager/pages/home_page.dart';
import 'package:money_manager/pages/settings_pages/about_page.dart';

class RouteGenerator {

  static int bindex = 0;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    //getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/authenticate':
        return MaterialPageRoute(builder: (_) => const FingerprintPage());
      case '/About':
        return MaterialPageRoute(builder: (_) => const AboutPage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}