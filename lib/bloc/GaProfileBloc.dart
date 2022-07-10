import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gajiku_dev/bloc/GaProfileEvent.dart';
import 'package:gajiku_dev/bloc/GaProfileState.dart';
import 'package:gajiku_dev/data/repositories/GaProfileRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/repositories/GaUserInfoRepo.dart';

class GaProfileBloc extends Bloc<GaProfileEvent, GaProfileState> {
  GaProfileRepo gaProfileRepo;
  GaUserInfoRepo userInfoRepo;
  GaProfileBloc(this.gaProfileRepo, this.userInfoRepo) : super(InitState()) {
    on<GaProfileEvent>((event, emit) async {
      var pref = await SharedPreferences.getInstance();
      var token = pref.getString("access_token").toString();
      try {
        if (event is StartEvent) {
          emit(InitState());
        } else if (event is UpdateButtonPressedEvent) {
          emit(SendingState());
          var data = await gaProfileRepo.update(
            token,
            event.email,
            event.name,
            event.idType,
            event.idNumber,
            event.phone,
            event.address
          );
          final Map<String, dynamic> parsed = jsonDecode(data);
          if (parsed.isNotEmpty) {
            var userInfo = await userInfoRepo.detail(token);
            // Save user information
            pref.setString("email", userInfo['email']);
            pref.setString("name", userInfo['name']);
            pref.setInt("id_type", userInfo['id_type']);
            pref.setString("id_type_name", userInfo['ref_id_type']['id_type']);
            pref.setString("id_number", userInfo['id_number']);
            pref.setString("phone", userInfo['phone']);
            pref.setString("address", userInfo['address']);
            emit(SentState(message: "Berhasil update profile"));
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