import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void createAccount() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if(email == "" || password == "" || confirmPassword == "") {
      log("Please fill all the details!");
    }
    else if(password != confirmPassword) {
      log("Passwords do not match!");
    }
    else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        if(userCredential.user != null) {
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
        }
      } on FirebaseAuthException catch(ex) {
        log(ex.code.toString());
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: const Color(0xffE5E5E5),
      body: Column(
        children: [
          Row(
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
          Text('Sign Up',
          style: GoogleFonts.mulish(
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),
          ),
            SizedBox(
            height: MediaQuery.of(context).size.height*0.01,
          ),
          Text('Sign Up to join no.1 Chatting App \n & enjoy messaging',
          textAlign: TextAlign.center,
          style: GoogleFonts.mulish(
            fontSize: 20,
          ),
          ),
            SizedBox(
            height: MediaQuery.of(context).size.height*0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width*0.01,
               vertical: MediaQuery.of(context).size.height*0.005
              ),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email Address',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width*0.01,
               vertical: MediaQuery.of(context).size.height*0.005
              ),
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Password',
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width*0.01,
               vertical: MediaQuery.of(context).size.height*0.005
              ),
            child: TextField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Confirm Password',
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
            SizedBox(
            height: MediaQuery.of(context).size.height*0.03,
          ),
          GestureDetector(
                onTap: () {
                  createAccount();
                },
                child: Container(
                  decoration: BoxDecoration(
                  color: const Color(0xff002DE3),
                  borderRadius: BorderRadius.circular(30),
                ),
                height: MediaQuery.of(context).size.height*0.07,
                width: MediaQuery.of(context).size.width*0.8,
                  child: Center(
                    child: Text('Sign Up',
                    style: GoogleFonts.mulish(
                      fontSize: 20,fontWeight: FontWeight.w700,
                      color: const Color(0xffE5E5E5,
                    ))),
              ),),),
        ],
      ),
    );
  }
}
