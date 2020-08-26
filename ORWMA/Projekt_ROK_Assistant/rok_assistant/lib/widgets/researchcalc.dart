import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResearchCalc extends StatefulWidget {
  @override
  _ResearchCalcState createState() => _ResearchCalcState();
}

class Research {
  int id;
  String name;
  double time;

  Research(this.id, this.name, this.time);

  static List<Research> getCompanies() {
    return <Research>[
      Research(1, 'Swordsman', 8),
      Research(2, 'Tracking', 12),
      Research(3, 'Leather Armor', 16),
      Research(4, 'Spearman', 80),
      Research(5, 'Combat tactics', 6),
    ];
  }
}

class _ResearchCalcState extends State<ResearchCalc> {
  List<Research> _companies = Research.getCompanies();
  List<DropdownMenuItem<Research>> _dropdownMenuItems;
  Research _selectedResearch;

  final _econimicBuffController= TextEditingController(text:'0');
  final _shrineBuffController= TextEditingController(text:'0');

  double resultPercentage=0;
  double finalresult=0;

  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedResearch = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Research>> buildDropdownMenuItems(List researches) {
    List<DropdownMenuItem<Research>> items = List();
    for (Research research in researches) {
      items.add(
        DropdownMenuItem(
          value: research,
          child: Text(research.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Research selectedResearch) {
    setState(() {
      _selectedResearch = selectedResearch;
    });
  }

  void _submitData()
  {
    if (_econimicBuffController.text.isEmpty || _shrineBuffController.text.isEmpty) {
      return;
    }
    if (double.parse(_econimicBuffController.text)<0 || double.parse(_shrineBuffController.text)<0) {
      return;
    }
    if (double.parse(_econimicBuffController.text)+double.parse(_shrineBuffController.text)>99) {
      return;
    }
    resultPercentage=double.parse(_econimicBuffController.text)+double.parse(_shrineBuffController.text);
    setState(() {
      finalresult=(_selectedResearch.time)*(1-resultPercentage/100);
      });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: <Widget>[
            Text("Enter your Research speed buffs", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Economic buff(%): ',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
                Container(
                  width:50,
                  child: TextFormField(
                    onTap: (){FocusScope.of(context).unfocus();},
                    keyboardType: TextInputType.number,
                    controller: _econimicBuffController,
                  )),
                Text('Shrine buff(%): ',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
                Container(
                  width:50,
                  child: TextFormField(
                    onTap: (){FocusScope.of(context).unfocus();},
                    keyboardType: TextInputType.number,
                    controller: _shrineBuffController,
                  )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DropdownButton(
                  style: TextStyle(fontSize: 26, color: Colors.black),
                  iconSize: 30,
                  underline: Container(height: 1, color: Colors.green),
                  value: _selectedResearch,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(

              width: 240,
              height: 80,
              child:Card(
                color:Colors.green,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical:20),
                  child: Text(finalresult.toStringAsFixed(2)+' hours', style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
                ),
              ),
            ),
            SizedBox(height: 30,),
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
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
