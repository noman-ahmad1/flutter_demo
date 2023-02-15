import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_application_1/screens/email_auth/sign_in_screen.dart';
import 'package:practice_application_1/screens/phone_auth/sign_in_with_phone.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NASA'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/logo.png')),
            const SizedBox(
              height: 300,
              width: 100,
            ),
            const Text('Sign In Using',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
            ),
            const SizedBox(
              height: 30,
              width: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 300,
                child: CupertinoButton(
                  color: Colors.blue,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                  },
                   child: const Text('E mail'),),
              ),
            ),
            Padding(
                 padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 50,
                   width: 300,
                   child: CupertinoButton(
                    color: Colors.blue,
                               onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPhoneScreen()));
                               },
                   child: const Text('Phone Number'),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}