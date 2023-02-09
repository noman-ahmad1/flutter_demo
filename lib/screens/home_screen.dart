import 'package:flutter/material.dart';
import 'package:practice_application_1/screens/sign_in_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home Screen'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                       color: Colors.black54,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    height: 50,
                    width: 300,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignInScreen()));
                      },
                      child: const Center(
                        child: Text('Sign In With Phone Number 123',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        ),
                      ),
                    )),
                ),
                const SizedBox(
                  height: 10,
                ),
                  Center(
                    child: Container(
                    decoration: BoxDecoration(
                       color: Colors.black54,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    height: 50,
                    width: 300,
                    child: GestureDetector(
                      child: const Center(
                        child: Text('Sign In Using Google',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        ),
                      ),
                    )),
                  ),
              ],
            ),
          ),
        ),
    );
  }
}