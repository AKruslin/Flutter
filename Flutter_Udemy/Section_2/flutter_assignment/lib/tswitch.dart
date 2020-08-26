import 'package:flutter/material.dart';

class Tswitch extends StatelessWidget {
  final int index;
  Tswitch(this.index);
  
  final List texts = [
    'dobar dan',
    'laku noc',
    'dovidenja',
    'dobro jutro',
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(texts[index]),
    );
  }
}
