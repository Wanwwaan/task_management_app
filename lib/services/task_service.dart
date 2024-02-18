import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_management_app/models/task_list.dart';

class TaskService extends GetxService {
  Future<TaskList?> getTaskList(int offsetNumber, int limit, String taskStatus) async {
    try {
      final response = await http.get(Uri.parse(
          'https://todo-list-api-mfchjooefq-as.a.run.app/todo-list?offset=$offsetNumber&limit=$limit&sortBy=createdAt&isAsc=true&status=$taskStatus'));
      final tasksMap = json.decode(response.body) as Map<String, dynamic>;
      final taskList = TaskList.fromJson(tasksMap);
      return taskList;
    } catch (e) {
      return null;
    }
  }
}
