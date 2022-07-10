import 'package:equatable/equatable.dart';


class GaRegEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegStartEvent extends GaRegEvent {}
class RegButtonPressed extends GaRegEvent {
  final String name;
  final String username;
  final String password;
  final String email;
  RegButtonPressed({required this.name, required this.username, required this.password, required this.email});
}
