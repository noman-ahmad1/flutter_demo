
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_application_1/screens/phone_auth/verify_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPhoneScreen extends StatefulWidget {
  const SignInPhoneScreen({super.key});

  @override
  State<SignInPhoneScreen> createState() => _SignInPhoneScreenState();
}

class _SignInPhoneScreenState extends State<SignInPhoneScreen> {

  TextEditingController phoneController = TextEditingController();

  void sendOtp() async {
    // ignore: prefer_interpolation_to_compose_strings
    String phone = "+92" + phoneController.text.trim();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      codeSent: (verificationId, resendToken){
        Navigator.push(context, CupertinoPageRoute(builder: ((context) =>  OtpScreen(verificationId: verificationId)
        )));
      },
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      verificationCompleted: (Credential){},
      verificationFailed: (exp){
        log(exp.code.toString());
      },
      codeAutoRetrievalTimeout: (verificationId) {},
      timeout: const Duration(seconds: 30)
    );

  }

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
          Padding(
                  padding: const EdgeInsets.fromLTRB(10,10,10,20),
                  child:  TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
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
                    sendOtp();
                  },
                  child: const Text('Send OTP'), 
                  )
        ],
      ),
    );
  }
}