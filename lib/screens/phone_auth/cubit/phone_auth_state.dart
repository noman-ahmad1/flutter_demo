import 'package:firebase_auth/firebase_auth.dart';

abstract class PhoneAuthState {}

class PhoneAuthInitialState extends PhoneAuthState{}

class PhoneAuthCodeSentState extends PhoneAuthState{}

class PhoneAuthVerifiedState extends PhoneAuthState{}

class PhoneAuthLoggedInState extends PhoneAuthState{
  final User firebaseUser;
  PhoneAuthLoggedInState(this.firebaseUser);
}

class PhoneAuthLoggedOutState extends PhoneAuthState{}

class PhoneAuthErrorState extends PhoneAuthState{
  final String error;
  PhoneAuthErrorState(this.error);
}

class PhoneAuthLoadingState extends PhoneAuthState{}