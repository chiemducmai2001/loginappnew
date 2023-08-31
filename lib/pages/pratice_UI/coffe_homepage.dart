import 'package:flutter/material.dart';

class CoffeHomePage extends StatefulWidget {
  const CoffeHomePage({super.key});

  @override
  State<CoffeHomePage> createState() => _CoffeHomePage();
}

class _CoffeHomePage extends State<CoffeHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Logo'),
            Icon(
              Icons.person,
              size: 30,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
                child: Row(
              children: [
                Icon(Icons.search),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Passowrd'),
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}
