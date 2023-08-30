import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/text_field.dart';

class AddUsers extends StatelessWidget {
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
          .add({
            'full_name': fullName.text, // John Doe
            'company': company.text, // Stokes and Sons
            'age': age.text // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Text('Add User Test'),
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
                      addUser();
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('Notification User'),
                          content: Text(' Added User'),
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
                  // ElevatedButton(
                  //   onPressed: () {
                  //     addUser();
                  //   },
                  //   child: Text(
                  //     'Add user',
                  //     style: TextStyle(
                  //         color: Colors.black26,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 16),
                  //   ),
                  //   style: ButtonStyle(backgroundColor:
                  //       MaterialStateProperty.resolveWith((states) {
                  //     if (states.contains(MaterialState.pressed)) {
                  //       return Colors.black26;
                  //     }
                  //     return Colors.white;
                  //   })),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
