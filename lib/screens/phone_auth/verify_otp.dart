import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP'),
        centerTitle: true,
      ),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Padding(
                  padding: EdgeInsets.fromLTRB(10,10,10,20),
                  child:  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.output),
                      hintText: 'Enter 6-digit OTP',
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                CupertinoButton(
                  color: Colors.blue,
                  onPressed: (){},
                  child: const Text('Verify OTP'), 
                  )
        ],
      ),
    );
  }
}