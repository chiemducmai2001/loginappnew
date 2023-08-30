// import 'dart:js_interop';

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class TestPage extends StatefulWidget {
//   TestPage({
//     super.key,
//     this.name,
//     this.age,
//     this.birthday,
//   });
//   final controller = TextEditingController();
//   final String? name;
//   final int? age;
//   DateTime? birthday;
//   @override
//   State<TestPage> createState() => _TestPage();
// }

// class _TestPage extends State<TestPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(controller: controller),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 final name = controller.text;
//                 createUser(name: name);
//               },
//               icon: Icon(Icons.add))
//         ],
//       ),
//     );
//   }

//   Future createUser({required String name}) async {
//     final docUser = FirebaseFirestore.instance.collection('users').doc();
//     final user = User(
//         id: docUser.id, name: name, age: 21, birthday: DateTime(2001, 7, 25));
//     final json = user.toJson();
//     await docUser.set(json);
//   }
// }

// class User {
//   String id;
//   final String name;
//   final int age;
//   final DateTime birthday;
//   User(
//       {this.id = '',
//       required this.name,
//       required this.age,
//       required this.birthday});
//   Map<String, dynamic> toJson() =>
//       {'id': id, 'name': name, 'age': age, 'birhday': birthday};
// }
