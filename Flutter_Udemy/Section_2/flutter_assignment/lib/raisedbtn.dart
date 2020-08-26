import 'package:flutter/material.dart';

class RaisedBtn extends StatelessWidget {

  final Function selectHandler;

  RaisedBtn(this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      child:RaisedButton(
        color:Colors.blueGrey,
        textColor:Colors.white,
        child: Text('Change quote'),
        onPressed:selectHandler ,
      )
    );
  }
}