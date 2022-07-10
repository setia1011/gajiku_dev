import 'package:equatable/equatable.dart';


class GaProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartEvent extends GaProfileEvent {}
class UpdateButtonPressedEvent extends GaProfileEvent {
  final String email;
  final String name;
  final int idType;
  final int idNumber;
  final String phone;
  final String address;
  UpdateButtonPressedEvent({
    required this.email,
    required this.name,
    required this.idType,
    required this.idNumber,
    required this.phone,
    required this.address
  });
}