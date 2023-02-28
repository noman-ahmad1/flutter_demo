// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:practice_application_1/screens/email_auth/bloc/sign_up_bloc/sign_up_event.dart';
// import 'package:practice_application_1/screens/email_auth/bloc/sign_up_bloc/sign_up_state.dart';
// import 'package:practice_application_1/screens/email_auth/sign_up_screen.dart';


  

// class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
//   SignUpBloc(): super (SignUpInitialState()){
//     on<CreateAccountEvent>((event, emit) async {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//     String confirmPassword = confirmPasswordController.text.trim();
//     log("hgfdhgc");
//     if (email == "" || password == "" || confirmPassword == "" ) {
//       emit(SignUpErrorState('Please fill all the details!'));
//     } else if (password != confirmPassword ){
//       emit(SignUpErrorState('Passwords donot match'));
//     }
//     else{
//       try {
//         //Create New Account
//     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
//     if (userCredential.user != null) {
//       emit(SignUpValidState());
//     } 
//       } on FirebaseAuthException catch (exp) {
//         log(exp.code.toString());
//       }
      
//     }
    
//     });
//     on<SignUpSubmitEvent>((event, emit) async{
//       const Center(child: CircularProgressIndicator());
//     });
//     on<OnPressEvent>((event, emit) async{
      
//     });
//   }
  
  
//}