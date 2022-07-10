import 'package:equatable/equatable.dart';

class GaActiEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ActiStartEvent extends GaActiEvent {}
class ActiButtonClicked extends GaActiEvent {
  final String acticode;
  ActiButtonClicked({required this.acticode});
}