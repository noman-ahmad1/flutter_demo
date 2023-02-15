import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dashboard_screen.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  TextEditingController otpController = TextEditingController();

  void verifyOTP() async {
    String otp = otpController.text.trim();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      smsCode: otp, verificationId: widget.verificationId);
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        if (userCredential.user != null) {
          // ignore: use_build_context_synchronously
          Navigator.popUntil(context, (route) => route.isFirst);
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context, CupertinoPageRoute(builder: ((context) => const DashboardScreen())));
        }
      }on FirebaseAuthException catch (ex) {
        log(ex.code.toString());
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP'),
        centerTitle: true,
      ),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Padding(
                  padding: const EdgeInsets.fromLTRB(10,10,10,20),
                  child:  TextField(
                    controller: otpController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.output),
                      hintText: 'Enter 6-digit OTP',
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                CupertinoButton(
                  color: Colors.blue,
                  onPressed: (){
                    verifyOTP();
                  },
                  child: const Text('Verify OTP'), 
          ),
        ],
      ),
    );
  }
}