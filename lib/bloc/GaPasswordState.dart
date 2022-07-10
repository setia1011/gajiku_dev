import 'package:equatable/equatable.dart';

class GaPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitState extends GaPasswordState {}
class SendingState extends GaPasswordState {}
class SentState extends GaPasswordState {
  final String message;
  SentState({required this.message});
}
class ErrorState extends GaPasswordState {
  final String message;
  ErrorState({required this.message});
}