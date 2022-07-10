import 'package:equatable/equatable.dart';

class GaAuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginStartEvent extends GaAuthEvent {}

class LoginButtonPressed extends GaAuthEvent {
  final String username;
  final String password;

  LoginButtonPressed({required this.username, required this.password});
}