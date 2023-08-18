import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/components/signInSignUpButtons.dart';
import 'package:loginapp/components/text_field.dart';
import 'package:loginapp/pages/home_page.dart';
import 'package:loginapp/pages/login/login_page.dart';
import 'package:loginapp/pages/register/components/header.dart';

import '../../utils/app_valid.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final fullNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  final phoneNumberTextController = TextEditingController();
  String? msgFullName;
  String? msgPhoneNumber;
  Widget buildFullName() {
    return MyTextField(
        onChanged: (value) {
          msgFullName = AppValid.validateFullName(value);
          setState(() {});
        },
        controller: fullNameTextController,
        hintText: 'Full Name',
        obscureText: false);
  }

  Widget buildEmail() {
    return MyTextField(
        onChanged: (value) {
          msgFullName = AppValid.validateFullName(value);
          setState(() {});
        },
        controller: emailTextController,
        hintText: 'Email',
        obscureText: false);
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

  Widget buildPhoneNumber() {
    return MyTextField(
        onChanged: (value) {
          msgPhoneNumber = AppValid.validatePhoneNumBer(value);
        },
        controller: phoneNumberTextController,
        hintText: 'Phone Number',
        obscureText: false);
  }

  Widget BuildSignInSignUpButton() {
    return SignInSignUpButton(context, false, () {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailTextController.text,
              password: passwordTextController.text)
          .then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }).onError((error, stackTrace) {
        print("Error ${error.toString()}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  //welcome back
                  HeaderWidget(),
                  const SizedBox(
                    height: 25,
                  ),
                  buildFullName(),
                  if (msgFullName != null)
                    Text(
                      msgFullName ?? "",
                      style: const TextStyle(color: Colors.red),
                    ),
                  buildEmail(),
                  const SizedBox(
                    height: 10,
                  ),
                  buildPhoneNumber(),
                  if (msgPhoneNumber != null)
                    Text(
                      msgPhoneNumber ?? "",
                      style: const TextStyle(color: Colors.red),
                    ),
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
                  BuildSignInSignUpButton(),
                  //sign in button
                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account ?'),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoginPage(onTap: () {})));
                        },
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
      ),
    );
  }
}
