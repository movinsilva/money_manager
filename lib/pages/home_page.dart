import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/data/pie_chart_data.dart';
import 'package:money_manager/pages/dashboard_container.dart';
import 'package:money_manager/pages/settings_container.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 2;
  @override
  Widget build(BuildContext context) {

    Color themeColor = Theme.of(context).scaffoldBackgroundColor;


    final items = <Widget>[
      Icon(Icons.home),
      Icon(Icons.wallet),
      Icon(Icons.add),
      Icon(Icons.history),
      Icon(Icons.settings)
    ];

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        color: const Color(0xff53fdd7).withOpacity(0.5),
        backgroundColor: themeColor,
        onTap: (index) => setState(() => this.index = index),
      ),
      body: bottomNav(index),
    );
  }
}

Widget bottomNav(int i) {
  switch(i) {
    case 0:
      return DashboardContainer();
    case 4:
      return SettingContainer();
    default:
      return DashboardContainer();
  }
}
