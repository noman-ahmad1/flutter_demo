import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            height: MediaQuery.of(context).size.height*0.15
          ),
          Text('Enter Your Phone Number',
          style: GoogleFonts.mulish(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          )),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
            child: Text('Please enter your phone number \n without country code',
            textAlign: TextAlign.center,
            style: GoogleFonts.mulish(
              fontSize: 20.0,
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Phone Number',
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.04,
          ),
                GestureDetector(
                  onTap: (){
                        // ignore: prefer_interpolation_to_compose_strings
                        String phone = "+92" + phoneController.text.trim();
                           FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: phone,
                            codeSent: (verificationId, resendToken){
                              Navigator.push(context, MaterialPageRoute(builder: ((context) =>  OtpScreen(verificationId: verificationId)
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
                      },
                  child: Container(
                    decoration: BoxDecoration(
                  color: const Color(0xff002DE3),
                  borderRadius: BorderRadius.circular(30),
                              ),
                              height: MediaQuery.of(context).size.height*0.07,
                              width: MediaQuery.of(context).size.width*0.8,
                      child: Center(
                        child: Text(
                          'Send OTP',
                          style: GoogleFonts.mulish(
                            fontSize:  20,fontWeight: FontWeight.w700,
                            color: const Color(0xffE5E5E5),
                          ),
                          )), 
                  ),
                ),
        ],
      ),
    );
  }
}