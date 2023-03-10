import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpInitialState extends SignUpState {}

class SignUpValidState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSubmittedState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  final String? errorMessage;
  SignUpErrorState(String s, {this.errorMessage});
}