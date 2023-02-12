import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_application_1/screens/email_auth/sign_up_screen.dart';
import '../dashboard_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email == "" || password == "") {
      log('Please Fill Your Details');
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
          // ignore: unnecessary_null_comparison
          if (userCredential != null) {

           
            // ignore: use_build_context_synchronously
            Navigator.popUntil(context, (route) => route.isFirst);
            
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(context, CupertinoPageRoute(builder: ((context) => const DashboardScreen())));
          }
      } on FirebaseAuthException catch (exp) {
        log(exp.code.toString());
      }
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Sign In'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,10,0),
                  child:  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.email),
                      hintText: 'Email Address',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,10,0),
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.password),
                      hintText: 'Password',
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CupertinoButton(
                  color: Colors.blue,
                  onPressed: () { 
                    login();
                   }, 
                child: const Text('Sign In'),),
                CupertinoButton(
                  onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen() ),); 
                },
                child: const Text('Create an Account'),),
              ],
            ),
          ),
        ),
    );
  }
}