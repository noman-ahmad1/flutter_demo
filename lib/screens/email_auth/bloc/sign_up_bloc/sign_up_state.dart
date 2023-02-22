import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterInitialState extends RegisterState {}

class RegisterValidState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {}