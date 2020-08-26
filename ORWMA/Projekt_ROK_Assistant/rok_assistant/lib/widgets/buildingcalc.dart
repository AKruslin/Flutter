import 'package:flutter/material.dart';

class BuildingCalc extends StatefulWidget {
  @override
  _BuildingCalcState createState() => _BuildingCalcState();
}

class Building {
  int id;
  String name;
  double time;

  Building(this.id, this.name, this.time);

  static List<Building> getCompanies() {
    return <Building>[
      Building(1, 'City Hall', 168),
      Building(2, 'Academy', 72),
      Building(3, 'Castle', 88),
      Building(4, 'Stable', 63),
      Building(5, 'Archery Range', 63),
    ];
  }
}

class _BuildingCalcState extends State<BuildingCalc> {
  List<Building> _companies = Building.getCompanies();
  List<DropdownMenuItem<Building>> _dropdownMenuItems;
  Building _selectedBuilding;

  final _econimicBuffController= TextEditingController(text:'0');
  final _shrineBuffController= TextEditingController(text:'0');

  double resultPercentage=0;
  double finalresult=0;

  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedBuilding = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Building>> buildDropdownMenuItems(List buildings) {
    List<DropdownMenuItem<Building>> items = List();
    for (Building building in buildings) {
      items.add(
        DropdownMenuItem(
          value: building,
          child: Text(building.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Building selectedBuilding) {
    setState(() {
      _selectedBuilding = selectedBuilding;
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
      finalresult=(_selectedBuilding.time)*(1-resultPercentage/100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: <Widget>[
            Text("Enter your Building speed buffs", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(
              height:15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Economic buff(%): ',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  width:50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _econimicBuffController,
                  )),
                Text('Shrine buff(%): ',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  width:50,
                  child: TextFormField(
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
                  value: _selectedBuilding,
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
