import 'package:flutter/material.dart';
import 'dart:math';

import './tswitch.dart';
import './raisedbtn.dart';

void main() => runApp(_MyAppState());

class _MyAppState extends StatefulWidget {
  @override
  __MyAppStateState createState() => __MyAppStateState();
}
//nista gore pisati

class __MyAppStateState extends State<_MyAppState> {
  var textIndex=0;

  void changeState() {
    var rng = new Random();
    int temp;
    int same=textIndex; 
    temp = rng.nextInt(4);
    setState(() {
      textIndex = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text switcher'),
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Tswitch(textIndex),
            RaisedBtn(changeState)
          ],
        )),
      ),
    );
  }
}
