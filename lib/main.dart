import 'package:flutter/material.dart';
import 'package:practice_application_1/screens/home_screen.dart';
import 'package:practice_application_1/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

