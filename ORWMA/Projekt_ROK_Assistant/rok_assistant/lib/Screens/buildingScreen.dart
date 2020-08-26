import 'package:flutter/material.dart';
import '../widgets/buildingcalc.dart';

class BuildingScreen extends StatelessWidget {

  static const routeName='/buidling-calc';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Building Calculator'),
      ),
      body: BuildingCalc(),
      resizeToAvoidBottomPadding: false,
    );
  }
}