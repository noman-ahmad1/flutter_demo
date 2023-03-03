import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_application_1/screens/email_auth/sign_in_screen.dart';
import 'package:practice_application_1/screens/phone_auth/sign_in_with_phone.dart';
import '../utils/app_refs.dart';

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
            const Image(image: AssetImage(AppRefs.logoImage)),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.3,
          
            ),
            Text('Sign In Using',
            style: GoogleFonts.ibmPlexSans(
              fontSize: 40,
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
                height: 60,
                width: 370,
                child: CupertinoButton(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                  },
                   child: Text('E-mail',style: GoogleFonts.ibmPlexSans(fontSize: 20,fontWeight: FontWeight.w700),),),
              ),
            ),
            Padding(
                 padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 60,
                   width: 370,
                   child: CupertinoButton(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                               onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPhoneScreen()));
                               },
                   child: Text('Phone Number',style: GoogleFonts.ibmPlexSans(fontSize: 20,fontWeight: FontWeight.w700),),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}