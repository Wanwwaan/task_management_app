import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/constants/tab_key.dart';
import 'package:task_management_app/models/task.dart';
import 'package:task_management_app/models/task_list.dart';
import 'package:task_management_app/services/task_service.dart';

class MainController extends GetxController {
  final taskService = Get.find<TaskService>();
  final scrollController = ScrollController();

  var currentTab = TabKey.todo.key.obs;
  TaskList? todoData;
  TaskList? doingData;
  TaskList? doneData;
  RxList<Task> todoList = <Task>[].obs;
  RxList<Task> doingList = <Task>[].obs;
  RxList<Task> doneList = <Task>[].obs;
  var isLoadmore = false.obs;

  Future<void> fetchApi() async {
    int offsetNumber = 0;
    if (todoData != null) {
      if (isLoadmore.value) {
        int pageNumber = todoData!.pageNumber;
        int totalPages = todoData!.totalPages;
        if (pageNumber < totalPages) {
          offsetNumber = pageNumber + 1;
        } else {
          offsetNumber = pageNumber;
        }
      } else {
        offsetNumber = todoData!.pageNumber;
      }
    }

    final result = await taskService.getTaskList(offsetNumber, 10, currentTab.value);
    if (result != null) {
      if (todoData != null) {
        if (result.tasks.isNotEmpty) {
          todoData = result;
          if (todoList.isNotEmpty) {
            todoList.addAll(result.tasks);
          }
        }
      } else {
        todoData = result;
        todoList(result.tasks);
      }
    } else {
      //TODO:Display error alert
    }
  }

  Future<void> onTabTask(String key) async {
    currentTab.value = key;
    await fetchApi();
  }

  Future<void> loadMore() async {
    isLoadmore.value = true;
    await fetchApi();
    isLoadmore.value = false;
  }

  Future<void> scrollerListener() async {
    if ((scrollController.position.maxScrollExtent == scrollController.offset) && !isLoadmore.value) {
      await loadMore();
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchApi();
    scrollController.addListener(scrollerListener);
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.removeListener(scrollerListener);
  }
}
