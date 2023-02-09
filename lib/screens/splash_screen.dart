import 'package:flutter/material.dart';
import 'package:practice_application_1/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;
  @override
  void initState() {
    super.initState();
      startAnimation();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: const [
              Positioned(
                child: Center(
                  child: Image(
                    image: AssetImage(
                      'assets/splash_screen_img1.png'),),
                ),),
            ],
          ),
        ),
      ),
    );
  }
  
 Future startAnimation() async{
  await Future.delayed(const Duration(milliseconds: 500));
  setState(() {
    animate = true;
    });
     await Future.delayed(const Duration(milliseconds: 500));
     // ignore: use_build_context_synchronously
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home Page')));
  }
}