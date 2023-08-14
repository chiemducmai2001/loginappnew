import 'package:flutter/material.dart';
import 'package:loginapp/components/button.dart';
import 'package:loginapp/components/text_field.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                //logo

                Icon(
                  Icons.lock,
                  size: 100,
                ),
                //welcome back
                const Text("Welcome back, you're been missed!"),
                const SizedBox(
                  height: 25,
                ),

                //email
                MyTextField(
                    controller: emailTextController,
                    hintText: 'Email',
                    obscureText: false),
                //password
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                    controller: passwordTextController,
                    hintText: 'Password',
                    obscureText: true),
                //sign in button
                const SizedBox(
                  height: 10,
                ),
                MyButton(onTap: () {}, text: 'Sign In'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member ? '),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        ' Register now ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    )
                  ],
                )
                //go to reg page
              ],
            ),
          ),
        ),
      ),
    );
  }
}
