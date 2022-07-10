part of 'GaClientBloc.dart';

abstract class GaClientEvent extends Equatable {
  const GaClientEvent();

  @override
  List<Object> get props => [];
}

class ClientLoading extends GaClientEvent {}

class ProjectsListLoading extends GaClientEvent {}

class ProjectDetailsLoading extends GaClientEvent {
  final int projectId;
  const ProjectDetailsLoading({required this.projectId});
}

class AddProjectClicked extends GaClientEvent {}

class AddSubscribeClicked extends GaClientEvent {}