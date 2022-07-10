import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gajiku_dev/data/models/my_project_details_model.dart';
import 'package:gajiku_dev/data/models/my_project_details_v2_model.dart';
import 'package:gajiku_dev/data/models/my_project_list_model.dart';
import 'package:gajiku_dev/data/repositories/GaClientRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'GaClientEvent.dart';
part 'GaClientState.dart';

class GaClientBloc extends Bloc<GaClientEvent, GaClientState> {
  GaClientRepo clientRepo;
  GaClientBloc(this.clientRepo) : super(ClientInitial()) {
    on<ClientLoading>((event, emit) async {
      var pref = await SharedPreferences.getInstance();
      var token = pref.getString("access_token").toString();
      var myProjectsListt = await clientRepo.clientProjectsList(token);
      emit(ClientLoaded(myProjectsListt));
    });

    on<ProjectsListLoading>((event, emit) async {
      var pref = await SharedPreferences.getInstance();
      var token = pref.getString("access_token").toString();
      var myProjectsListt = await clientRepo.clientProjectsList(token);
      emit(ProjectsListLoaded(myProjectsListt));
    });

    on<ProjectDetailsLoading>((event, emit) async {
      var pref = await SharedPreferences.getInstance();
      var token = pref.getString("access_token").toString();
      var myProjectDetails = await clientRepo.clientProjectDetails(token, event.projectId);
      emit(ProjectDetailsLoaded(myProjectDetails));
    });

    on<AddProjectClicked>((event, state) {
      if (state is ClientLoaded) {}
    });

    on<AddSubscribeClicked>((event, state) {
      if (state is ClientLoaded) {}
    });
  }
}