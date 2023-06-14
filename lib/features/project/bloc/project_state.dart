part of 'project_bloc.dart';

class ProjectState {
  final bool loading;
  final bool listLoadingMore;
  final bool listRefreshing;

  final List<ProjectEntity> projects;
  final ProjectEntity? selectedProject;

  ProjectState(
      {required this.loading,
      required this.listLoadingMore,
      required this.listRefreshing,
      required this.projects,
      this.selectedProject,});

  factory ProjectState.empty() {
    return ProjectState(
        loading: false,
        listLoadingMore: false,
        listRefreshing: false,
        projects: [],);
  }

  ProjectState copyWith({
    bool? loading,
    bool? listLoadingMore,
    bool? listRefreshing,
    List<ProjectEntity>? projects,
    ProjectEntity? selectedProject,
  }) {
    return ProjectState(
      loading: loading ?? this.loading,
      projects: [...projects ?? this.projects],
      selectedProject: selectedProject ?? this.selectedProject,
      listLoadingMore: listLoadingMore ?? this.listLoadingMore,
      listRefreshing: listRefreshing ?? this.listRefreshing,
    );
  }
}
