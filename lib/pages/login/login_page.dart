import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/components/signInSignUpButtons.dart';
import 'package:loginapp/components/text_field.dart';
import 'package:loginapp/pages/home_page.dart';
import 'package:loginapp/pages/register/register_page.dart';
import 'package:loginapp/utils/app_valid.dart';

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
  String? msgEmail;
  String? msgPassword;
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
        onChanged: (value) {
          msgPassword = AppValid.validatePassword(value);
          setState(() {});
        },
        controller: passwordTextController,
        hintText: 'Password',
        obscureText: true);
  }

  Widget buildSignInButton() {
    /* handle error invalid form
     for example:  Register
     - Họ tên: Nhập vào k chưa kí tự đặc biệt và k dc rỗng
     - phone: Chỉ chưa số 
     - giới tính: chọn 1 trong ba 
     - email: Nhập đúng định dạng
     - password: phải lớn 6 kí tự,...
     - confirm password: true == password

     */
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
      resizeToAvoidBottomInset: false,
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
                const HeaderWidget(),
                const SizedBox(
                  height: 25,
                ),

                buildEmail(),
                const SizedBox(
                  height: 10,
                ),
                if (msgEmail != null)
                  Text(
                    msgEmail ?? "",
                    style: const TextStyle(color: Colors.red),
                  ),
                buildPassword(),
                const SizedBox(
                  height: 10,
                ),
                if (msgPassword != null)
                  Text(
                    msgPassword ?? "",
                    style: const TextStyle(color: Colors.red),
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
