import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gajiku_dev/bloc/GaPasswordEvent.dart';
import 'package:gajiku_dev/bloc/GaPasswordState.dart';
import 'package:gajiku_dev/data/repositories/GaPasswordRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GaPasswordBloc extends Bloc<GaPasswordEvent, GaPasswordState> {
  GaPasswordRepo gaPasswordRepo;
  GaPasswordBloc(this.gaPasswordRepo) : super(InitState()) {
    on<GaPasswordEvent>((event, emit) async {
      var pref = await SharedPreferences.getInstance();
      var token = pref.getString("access_token").toString();
      try {
        if (event is InitEvent) {
          emit(InitState());
        } else if (event is ButtonSendingPressedEvent) {
          emit(SendingState());
          var data = await gaPasswordRepo.changePassword(
              token,
              event.oldPassword,
              event.newPassword,
              event.confirmNewPassword
          );
          final Map<String, dynamic> parsed = jsonDecode(data);
          if (parsed.containsKey("data") && parsed["data"] != null) {
            emit(SentState(message: parsed["data"].toString()));
          } else {
            emit(ErrorState(message: parsed["detail"].toString()));
          }
        } else {
          emit(ErrorState(message: "Terjadi kesalahan"));
        }
      } on Exception {
        emit(ErrorState(message: "Terjadi kesalahan"));
      }

    });
  }
}