import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_application_1/screens/phone_auth/cubit/phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  PhoneAuthCubit() : super(PhoneAuthInitialState());
  String? _verificationId;

  void sendOtp(String phoneNumber) async {
    emit(PhoneAuthLoadingState());
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
        emit(PhoneAuthCodeSentState());
      },
      verificationCompleted: (phoneAuthCredential) {
        signInWithPhone(phoneAuthCredential);
      },
      verificationFailed: (error) {
        emit(PhoneAuthErrorState(error.message.toString()));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _verificationId = verificationId;
      },
    );
  }
  void verifyOtp(String otp) async {
    emit(PhoneAuthLoadingState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId!, smsCode: otp);
      signInWithPhone(credential);
  }
  void signInWithPhone(PhoneAuthCredential credential) async { 
    try {
    UserCredential _userCredential = await _auth.signInWithCredential(credential);
    if (_userCredential.user != null) {
      emit(PhoneAuthLoggedInState( _userCredential.user! ));
    }
    }on FirebaseAuthException catch (exp) {
      emit(PhoneAuthErrorState(exp.message.toString()));
    }
   }
}