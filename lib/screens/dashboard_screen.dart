import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void logOut() async {
    await FirebaseAuth.instance.signOut();
     // ignore: use_build_context_synchronously
            Navigator.popUntil(context, (route) => route.isFirst);
            
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(context, CupertinoPageRoute(builder: ((context) => const HomeScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          // ignore: prefer_const_constructors
          IconButton(onPressed: (){
            logOut();
          }, icon: const Icon(Icons.logout)) 
        ],
        title: const Text('Welcome To Dashboard'),
      ),
      body: const StepProgressIndicator(
    totalSteps: 100,
    currentStep: 32,
    size: 8,
    padding: 0,
    selectedColor: Colors.yellow,
    unselectedColor: Colors.cyan,
    roundedEdges: Radius.circular(10),
    selectedGradientColor: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.yellowAccent, Colors.deepOrange],
    ),
    unselectedGradientColor: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.black, Colors.blue],
    ),
),
    );
  }
}