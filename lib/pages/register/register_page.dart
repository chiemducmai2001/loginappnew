import 'package:cloud_firestore/cloud_firestore.dart';
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
  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  final phoneNumberTextController = TextEditingController();
  final ageTextController = TextEditingController();
  @override
  void dispose() {
    firstNameTextController.dispose();
    lastNameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
    phoneNumberTextController.dispose();
    ageTextController.dispose();
    super.dispose();
  }

  String? msgFirstName;
  String? msgLastName;
  String? msgPhoneNumber;
  String? msgEmail;
  String? msgPassword;
  String? msgConfirmPassword;
  String? msgAge;
  Widget buildFisrtName() {
    return MyTextField(
        onChanged: (value) {
          msgFirstName = AppValid.validateFullName(value);
          setState(() {});
        },
        controller: firstNameTextController,
        hintText: 'First Name',
        obscureText: false);
  }

  Widget buildLastName() {
    return MyTextField(
        onChanged: (value) {
          msgLastName = AppValid.validateFullName(value);
          setState(() {});
        },
        controller: lastNameTextController,
        hintText: 'Last Name',
        obscureText: false);
  }

  Widget buildEmail() {
    return MyTextField(
        onChanged: (value) {
          msgEmail = AppValid.validateEmail(value);
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
        onChanged: (value) {
          msgConfirmPassword = AppValid.validateConfirmPassword(
              value, passwordTextController.text);
          setState(() {});
        },
        controller: confirmPasswordTextController,
        hintText: 'Confirm Password',
        obscureText: true);
  }

  Widget buildAge() {
    return MyTextField(
        onChanged: (value) {
          msgConfirmPassword =
              AppValid.validateConfirmPassword(value, ageTextController.text);
          setState(() {});
        },
        controller: ageTextController,
        hintText: 'Age',
        obscureText: false);
  }

  Widget buildPhoneNumber() {
    return MyTextField(
        onChanged: (value) {
          msgPhoneNumber = AppValid.validatePhoneNumBer(value);
          setState(() {});
        },
        controller: phoneNumberTextController,
        hintText: 'Phone Number',
        obscureText: false);
  }

  Widget BuildSignInSignUpButton() {
    return SignInSignUpButton(context, false, () {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailTextController.text.trim(),
              password: passwordTextController.text.trim())
          .then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        addUserDetails(
            firstNameTextController.text.trim(),
            lastNameTextController.text.trim(),
            int.parse(ageTextController.text.trim()),
            emailTextController.text.trim());
      }).onError((error, stackTrace) {
        print("Error ${error.toString()}");
      });
    });
  }

  Future addUserDetails(
      String firstName, String lastName, int age, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'age': age,
      'email': email,
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
                    size: 60,
                  ),
                  //welcome back
                  HeaderWidget(),
                  const SizedBox(
                    height: 25,
                  ),
                  buildFisrtName(),
                  if (msgFirstName != null)
                    Text(
                      msgFirstName ?? "",
                      style: const TextStyle(color: Colors.red),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildLastName(),
                  if (msgLastName != null)
                    Text(
                      msgLastName ?? "",
                      style: const TextStyle(color: Colors.red),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildAge(),
                  if (msgAge != null)
                    Text(
                      msgAge ?? "",
                      style: const TextStyle(color: Colors.red),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildEmail(),
                  if (msgEmail != null)
                    Text(
                      msgEmail ?? "",
                      style: const TextStyle(color: Colors.red),
                    ),
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
                  if (msgConfirmPassword != null)
                    Text(
                      msgConfirmPassword ?? "",
                      style: const TextStyle(color: Colors.red),
                    ),
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
