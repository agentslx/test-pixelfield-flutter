import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../entities/project.dart';

class ProjectFirestoreModel extends ProjectEntity {
  ProjectFirestoreModel(
      {required super.title,
      required super.description,
      required super.status,
      required super.dueDate,
      required super.createdAt,
      required super.routine,
      required super.steps,
      super.id});

  factory ProjectFirestoreModel.fromEntity(ProjectEntity entity) {
    return ProjectFirestoreModel(
        title: entity.title,
        description: entity.description,
        status: entity.status,
        dueDate: entity.dueDate,
        createdAt: entity.createdAt,
        routine: entity.routine,
        steps: entity.steps,
        id: entity.id);
  }

  Map<String, dynamic> toDocument() {
    return {
      'title': title,
      'description': description,
      'status': status.name,
      'dueDate': dueDate.toUtc().toIso8601String(),
      'createdAt': createdAt.toUtc().toIso8601String(),
      'routine': routine.name,
      'steps': steps
          .map((e) => {
                'content': e.content,
                'isFinished': e.isFinished,
              })
          .toList(),
      'id': id
    };
  }

  factory ProjectFirestoreModel.fromSnapshot(DocumentSnapshot snap) {
    final data = snap.data() as Map<String, dynamic>;
    return ProjectFirestoreModel(
        title: data['title'],
        description: data['description'],
        status: ProjectStatus.values
            .firstWhere((element) => element.name == data['status']),
        dueDate: DateTime.parse(data['dueDate']),
        createdAt: DateTime.parse(data['createdAt']),
        routine: ProjectRoutine.values
            .firstWhere((element) => element.name == data['routine']),
        steps: (data['steps'] as List)
            .map((e) =>
                ProjectStep(content: e['content'], isFinished: e['isFinished']))
            .toList(),
        id: snap.id);
  }
}
