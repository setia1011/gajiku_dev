import 'package:equatable/equatable.dart';


class GaRegState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegInitState extends GaRegState {}
class RegLoadingState extends GaRegState {}
class RegLoadedState extends GaRegState {
  final String message;
  RegLoadedState({required this.message});
}
class RegErrorState extends GaRegState {
  final String message;
  RegErrorState({required this.message});
}
