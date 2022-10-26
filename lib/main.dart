import 'package:flutter/material.dart';
import 'package:money_manager/data/global_data.dart';
import 'package:money_manager/database/db_helper.dart';
import 'package:money_manager/model/account_model.dart';
import 'package:money_manager/pages/fingerprint_page.dart';
import 'package:money_manager/utilities/my_themes.dart';
import 'package:money_manager/utilities/route_generator.dart';

void main() async{
  // taking user info from the database
  List<Map<String, dynamic>> userInfo = await DbHelper.instance.queryAll(tableUser);
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
      initialRoute: '/authenticate',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

