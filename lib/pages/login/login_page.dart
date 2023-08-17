import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/components/button.dart';
import 'package:loginapp/components/signInSignUpButtons.dart';
import 'package:loginapp/components/text_field.dart';
import 'package:loginapp/pages/home_page.dart';
import 'package:loginapp/pages/register/register_page.dart';

import 'components/components.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  Widget buildEmail() {
    return MyTextField(
        controller: emailTextController, hintText: 'Email', obscureText: false);
  }

  Widget buildPassword() {
    return MyTextField(
        controller: passwordTextController,
        hintText: 'Password',
        obscureText: true);
  }

  Widget buildSignInButton() {
    return SignInSignUpButton(context, true, () {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailTextController.text,
              password: passwordTextController.text)
          .then((value) => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()))
              });
    });
  }

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

                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                //welcome back
                const HeaderWidget(),
                const SizedBox(
                  height: 25,
                ),

                buildEmail(),
                buildPassword(),
                const SizedBox(
                  height: 10,
                ),
                Container(),
                //sign in button
                const SizedBox(
                  height: 10,
                ),
                buildSignInButton(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member ? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage(
                                      onTap: () {},
                                    )));
                      },
                      child: const Text(
                        ' Register now ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
