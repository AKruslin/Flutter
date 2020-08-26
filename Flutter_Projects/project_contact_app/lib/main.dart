import 'package:flutter/material.dart';
import 'package:projekt_2_contact_app/model/contact.dart';
import 'package:provider/provider.dart';
import './screens/contact_screen.dart';
import './screens/add_contact_screen.dart';

void main() => runApp(ContactApp());

class ContactApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: ContactBook())],
      child: Consumer<ContactBook>(
        builder: (ctx, contactBook, _) => MaterialApp(
          theme: ThemeData(
              primaryColor: Colors.blue,
              buttonColor: Colors.amber,
              iconTheme: IconThemeData(color: Colors.blue),
              fontFamily: 'LEMONMILK',
              textTheme: TextTheme(
                headline6: TextStyle(fontFamily: 'LEMONMILK'),
                subtitle2: TextStyle(fontFamily: 'LEMONMILK'),
              )),
          debugShowCheckedModeBanner: false,
          title: 'Contact App',
          home: ContactScreen(),
          routes: {
            ContactScreen.routeName: (ctx) => ContactScreen(),
            AddContactScreen.routeName: (ctx) => AddContactScreen(),
          },
        ),
      ),
    );
  }
}
