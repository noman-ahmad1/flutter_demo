import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_application_1/screens/email_auth/sign_in_screen.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void logOut() async {
    await FirebaseAuth.instance.signOut();
     // ignore: use_build_context_synchronously
            Navigator.popUntil(context, (route) => route.isFirst);
            
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(context, CupertinoPageRoute(builder: ((context) => const SignInScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          // ignore: prefer_const_constructors
          IconButton(onPressed: (){
            logOut();
          }, icon: const Icon(Icons.logout)) 
        ],
        title: const Text('Welcome To Dashboard'),
      )
    );
  }
}