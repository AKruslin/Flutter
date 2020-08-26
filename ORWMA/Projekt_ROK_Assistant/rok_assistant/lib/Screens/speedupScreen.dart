import 'package:flutter/material.dart';
import 'package:rok_assistant/widgets/speedupcalc.dart';

class SpeedUpScreen extends StatelessWidget {
  static const routeName = '/speed-ups';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speed Up'),
      ),
      body: SpeedUpCalc(),
      resizeToAvoidBottomPadding: false,
    );
  }
}
