import 'package:flutter/material.dart';

class ResourceCalc extends StatefulWidget {
  @override
  _ResourceCalcState createState() => _ResourceCalcState();
}

class _ResourceCalcState extends State<ResourceCalc> {
  int typeOfResource = 1;

  Color colorOfResource = Colors.green;

  String nameOfTheResource = 'Food';

  int  datafield1 = 1000;
  int  datafield2 = 10000;
  int  datafield3 = 50000;
  int  datafield4 = 150000;
  int  datafield5 = 500000;
  int  datafield6 = 1500000;
  
  double result = 0;

  final _dataF1Controller = TextEditingController(text: '0');
  final _dataF2Controller = TextEditingController(text: '0');
  final _dataF3Controller = TextEditingController(text: '0');
  final _dataF4Controller = TextEditingController(text: '0');
  final _dataF5Controller = TextEditingController(text: '0');
  final _dataF6Controller = TextEditingController(text: '0');

  void findResourceCards() {
    if (typeOfResource == 1 || typeOfResource == 2) {
      datafield1 = 1000;
      datafield2 = 10000;
      datafield3 = 50000;
      datafield4 = 150000;
      datafield5 = 500000;
      datafield6 = 1500000;
    } else if (typeOfResource == 3) {
      datafield1 = 750;
      datafield2 = 7500;
      datafield3 = 37500;
      datafield4 = 112500;
      datafield5 = 375000;
      datafield6 = 1125000;
    } else if (typeOfResource == 4) {
      datafield1 = 500;
      datafield2 = 3000;
      datafield3 = 15000;
      datafield4 = 50000;
      datafield5 = 200000;
      datafield6 = 600000;
    }
  }

  void _checkResourceType(int value) {
    setState(() {
      switch (value) {
        case 1:
          typeOfResource = 1;
          nameOfTheResource = 'Food';
          break;
        case 2:
          typeOfResource = 2;
          nameOfTheResource = 'Wood';
          break;
        case 3:
          typeOfResource = 3;
          nameOfTheResource = 'Stone';
          break;
        case 4:
          typeOfResource = 4;
          nameOfTheResource = 'Gold';
          break;
        default:
      }
      findcolorofResource();
      findResourceCards();
      _submitData();
    });
  }

  void findcolorofResource() {
    switch (typeOfResource) {
      case 1:
        colorOfResource = Colors.green;
        //return colorOfResource;
        break;
      case 2:
        colorOfResource = Colors.brown;
        //return colorOfResource;
        break;
      case 3:
        colorOfResource = Colors.blueGrey[600];
        //return colorOfResource;
        break;
      case 4:
        colorOfResource = Colors.amber[300];
        //return colorOfResource;
        break;
      default:
    }
  }

  void _submitData() {
    if (_dataF1Controller.text.isEmpty ||
        _dataF2Controller.text.isEmpty ||
        _dataF3Controller.text.isEmpty ||
        _dataF4Controller.text.isEmpty ||
        _dataF5Controller.text.isEmpty ||
        _dataF6Controller.text.isEmpty) {
      return;
    }
    if (double.parse(_dataF1Controller.text) < 0 ||
        double.parse(_dataF2Controller.text) < 0 ||
        double.parse(_dataF3Controller.text) < 0 ||
        double.parse(_dataF4Controller.text) < 0 ||
        double.parse(_dataF5Controller.text) < 0 ||
        double.parse(_dataF6Controller.text) < 0) {
      return;
    }
    result = double.parse(_dataF1Controller.text) * datafield1 +
        double.parse(_dataF2Controller.text) * datafield2 +
        double.parse(_dataF3Controller.text) * datafield3 +
        double.parse(_dataF4Controller.text) * datafield4 +
        double.parse(_dataF5Controller.text) * datafield5 +
        double.parse(_dataF6Controller.text) * datafield6;
    setState(() {
      result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Pick resource type and then enter number of cards',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: () => _checkResourceType(1),
                  child: Text('Food'),
                  color: Colors.green,
                ),
                FlatButton(
                  onPressed: () => _checkResourceType(2),
                  child: Text('Wood'),
                  color: Colors.brown,
                ),
                FlatButton(
                  onPressed: () => _checkResourceType(3),
                  child: Text('Stone'),
                  color: Colors.blueGrey,
                ),
                FlatButton(
                  onPressed: () => _checkResourceType(4),
                  child: Text('Gold'),
                  color: Colors.amber[300],
                ),
              ],
            ),
            Container(
              height: 15,
              width: double.infinity,
              color: colorOfResource,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(datafield1.toString(),style: TextStyle(fontSize:25, fontWeight: FontWeight.bold),),
                Container(
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _dataF1Controller,
                    
                  ),
                ),
                Text(datafield2.toString(),style: TextStyle(fontSize:25, fontWeight: FontWeight.bold),),
                Container(
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _dataF2Controller,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(datafield3.toString(),style: TextStyle(fontSize:25, fontWeight: FontWeight.bold),),
                Container(
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _dataF3Controller,
                  ),
                ),
                Text(datafield4.toString(),style: TextStyle(fontSize:25, fontWeight: FontWeight.bold),),
                Container(
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _dataF4Controller,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(datafield5.toString(),style: TextStyle(fontSize:25, fontWeight: FontWeight.bold),),
                Container(
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _dataF5Controller,
                  ),
                ),
                Text(datafield6.toString(),style: TextStyle(fontSize:25, fontWeight: FontWeight.bold),),
                Container(
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _dataF6Controller,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 300,
              child: Column(
                children: <Widget>[
                  Card(
                    color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        (result).toString() + ' of ' + nameOfTheResource,
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 20),
                  ),
                ],
              ),
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
    );
  }
}
