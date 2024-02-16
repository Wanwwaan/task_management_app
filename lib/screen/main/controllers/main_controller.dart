import 'package:get/get.dart';
import 'package:task_management_app/constants/tab_key.dart';
import 'package:task_management_app/models/task.dart';
import 'package:task_management_app/models/task_list.dart';
import 'package:task_management_app/services/task_service.dart';

class MainController extends GetxController {
  final taskService = Get.find<TaskService>();

  final RxString tabKey = TabKey.todo.key.obs;
  final Rx<List<Task>> todoList = Rx<List<Task>>([]);
  final Rxn<TaskList> todoData = Rxn<TaskList>();

  Future<void> fetchApi() async {
    final result = await taskService.getTaskList(0, 10, tabKey.value);
    if (result != null) {
      todoData.value = result;
      todoList(result.tasks);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchApi();
  }

  void onTabTask(String key) {
    tabKey.value = key;
  }
}
