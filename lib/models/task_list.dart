import 'package:task_management_app/models/task.dart';

class TaskList {
  List<Task> tasks;
  int pageNumber;
  int totalPages;

  TaskList({
    required this.tasks,
    required this.pageNumber,
    required this.totalPages,
  });

  factory TaskList.fromJson(Map<String, dynamic> json) {
    final tasks = json['tasks'] as List<dynamic>;

    return TaskList(
      tasks: tasks.map((task) => Task.fromJson(task)).toList(),
      pageNumber: json['pageNumber'] as int,
      totalPages: json['totalPages'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'tasks': tasks.map((task) => Task.fromJson(task as Map<String, dynamic>)).toList(),
        'pageNumber': pageNumber,
        'totalPages': totalPages,
      };
}
