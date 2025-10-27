import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';
import 'home_screen.dart';
 // adjust this path if your file is directly under lib/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login UI',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const PrettyLoginScreen(), // 👈 This runs your login screen first
    );
  }
}
