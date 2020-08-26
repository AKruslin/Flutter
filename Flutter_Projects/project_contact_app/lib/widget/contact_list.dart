import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/contact.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {

  @override
  Widget build(BuildContext context) {
    final book =Provider.of<ContactBook>(context);
    return Expanded(
      child: ListView.builder(
          itemCount: book.numberOfContacts,
          itemBuilder: (ctx, index) {
            List<Contact> person = [];
            List<int> key = [];
            book.contactBook.forEach((k, v) {
              key.add(k);
              person.add(v);
            });
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  color: Color.fromRGBO(57, 120, 196, 0.6)
                  ),
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  person[index].firstName + ' ' + person[index].lastName,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                subtitle: Text(
                  person[index].phoneNumber,
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 25),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.amber,
                  onPressed: () => book.deleteContact(key[index]),
                ),
              ),
            );
          }),
    );
  }
}
