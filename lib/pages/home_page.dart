import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/data/pie_chart_data.dart';
import 'package:money_manager/pages/add_transaction.dart';
import 'package:money_manager/pages/dashboard_container.dart';
import 'package:money_manager/pages/expect_container.dart';
import 'package:money_manager/pages/settings_container.dart';
import 'package:money_manager/pages/settings_pages/about_page.dart';
import 'package:money_manager/pages/transactions_container.dart';
import 'package:money_manager/utilities/bottom_nav_info.dart';
import 'package:money_manager/utilities/route_generator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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

    return ChangeNotifierProvider(
      create: (context) => BottomNavInfo(),
      child: Consumer<BottomNavInfo>(
        builder: (context, data, child){
          return Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              items: items,
              index: data.getBIndex(),
              color: const Color(0xff53fdd7).withOpacity(0.5),
              backgroundColor: themeColor,
              onTap: (index) {
                //var bottomNavInfo = Provider.of<BottomNavInfo>(context, listen: false);
                data.updateBIndex(index);
              },
            ),
            body: bottomNav(data.getBIndex(), data.getSubIndex()),
          );
        },
      ),
    );
  }
}

Widget bottomNav(int i, int k) {
  switch(i) {
    case 0:
      return DashboardContainer();
    case 1:
      return TransactionsContainer();
    case 2:
      return AddTransaction();
    case 3:
      return ExpectContainer();
    case 4:
      switch(k){
        case 1:
          return AboutPage();
        default:
          return SettingContainer();
      }

    case 5:
      return AboutPage();
    default:
      return DashboardContainer();
  }
}
