part of 'project_bloc.dart';

abstract class ProjectEvent {}

class LoadProjects extends ProjectEvent {
  final bool isLoadMore;
  final bool isRefresh;

  LoadProjects({
    this.isLoadMore = false,
    this.isRefresh = false,
  });
}

class AddProjects extends ProjectEvent {
  final String title;
  final DateTime dueDate;
  final ProjectRoutine routine;
  final List<ProjectStep> steps;
  final File? scene;

  AddProjects({
    required this.title,
    required this.dueDate,
    required this.routine,
    required this.steps,
    required this.scene,
  });
}

class EditProjects extends ProjectEvent {
  final ProjectEntity project;

  EditProjects({required this.project});
}

class DeleteProjects extends ProjectEvent {
  final ProjectEntity project;

  DeleteProjects({required this.project});
}

class ViewProject extends ProjectEvent {
  final ProjectEntity project;

  ViewProject({required this.project});
}
