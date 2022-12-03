import 'package:flutter/material.dart';
import 'package:money_manager/data/global_data.dart';
import 'package:money_manager/utilities/bottom_nav_info.dart';
import 'package:money_manager/utilities/my_themes.dart';
import 'package:money_manager/utilities/route_generator.dart';
import 'package:provider/provider.dart';

void main() async{

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => BottomNavInfo()),
      ChangeNotifierProvider(create: (_) => GlobalData()),
    ],
    child: const MyApp(),)

  );
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

