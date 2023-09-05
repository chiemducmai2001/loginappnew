import 'package:flutter/material.dart';
import 'package:loginapp/auth/login_or_register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginapp/pages/user/add_user.dart';
import 'package:loginapp/pages/home_page.dart';
import 'package:loginapp/pages/pratice_UI/coffe_homepage.dart';
import 'package:loginapp/pages/test_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FireBase Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginOrRegister(),
    );
  }
}
