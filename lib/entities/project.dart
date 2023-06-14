class ProjectEntity {
  final String? id;
  final String title;
  final String description;
  final ProjectStatus status;
  final DateTime dueDate;
  final ProjectRoutine routine;
  final List<ProjectStep> steps;
  final DateTime createdAt;

  double get progress =>
      steps.where((step) => step.isFinished).length / steps.length;

  ProjectEntity(
      {required this.title,
      required this.description,
      required this.status,
      required this.dueDate,
      required this.createdAt,
      required this.routine,
      required this.steps,
      this.id});
}

class ProjectStep {
  final String content;
  final bool isFinished;

  ProjectStep({required this.content, required this.isFinished});
}

enum ProjectStatus { draft, inProgress, finished, cancelled }

enum ProjectRoutine { none, daily, weekdays, weekly, monthly, yearly }
