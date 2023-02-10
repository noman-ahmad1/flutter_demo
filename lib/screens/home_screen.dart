import 'package:flutter/material.dart';
import 'package:practice_application_1/screens/email_auth/sign_in_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Log In'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                 // ignore: prefer_const_constructors
                 TextField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Email Address',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration:  InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Password',
                  ),
                ),
                Center(
                  child: Container(
                    height: _mediaQuery.size.height * 0.05,
                    width: _mediaQuery.size.width * 0.3,
                    decoration: const BoxDecoration(
                      
                    ),
                    child: GestureDetector(
                      
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}