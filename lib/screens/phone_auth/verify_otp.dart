import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      resizeToAvoidBottomInset : false,
      backgroundColor: const Color(0xffE5E5E5),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08,
                vertical: MediaQuery.of(context).size.height*0.065),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios)),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.12
          ),
          Text('Enter OTP',
          style: GoogleFonts.mulish(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
            child: Text('We have sent you the sms with \n 6 digit OTP',
            textAlign: TextAlign.center,
            style: GoogleFonts.mulish(
              fontSize: 20,
            ),
            ),
          ),
           SizedBox(
            height: MediaQuery.of(context).size.height*0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.075,
                width: MediaQuery.of(context).size.width*0.14,
                child: TextField(
                  controller: otpController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
              SizedBox(
            height: MediaQuery.of(context).size.height*0.075,
            width: MediaQuery.of(context).size.width*0.14,
            child: TextField(
              controller: otpController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.075,
            width: MediaQuery.of(context).size.width*0.14,
            child: TextField(
              controller: otpController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.075,
            width: MediaQuery.of(context).size.width*0.14,
            child: TextField(
              controller: otpController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.075,
            width: MediaQuery.of(context).size.width*0.14,
            child: TextField(
              controller: otpController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.075,
            width: MediaQuery.of(context).size.width*0.14,
            child: TextField(
              controller: otpController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.04
          ),
                GestureDetector(
                  onTap: (){
                        verifyOTP();
                      },
                  child: Container(
                              decoration: BoxDecoration(
                  color: const Color(0xff002DE3),
                  borderRadius: BorderRadius.circular(30),
                              ),
                              height: MediaQuery.of(context).size.height*0.07,
                              width: MediaQuery.of(context).size.width*0.8,
                      
                      child: Center(
                        child: Text('Verify OTP',
                        style: GoogleFonts.mulish(
                          fontSize: 20,fontWeight: FontWeight.w700,
                          color: const Color(0xffE5E5E5
                        ),
                        ),
                        ),
                      ), 
                            ),
                  ),
        ],
      ),
    );
  }
}