import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:practice_application_1/screens/phone_auth/verify_otp.dart';

class SignInPhoneScreen extends StatefulWidget {
  const SignInPhoneScreen({super.key});

  @override
  State<SignInPhoneScreen> createState() => _SignInPhoneScreenState();
}

class _SignInPhoneScreenState extends State<SignInPhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Padding(
                  padding: EdgeInsets.fromLTRB(10,10,10,20),
                  child:  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.phone),
                      hintText: 'Phone Number',
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                CupertinoButton(
                  color: Colors.blue,
                  onPressed: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => const OtpScreen()));
                  },
                  child: const Text('Send OTP'), 
                  )
        ],
      ),
    );
  }
}