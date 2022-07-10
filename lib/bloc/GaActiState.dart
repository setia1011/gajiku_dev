import 'package:equatable/equatable.dart';

class GaActiState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ActiInitState extends GaActiState {}
class ActiLoadingState extends GaActiState {}
class ActiLoadedState extends GaActiState {
  final String message;
  ActiLoadedState({required this.message});
}
class ActiErrorState extends GaActiState {
  final String message;
  ActiErrorState({required this.message});
}