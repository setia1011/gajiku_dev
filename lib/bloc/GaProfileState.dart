import 'package:equatable/equatable.dart';


class GaProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitState extends GaProfileState {}
class LoadingState extends GaProfileState {}
class LoadedState extends GaProfileState {}

class SendingState extends GaProfileState {}
class SentState extends GaProfileState {
  final String message;
  SentState({required this.message});
}
class ErrorState extends GaProfileState {
  final String message;
  ErrorState({required this.message});
}
