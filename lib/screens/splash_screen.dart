import 'dart:async';  
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/app_refs.dart';
import 'dashboard_screen.dart';
import 'home_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  
  @override  
  SplashScreenState createState() => SplashScreenState();  
}  
class SplashScreenState extends State<MyHomePage> {  
  @override  
  void initState() {  
    super.initState();  
    Timer(const Duration(seconds: 5),  
            ()=>Navigator.pushReplacement(context,  
            MaterialPageRoute(builder:  
                (context) => (FirebaseAuth.instance.currentUser != null)
              ? const DashboardScreen()
              : const HomeScreen())
            )
    );
  } 
  @override  
  Widget build(BuildContext context) {  
    return Container(  
        color: Colors.white,  
        child: const Image(image: AssetImage(AppRefs.logoImage))  
    );  
  }  
}  
