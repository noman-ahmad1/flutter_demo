import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_application_1/screens/email_auth/sign_in_screen.dart';
import 'package:practice_application_1/screens/phone_auth/sign_in_with_phone.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: Center(
        child: Column(
          children: [
             Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.29),
              child: const Image(image: AssetImage('assets/Framelogo.png')),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.04,
            ),
            Center(
              child: Text('Connect easily with \n your family and friends \n over countries',
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(
                fontSize: 30,
                fontWeight: FontWeight.w800
              ),
              )),
               SizedBox(
              height: MediaQuery.of(context).size.height*0.15,
              ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('Sign In Using',
              style: GoogleFonts.mulish(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            GestureDetector(
               onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
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
                      'E-mail',
                      style: GoogleFonts.mulish(
                        fontSize: 20,fontWeight: FontWeight.w700,
                        color: const Color(0xffE5E5E5),
                        ),)),),
              ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            GestureDetector(
              onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPhoneScreen()));
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
                    'Phone Number',
                    style: GoogleFonts.mulish(
                      fontSize: 20,fontWeight: FontWeight.w700,
                      color: const Color(0xffE5E5E5),
                      ),)),),
              ),
          ],
        ),
      ),
    );
  }
}