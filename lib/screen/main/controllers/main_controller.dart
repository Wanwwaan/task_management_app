import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/constants/tab_key.dart';
import 'package:task_management_app/models/task_list.dart';
import 'package:task_management_app/services/task_service.dart';

import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';

class MainController extends GetxController {
  final taskService = Get.find<TaskService>();
  final scrollController = ScrollController();
  final _authService = Get.find<AuthService>();

  var currentTab = TabKey.todoTab.key.obs;
  var isLoading = false.obs;
  var todoData = Rxn<TaskList>();
  var doingData = Rxn<TaskList>();
  var doneData = Rxn<TaskList>();
  var isLoadmore = false.obs;
  var isError = false.obs;
  Timer? appInActiveTimer;

  Future<void> getTasks(String taskStatus, Rxn<TaskList> taskData) async {
    int offsetNumber = 0;

    //Check page number when load more data
    if (taskData.value != null) {
      if (isLoadmore.value) {
        int pageNumber = taskData.value!.pageNumber;
        int totalPages = taskData.value!.totalPages;
        if (pageNumber < totalPages) {
          offsetNumber = pageNumber + 1;
        } else {
          offsetNumber = pageNumber;
        }
      } else {
        offsetNumber = taskData.value!.pageNumber;
      }
    }

    final result = await taskService.getTaskList(offsetNumber, 10, taskStatus);
    //Check if load data first time will add all data to variable, if not will add new data to current value.
    if (result != null) {
      if (taskData.value != null) {
        if (result.tasks.isNotEmpty) {
          taskData.value!.pageNumber = result.pageNumber;
          taskData.value!.totalPages = result.totalPages;
          taskData.value!.tasks.addAll(result.tasks);
        }
      } else {
        taskData.value = result;
      }
    } else {
      if (isError.value) return;
      isError.value = true;
    }
  }

  Future<void> getTodoData() async {
    await getTasks(TabKey.todoTab.key, todoData);
  }

  Future<void> getDoingData() async {
    await getTasks(TabKey.doingTab.key, doingData);
  }

  Future<void> getDoneData([bool fetchAllData = false]) async {
    await getTasks(TabKey.doneTab.key, doneData);
  }

  Future<void> getTaskData(String currentTab) async {
    switch (currentTab) {
      case todo:
        await getTodoData();
        break;
      case doing:
        await getDoingData();
        break;
      case done:
        await getDoneData();
      default:
        break;
    }
  }

  Future<void> onTabTask(String tabKey) async {
    currentTab.value = tabKey;
    await getTaskData(tabKey);
  }

  Future<void> loadMore() async {
    isLoadmore.value = true;
    await getTaskData(currentTab.value);
    isLoadmore.value = false;
  }

  Future<void> scrollerListener() async {
    if ((scrollController.position.maxScrollExtent == scrollController.offset) && !isLoadmore.value) {
      await loadMore();
    }
  }

  Future<void> fetchAllTasks() async {
    await getTodoData();
    await getDoingData();
    await getDoneData();
  }

  void startAppInactiveTimer() {
    appInActiveTimer = Timer.periodic(
      const Duration(seconds: 10),
      (timer) {
        Get.offNamed(AppRoutes.passCodeLock);
        _authService.setIsAuth(false);
        cancelTimer();
      },
    );
  }

  void cancelTimer() {
    if (appInActiveTimer != null) {
      appInActiveTimer!.cancel();
    }
  }

  void stopTimerCountAppInactive() {
    cancelTimer();
  }

  void stopAndStartAppInactiveTimer() {
    stopTimerCountAppInactive();
    startAppInactiveTimer();
  }

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    await fetchAllTasks();
    isLoading.value = false;
    scrollController.addListener(scrollerListener);
  }

  void closeErrorModal() {
    Get.back();
    isError.value = false;
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.removeListener(scrollerListener);
  }
}
