import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      this.onChanged,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            onChanged: (value) {
              onChanged!(value);
            },
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                fillColor: Colors.grey.shade200,
                filled: true,
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey[500])),
          ),
        ),
      ),
    );
  }
}
