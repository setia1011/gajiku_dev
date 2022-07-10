import 'package:equatable/equatable.dart';


class GaAuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends GaAuthState {}

class LoginInitState extends GaAuthState {}

class LoginLoadingState extends GaAuthState {}

class ClientLoginSuccessState extends GaAuthState {}

class AdminLoginSuccessState extends GaAuthState {}

class ManagerLoginSuccessState extends GaAuthState {}

class SuperLoginSuccessState extends GaAuthState {}

class LoginErrorState extends GaAuthState {
  final String message;
  LoginErrorState({required this.message});
}