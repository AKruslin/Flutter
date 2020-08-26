import 'package:flutter/material.dart';

class SpeedUpCalc extends StatefulWidget {
  @override
  _SpeedUpCalcState createState() => _SpeedUpCalcState();
}

class _SpeedUpCalcState extends State<SpeedUpCalc> {
  bool switchvalue = false;
  String lastTransaction;
  void onChanged1(newVal) => setState(() {
        switchvalue = newVal;
        if (switchvalue == true) {
          if (lastTransaction == 'Hours') {
            result = result * 24;
          }
          regularOutput = ' hours of speedups';
          lastTransaction = 'Minutes';
        }
        if (switchvalue == false) {
          if (lastTransaction == 'Minutes') {
            result = result / 24;
          }
          regularOutput = ' days of speedups';
          lastTransaction = 'Hours';
        }
      });

  String regularOutput = ' days of speedups';
  double result = 0;
  double resultMinutes = 0;
  //Controlers
  final _1minController = TextEditingController(text: '0');
  final _5minController = TextEditingController(text: '0');
  final _10minController = TextEditingController(text: '0');
  final _15minController = TextEditingController(text: '0');
  final _30minController = TextEditingController(text: '0');
  final _60minController = TextEditingController(text: '0');
  final _3hourController = TextEditingController(text: '0');
  final _8hourController = TextEditingController(text: '0');
  final _15hourController = TextEditingController(text: '0');
  final _24hourController = TextEditingController(text: '0');

  //
  void _submitData() {
    if (_1minController.text.isEmpty ||
        _5minController.text.isEmpty ||
        _10minController.text.isEmpty ||
        _15minController.text.isEmpty ||
        _30minController.text.isEmpty ||
        _60minController.text.isEmpty ||
        _3hourController.text.isEmpty ||
        _8hourController.text.isEmpty ||
        _15hourController.text.isEmpty ||
        _24hourController.text.isEmpty) {
      return;
    }
    if (double.parse(_1minController.text) < 0 ||
        double.parse(_5minController.text) < 0 ||
        double.parse(_10minController.text) < 0 ||
        double.parse(_15minController.text) < 0 ||
        double.parse(_30minController.text) < 0 ||
        double.parse(_60minController.text) < 0 ||
        double.parse(_3hourController.text) < 0 ||
        double.parse(_8hourController.text) < 0 ||
        double.parse(_15hourController.text) < 0 ||
        double.parse(_15hourController.text) < 0) {
      return;
    }
    result = double.parse(_1minController.text) +
        double.parse(_5minController.text) * 50 +
        double.parse(_10minController.text) * 10 +
        double.parse(_15minController.text) * 15 +
        double.parse(_30minController.text) * 30 +
        double.parse(_60minController.text) * 60 +
        double.parse(_3hourController.text) * 60 * 3 +
        double.parse(_8hourController.text) * 60 * 8 +
        double.parse(_15hourController.text) * 60 * 15 +
        double.parse(_24hourController.text) * 60 * 24;
    setState(() {
      if (switchvalue) {
        result = result * 24;
        regularOutput = ' hours of speedups';
        lastTransaction = 'Minutes';
      }
      if (!switchvalue) {
        result = result;
        regularOutput = ' days of speedups';
        lastTransaction = 'Hours';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Card(
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                'Enter number of speed ups',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "1 minute",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _1minController,
                    ),
                  ),
                  Text(
                    "5 minutes",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _5minController,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "10 minutes",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _10minController,
                    ),
                  ),
                  Text(
                    "15 minutes",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _15minController,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "30 minutes",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _30minController,
                    ),
                  ),
                  Text(
                    "60 minutes",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _60minController,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "3 hours",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _3hourController,
                    ),
                  ),
                  Text(
                    "8 hours",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _8hourController,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "15 hours",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _15hourController,
                    ),
                  ),
                  Text(
                    "24 hours",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _24hourController,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                width: 300,
                child: Column(
                  children: <Widget>[
                    Card(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        (result / (60 * 24)).toStringAsFixed(2) + regularOutput,
                        style:
                            TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      margin: EdgeInsets.only(top: 10),
                    ),
                  ],
                ),
              ),
              Text(
                'Toggle for Days/Hours',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Switch(
                value: switchvalue,
                onChanged: onChanged1,
              ),
              RaisedButton(
                splashColor: Colors.teal,
                color: Colors.green,
                onPressed: _submitData,
                child: Text(
                  'Calculate',
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
