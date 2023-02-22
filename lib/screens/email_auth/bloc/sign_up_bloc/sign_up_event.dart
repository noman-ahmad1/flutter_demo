import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpStartEvent extends SignUpEvent {}

class SignUpSubmitEvent extends SignUpEvent {}
