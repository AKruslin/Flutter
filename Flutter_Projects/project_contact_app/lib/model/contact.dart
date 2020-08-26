import 'package:flutter/foundation.dart';

class Contact {
  String name;
  String surname;
  String number;

  Contact(String fname, String lname, String pnumber) {
    name = fname;
    surname = lname;
    number = pnumber;
  }

  String get firstName {
    return name;
  }

  String get lastName {
    return surname;
  }

  String get phoneNumber {
    return number;
  }
}

class ContactBook with ChangeNotifier {

  int max=3;
  Map<int, Contact> contacts = {
    0: Contact('antonio', 'kruslin', '+38591908288'),
    1: Contact('marko', 'kruslin', '+38598845247'),
  };


  Map<int,Contact> get contactBook
  {
    return contacts;
  }

  int get numberOfContacts
  {
    return contacts.length;
  }
  
  double get percent
  {
    return contacts.length/max;
  }

  bool isFull()
  {
    if (max==contacts.length) {
      return true;
    }
    return false;
  }

  void addContact(String fName, String lName, String pNumber) {
    Contact newContact = Contact(fName, lName, pNumber);
    contacts.putIfAbsent(contacts.length, () => newContact);
    notifyListeners();
  }

  void deleteContact(int id) {
      contacts.remove(id);
      notifyListeners();
  }

}
