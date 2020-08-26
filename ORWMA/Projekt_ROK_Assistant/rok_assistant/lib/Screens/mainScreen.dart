import 'package:flutter/material.dart';
import './speedupScreen.dart';
import './resourceScreen.dart';
import './buildingScreen.dart';
import './researchScreen.dart';
///////////////////////////////////////////////////

void selectSpeedUp(BuildContext ctx) {
  Navigator.of(ctx).pushNamed(
    SpeedUpScreen.routeName,
  );
}

void selectResourceCalc(BuildContext ctx) {
  Navigator.of(ctx).pushNamed(
    ResourceScreen.routeName,
  );
}

void selectBuildingCalc(BuildContext ctx) {
  Navigator.of(ctx).pushNamed(
    BuildingScreen.routeName,
  );
}

void selectResearchCalc(BuildContext ctx) {
  Navigator.of(ctx).pushNamed(
    ResearchScreen.routeName,
  );
}

///////////////////////////////////////////////////
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rise Of Kingdoms Assistant'),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () => selectBuildingCalc(context),
                child: Card(
                  color: Theme.of(context).accentColor,
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    padding: EdgeInsets.symmetric(vertical: 35),
                    child: Text(
                      'Building calculator',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: ()=>selectResearchCalc(context),
                child: Card(
                  color: Theme.of(context).accentColor,
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    padding: EdgeInsets.symmetric(vertical: 35),
                    child: Text(
                      'Research Calculator',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () => selectResourceCalc(context),
                child: Card(
                  color: Theme.of(context).accentColor,
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    padding: EdgeInsets.symmetric(vertical: 35),
                    child: Text(
                      'Resource Calculator',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () => selectSpeedUp(context),
                child: Card(
                  color: Theme.of(context).accentColor,
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    padding: EdgeInsets.symmetric(vertical: 35),
                    child: Text(
                      'Speed Ups',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
            resizeToAvoidBottomPadding: false,
    );
  }
}
