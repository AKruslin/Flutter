import 'package:flutter/material.dart';

import './Screens/mainScreen.dart';
import './Screens/speedupScreen.dart';
import './Screens/resourceScreen.dart';
import './Screens/buildingScreen.dart';
import './Screens/researchScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rise Of Kingdoms Assistant',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainScreen(),
      routes: {
        SpeedUpScreen.routeName: (ctx)=> SpeedUpScreen(),
        ResourceScreen.routeName:(ctx)=>ResourceScreen(),
        BuildingScreen.routeName:(ctx)=>BuildingScreen(),
        ResearchScreen.routeName:(ctx)=>ResearchScreen(),
      },
    );
  }
}
