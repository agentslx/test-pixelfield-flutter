import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:test_pixelfield_flutter/entities/project.dart';

import '../data/project_repository.dart';

part 'project_events.dart';

part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(ProjectState.empty()) {
    on<LoadProjects>(_loadProjects);
    on<AddProjects>(_addProject);
  }

  final ProjectRepository _projectRepository = GetIt.I.get<ProjectRepository>();
  final Logger logger = GetIt.I.get<Logger>();

  _loadProjects(LoadProjects event, Emitter<ProjectState> emit) async {
    try {
      emit(state.copyWith(
          loading: true,
          listLoadingMore: event.isLoadMore,
          listRefreshing: event.isRefresh));
      var results = await _projectRepository.loadProject();
      print("Result $results");
      emit(state.copyWith(
          loading: false,
          projects: results,
          listLoadingMore: false,
          listRefreshing: false));
    } catch (e, s) {
      logger.e("Error loading projects $e $s");
      emit(state.copyWith(
          loading: false, listLoadingMore: false, listRefreshing: false));
      // TODO show error
    }
  }

  _addProject(AddProjects event, Emitter<ProjectState> emit) async {
    try {
      emit(state.copyWith(loading: true));
      await Future.delayed(const Duration(seconds: 5));
      //
      var result = await _projectRepository.addProject(ProjectEntity(
          title: event.title,
          description: "",
          status: ProjectStatus.draft,
          dueDate: event.dueDate,
          createdAt: DateTime.now(),
          routine: event.routine,
          steps: event.steps));
      emit(state
          .copyWith(loading: false, projects: [...state.projects, result]));
    } catch (e, s) {
      logger.e("Error add project $e $s");

      emit(state.copyWith(loading: false));
      // TODO show error
    }
  }
}
