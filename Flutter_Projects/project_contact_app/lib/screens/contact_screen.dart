import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:projekt_2_contact_app/model/contact.dart';
import 'package:provider/provider.dart';

import '../widget/contact_list.dart';

class ContactScreen extends StatelessWidget {
  static const routeName = '/contact-screen';

  @override
  Widget build(BuildContext context) {
    final book = Provider.of<ContactBook>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpeg'),
                fit: BoxFit.cover)),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    if (book.isFull()) {
                      showDialog(
                          context: context,
                          child: AlertDialog(
                            title: Text('You have filled your list!'),
                            content: Text('Would you like to go PRO?'),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('No')),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Yes'))
                            ],
                          ));
                    } else {
                      Navigator.of(context).pushNamed('/add-contact-screen');
                    }
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.amber,
                    size: 60,
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
            CircularPercentIndicator(
              linearGradient: LinearGradient(
                colors: [Colors.amber, Colors.green, Colors.blue[200]],
              ),
              curve: Curves.decelerate,
              animateFromLastPercent: true,
              animation: true,
              animationDuration: 1000,
              radius: 110.0,
              //progressColor: Colors.amber,
              percent: book.percent,
              backgroundColor: Colors.white,
              center: Image.asset(
                'assets/images/avatar.png',
                width: 100,
              ),
            ),
            SizedBox(height: 50),
            ContactList(),
          ],
        ),
      ),
    );
  }
}
