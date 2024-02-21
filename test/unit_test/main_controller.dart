import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:task_management_app/constants/tab_key.dart';
import 'package:task_management_app/screen/main/controllers/main_controller.dart';
import 'package:task_management_app/services/auth_service.dart';
import 'package:task_management_app/services/task_service.dart';

void main() {
  late MainController mainController;

  setUp(() {
    Get.put(AuthService());
    Get.put(TaskService());
    Get.put(MainController());
    mainController = Get.find<MainController>();
  });

  tearDown(() {
    Get.delete<MainController>();
  });

  group('Test task 3 tabs', () {
    test('When tab on Todo tab', () async {
      await mainController.onTabTask(TabKey.todoTab.key);
      var currentTab = mainController.currentTab.value;
      expect(currentTab, 'TODO');
    });
    test('When tab on Doing tab', () async {
      await mainController.onTabTask(TabKey.doingTab.key);
      var currentTab = mainController.currentTab.value;
      expect(currentTab, 'DOING');
    });
    test('When tab on Done tab', () async {
      await mainController.onTabTask(TabKey.doneTab.key);
      var currentTab = mainController.currentTab.value;
      expect(currentTab, 'DONE');
    });
  });

  group('Test get task list data from api when called getTask function', () {
    test('When call api successfully, to get todo list with 10 tasks and status is TODO', () async {
      var todoData = mainController.todoData;

      await mainController.getTasks(TabKey.todoTab.key, todoData);
      expect(mainController.todoData.value!.tasks.length, equals(10));
      expect(mainController.todoData.value!.tasks[0].status, equals('TODO'));
    });
    test('When call api successfully, to get doing list with 10 tasks and status is DOING', () async {
      var doingData = mainController.doingData;

      await mainController.getTasks(TabKey.doingTab.key, doingData);
      expect(mainController.doingData.value!.tasks.length, equals(10));
      expect(mainController.doingData.value!.tasks[0].status, equals('DOING'));
    });
    test('When call api successfully, to get done list with 10 tasks and status is DONE', () async {
      var doneData = mainController.doneData;

      await mainController.getTasks(TabKey.doneTab.key, doneData);
      expect(mainController.doneData.value!.tasks.length, equals(8));
      expect(mainController.doneData.value!.tasks[0].status, equals('DONE'));
    });
  });

  group('Test load more task list data from api when called loadMore function', () {
    test('When load more todo list, should get 29 tasks, status is TODO and page number is 3', () async {
      await mainController.onTabTask(TabKey.todoTab.key);
      await mainController.loadMore();
      expect(mainController.todoData.value!.tasks.length, equals(29));
      expect(mainController.todoData.value!.tasks[0].status, equals('TODO'));
      expect(mainController.todoData.value!.pageNumber, equals(3));
    });
    test('When load more doing list, should get 10 tasks, status is DOING and page number is 1', () async {
      await mainController.onTabTask(TabKey.doingTab.key);
      await mainController.loadMore();
      expect(mainController.doingData.value!.tasks.length, equals(10));
      expect(mainController.doingData.value!.tasks[0].status, equals('DOING'));
      expect(mainController.doingData.value!.pageNumber, equals(1));
    });
    test('When load more done list, should get 8 tasks, status is DOING and page number is 1', () async {
      await mainController.onTabTask(TabKey.doneTab.key);
      await mainController.loadMore();
      expect(mainController.doneData.value!.tasks.length, equals(8));
      expect(mainController.doneData.value!.tasks[0].status, equals('DONE'));
      expect(mainController.doneData.value!.pageNumber, equals(1));
    });
  });
}
