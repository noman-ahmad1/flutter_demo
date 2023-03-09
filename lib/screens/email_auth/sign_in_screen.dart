import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: const Color(0xffE5E5E5),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 55.0),
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
          Text('Enter E-mail & Password',
          style: GoogleFonts.mulish(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.03,
          ),
            // ignore: prefer_const_constructors
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
            const SizedBox(
              height: 15,
            ),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.01,
               vertical: MediaQuery.of(context).size.height*0.005
               ),
               child: TextField(
                 controller: passwordController,
                 decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: 'Password',
                 ),
                 keyboardType: TextInputType.visiblePassword,
               ),
             ),
            const SizedBox(
              height: 15,
            ),
              GestureDetector(
                onTap: () { 
                  login();
                 }, 
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff002DE3),
                  borderRadius: BorderRadius.circular(30),
                ),
                height: MediaQuery.of(context).size.height*0.07,
                width: MediaQuery.of(context).size.width*0.8,
                child:  Center(
                child: Text('Sign In',
                style: GoogleFonts.mulish(
                  fontSize: 20,fontWeight: FontWeight.w700,
                          color: const Color(0xffE5E5E5
                ),
                ),),
              ),)
              ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: GestureDetector(
                onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen() ),); 
              },
              child: Text('Create an Account',
              style: GoogleFonts.mulish(
                fontSize: 20,
                color:  const Color(0xff002DE3),
              ),
              ),
              ),
            ),
          ],
        ),
    );
  }
}