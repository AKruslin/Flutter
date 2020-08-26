import 'package:flutter/material.dart';
import 'package:rok_assistant/widgets/resourcecalc.dart';

class ResourceScreen extends StatelessWidget {
  static const routeName = '/resource-calc';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resource Calculator'),
      ),
      body: ResourceCalc(),
      resizeToAvoidBottomPadding: false,
    );
  }
}
