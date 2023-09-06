import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../components/text_field.dart';

class AddUsers extends StatelessWidget {
  final id = TextEditingController();
  final fullName = TextEditingController();
  final company = TextEditingController();
  final age = TextEditingController();
  String? msgNotification;
  AddUsers({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      return users
          .add(
            {
              'full_name': fullName.text, // John Doe
              'company': company.text, // Stokes and Sons
              'age': age.text // 42
            },
          )
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    Future<void> addUser2() {
      return users
          .doc(users.id)
          .set(
            {
              'fullname': fullName.text,
              'company': company.text,
              'age': age.text
            },
            SetOptions(merge: true),
          )
          .then((value) => print(
              "'full_name' & 'age' & 'company' merged with existing data!"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    Future<void> updateUser() {
      return users
          .doc(users.id)
          .update({
            'fullname': fullName.text,
            'company': company.text,
            'age': age.text
          })
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    Future<void> deleteUser() {
      return users
          .doc(users.id)
          .delete()
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    Future<void> deletePropertyUser() {
      return users
          .doc(users.id)
          .update({'age': FieldValue.delete()})
          .then((value) => print("User's Property Deleted"))
          .catchError(
              (error) => print("Failed to delete user's property: $error"));
    }

    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Text('Add User Test'),
                  const SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    controller: id,
                    hintText: users.id.toString(),
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    controller: fullName,
                    hintText: 'Full Name',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    controller: company,
                    hintText: 'Company',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    controller: age,
                    hintText: 'age',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      addUser2();
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('Notification User'),
                          content: Text(' Update User'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Add User'),
                  ),
                  TextButton(
                    onPressed: () {
                      updateUser();
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('Notification User'),
                          content: Text(' Update User'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Update User'),
                  ),
                  TextButton(
                    onPressed: () {
                      deleteUser();
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('Notification User'),
                          content: Text(' Delete User'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Delete User'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
