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

  Future<void> fetchTodoData([bool fetchAllData = false]) async {
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

    final result = await taskService.getTaskList(offsetNumber, 10, 'TODO');
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

  Future<void> fetchDoingData([bool fetchAllData = false]) async {
    int offsetNumber = 0;
    if (doingData != null) {
      if (isLoadmore.value) {
        int pageNumber = doingData!.pageNumber;
        int totalPages = doingData!.totalPages;
        if (pageNumber < totalPages) {
          offsetNumber = pageNumber + 1;
        } else {
          offsetNumber = pageNumber;
        }
      } else {
        offsetNumber = doingData!.pageNumber;
      }
    }

    final result = await taskService.getTaskList(offsetNumber, 10, 'DOING');
    if (result != null) {
      if (doingData != null) {
        if (result.tasks.isNotEmpty) {
          doingData = result;
          if (doingList.isNotEmpty) {
            doingList.addAll(result.tasks);
          }
        }
      } else {
        doingData = result;
        doingList(result.tasks);
      }
    } else {
      //TODO:Display error alert
    }
  }

  Future<void> fetchDoneData([bool fetchAllData = false]) async {
    int offsetNumber = 0;
    if (doneData != null) {
      if (isLoadmore.value) {
        int pageNumber = doneData!.pageNumber;
        int totalPages = doneData!.totalPages;
        if (pageNumber < totalPages) {
          offsetNumber = pageNumber + 1;
        } else {
          offsetNumber = pageNumber;
        }
      } else {
        offsetNumber = doneData!.pageNumber;
      }
    }

    final result = await taskService.getTaskList(offsetNumber, 10, 'DONE');
    if (result != null) {
      if (doneData != null) {
        if (result.tasks.isNotEmpty) {
          doneData = result;
          if (doneList.isNotEmpty) {
            doneList.addAll(result.tasks);
          }
        }
      } else {
        doneData = result;
        doneList(result.tasks);
      }
    } else {
      //TODO:Display error alert
    }
  }

  Future<void> fetchData(String currentTab) async {
    switch (currentTab) {
      case 'TODO':
        await fetchTodoData();
        break;
      case 'DOING':
        await fetchDoingData();
        break;
      case 'DONE':
        await fetchDoneData();
      default:
    }
  }

  Future<void> onTabTask([String? tab = '']) async {
    var tabKey = '';
    if (tab == '') {
      tabKey = currentTab.value;
    } else {
      tabKey = tab!;
    }
    currentTab.value = tabKey;

    switch (tabKey) {
      case 'TODO':
        await fetchTodoData();
        break;
      case 'DOING':
        await fetchDoingData();
        break;
      case 'DONE':
        await fetchDoneData();
      default:
    }
  }

  Future<void> loadMore() async {
    isLoadmore.value = true;
    await onTabTask();
    isLoadmore.value = false;
  }

  Future<void> scrollerListener() async {
    if ((scrollController.position.maxScrollExtent == scrollController.offset) && !isLoadmore.value) {
      await loadMore();
    }
  }

  Future<void> fetchAllTasks() async {
    await fetchTodoData();
    await fetchDoingData();
    await fetchDoneData();
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchAllTasks();
    scrollController.addListener(scrollerListener);
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.removeListener(scrollerListener);
  }
}
