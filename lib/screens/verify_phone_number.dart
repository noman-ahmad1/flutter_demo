import 'package:flutter/material.dart';
import 'package:practice_application_1/screens/dashboard_screen.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Phone Number'),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(10,0,10,0),
            child: TextField(
               decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.output),
                        hintText: 'Enter 6-Digit OTP',
                      ),
                      keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,10,0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                      width: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
                      },
                      child: const Center(
                        child: Text('Verify',
                        style:TextStyle(
                          fontSize: 25,
                        )
                        )),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}