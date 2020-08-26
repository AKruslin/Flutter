import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/contact.dart';

class AddContactScreen extends StatefulWidget {
  static const routeName = '/add-contact-screen';

  @override
  _AddContactScreenState createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  String _firstName = 'proba';
  String _lastName = 'proba';
  String _phoneNumber = 'proba';



  @override
  Widget build(BuildContext context) {
    final book=Provider.of<ContactBook>(context);
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
            SizedBox(
              height: 40,
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 400,
              child: Card(
                color: Color.fromRGBO(255, 255, 255, 0.75),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.person_outline,size:100,),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'First name',prefixIcon: Icon(Icons.donut_large),),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Fill the form';
                          }
                        },
                        onChanged: (value) {
                          _firstName = value;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Last name', prefixIcon: Icon(Icons.donut_large)),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Fill the form';
                          }
                        },
                        onChanged: (value) {
                          _lastName = value;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Phone number', prefixIcon: Icon(Icons.phone)),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Fill the form';
                          }
                        },
                        onChanged: (value) {
                          _phoneNumber = value;
                        },
                      ),
                      SizedBox(height: 15,),
                      RaisedButton(
                        onPressed: (){
                          book.addContact(_firstName, _lastName, _phoneNumber);
                          Navigator.pop(context);
                        },
                        child: Text('Add'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
