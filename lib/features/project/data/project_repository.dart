import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_pixelfield_flutter/entities/project.dart';
import 'package:test_pixelfield_flutter/features/project/data/models/project_firestore_model.dart';

class ProjectRepository {
  CollectionReference projects =
      FirebaseFirestore.instance.collection('projects');

  Future<ProjectEntity> addProject(ProjectEntity project) async {
    // Call the user's CollectionReference to add a new user
    ProjectFirestoreModel model = ProjectFirestoreModel.fromEntity(project);
    var result = await projects.add(model.toDocument());
    return ProjectFirestoreModel.fromSnapshot(await result.get());
  }

  Future<List<ProjectEntity>> loadProject({
    int limit = 10,
    String orderBy = 'createdAt',
  }) async {
    // Call the user's CollectionReference to add a new user
    var results = await projects.get();
    return results.docs
        .map((e) => ProjectFirestoreModel.fromSnapshot(e))
        .toList();
  }
}
