import 'package:equatable/equatable.dart';

class GaPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitEvent extends GaPasswordEvent {}
class ButtonSendingPressedEvent extends GaPasswordEvent {
  final String oldPassword;
  final String newPassword;
  final String confirmNewPassword;
  ButtonSendingPressedEvent({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmNewPassword
  });
}