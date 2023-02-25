// ignore_for_file: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_application_1/screens/dashboard_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practice_application_1/screens/home_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: (FirebaseAuth.instance.currentUser != null) ? const DashboardScreen() : const HomeScreen()
    );
  }
}