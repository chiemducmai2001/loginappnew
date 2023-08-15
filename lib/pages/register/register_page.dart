import 'package:flutter/material.dart';
import 'package:loginapp/components/button.dart';
import 'package:loginapp/components/text_field.dart';
import 'package:loginapp/pages/register/components/header.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
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

  Widget buildConfirmPassword() {
    return MyTextField(
        controller: confirmPasswordTextController,
        hintText: 'Confirm Password',
        obscureText: true);
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
                HeaderWidget(),
                const SizedBox(
                  height: 25,
                ),
                buildEmail(),
                const SizedBox(
                  height: 10,
                ),
                buildPassword(),
                const SizedBox(
                  height: 10,
                ),
                buildConfirmPassword(),
                // confirm password
                const SizedBox(
                  height: 10,
                ),

                //sign in button
                const SizedBox(
                  height: 10,
                ),
                MyButton(onTap: () {}, text: 'Sign Up'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account ?'),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        ' Login now ',
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
