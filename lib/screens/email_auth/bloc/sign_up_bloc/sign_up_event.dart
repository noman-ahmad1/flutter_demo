import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateAccountEvent extends SignUpEvent {}

class SignUpSubmitEvent extends SignUpEvent {}

class OnPressEvent extends SignUpEvent {}
