import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gajiku_dev/bloc/GaActiEvent.dart';
import 'package:gajiku_dev/bloc/GaActiState.dart';
import 'package:gajiku_dev/data/repositories/GaActiRepo.dart';

class GaActiBloc extends Bloc<GaActiEvent, GaActiState> {
  GaActiRepo gaActiRepo;
  GaActiBloc(this.gaActiRepo) : super(ActiInitState()) {
    on<GaActiEvent>((event, emit) async {
      try {
        if (event is ActiStartEvent) {
          emit(ActiInitState());
        } else if (event is ActiButtonClicked) {
          emit(ActiLoadingState());
          var data = await gaActiRepo.activate(event.acticode);
          final Map<String, dynamic> parsed = jsonDecode(data);
          if (parsed.containsKey("data") && parsed["data"] != null) {
            emit(ActiLoadedState(message: parsed['data'].toString()));
          } else {
            emit(ActiErrorState(message: parsed["detail"].toString()));
          }
        } else {
          emit(ActiErrorState(message: "Terjadi kesalahan"));
        }
      } on Exception {
        emit(ActiErrorState(message: "Terjadi kesalahan"));
      }
    });
  }

}