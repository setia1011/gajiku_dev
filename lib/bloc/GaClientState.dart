part of 'GaClientBloc.dart';

abstract class GaClientState extends Equatable {
  const GaClientState();
  
  @override
  List<Object> get props => [];
}

class ClientInitial extends GaClientState {}

class ClientLoaded extends GaClientState {
  final List<MyProjectsListModel> myProjectsList;
  const ClientLoaded(this.myProjectsList);
}

class ProjectsListLoaded extends GaClientState {
  final List<MyProjectsListModel> myProjectsList;
  const ProjectsListLoaded(this.myProjectsList);
}

class ProjectDetailsLoaded extends GaClientState {
  // final MyProjectDetailsModel myProjectDetails;
  final MyProjectDetailsV2Model myProjectDetails;
  const ProjectDetailsLoaded(this.myProjectDetails);
}

class ClientError extends GaClientState {
  final String message;
  const ClientError({required this.message});
}
