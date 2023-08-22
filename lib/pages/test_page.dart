import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPage();
}

class _TestPage extends State<TestPage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(controller: controller),
        actions: [
          IconButton(
              onPressed: () {
                final name = controller.text;
                // createUser(name: name);
              },
              icon: Icon(Icons.add))
        ],
      ),
    );
    Future createUser({required String name}) async {
      final docUser =
          FirebaseFirestore.instance.collection('users').doc('my-id');
    }
  }
}
