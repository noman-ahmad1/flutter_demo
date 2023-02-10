import 'package:flutter/material.dart';
import 'package:practice_application_1/screens/verify_phone_number.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Sign In With Phone Number'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,10,0),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.phone),
                      hintText: 'Phone Number',
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,10,0),
                  child: Container(
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                      width: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyScreen()));
                      },
                      child: const Center(
                        child: Text('Sign In',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                        )),
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