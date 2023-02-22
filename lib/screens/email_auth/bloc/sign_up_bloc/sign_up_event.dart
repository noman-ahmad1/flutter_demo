import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterStartEvent extends RegisterEvent {}

class RegisterSubmitEvent extends RegisterEvent {}
