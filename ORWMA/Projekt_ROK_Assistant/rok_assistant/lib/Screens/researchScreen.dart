import 'package:flutter/material.dart';
import '../widgets/researchcalc.dart';

class ResearchScreen extends StatelessWidget {

  static const routeName='/research-calc';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Research Calculator'),
      ),
      body: ResearchCalc(),
      resizeToAvoidBottomPadding: false,
    );
  }
}