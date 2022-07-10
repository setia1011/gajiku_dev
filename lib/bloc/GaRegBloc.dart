import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gajiku_dev/bloc/GaRegEvent.dart';
import 'package:gajiku_dev/bloc/GaRegState.dart';
import 'package:gajiku_dev/data/repositories/GaRegRepo.dart';

class GaRegBloc extends Bloc<GaRegEvent, GaRegState> {
  GaRegRepo gaRegRepo;
  GaRegBloc(this.gaRegRepo) : super(RegInitState()) {
    on<GaRegEvent>((event, emit) async {
      try {
        if (event is RegStartEvent) {
          emit(RegInitState());
        } else if (event is RegButtonPressed) {
          emit(RegLoadingState());
          var data = await gaRegRepo.register(
              event.name,
              event.username,
              event.password,
              event.email
          );
          final Map<String, dynamic> parsed = jsonDecode(data);
          if (parsed.containsKey("data") && parsed["data"] != null) {
            emit(RegLoadedState(message: parsed["data"].toString()));
          } else {
            emit(RegErrorState(message: parsed["detail"].toString()));
          }
        } else {
          emit(RegErrorState(message: "Terjadi kesalahan"));
        }
      } on Exception {
        emit(RegErrorState(message: "Terjadi kesalahan"));
      }
    });
  }

}