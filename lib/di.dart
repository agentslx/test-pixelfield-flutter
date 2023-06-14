
import 'package:get_it/get_it.dart';
import 'package:test_pixelfield_flutter/features/project/data/project_repository.dart';

class Di {
  Di._();

  static initDi() {
    GetIt.I.registerLazySingleton(() => ProjectRepository());
  }
}