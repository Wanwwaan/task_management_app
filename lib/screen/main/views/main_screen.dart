import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/constants/app_colors.dart';
import 'package:task_management_app/constants/tab_key.dart';
import 'package:task_management_app/screen/main/controllers/main_controller.dart';
import 'package:task_management_app/screen/main/views/widgets/task_tab.dart';
import 'package:task_management_app/screen/main/views/widgets/welcome_text.dart';

import 'widgets/task_list.dart';
import 'widgets/user_avatar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _mainController = Get.find<MainController>();

  final data = {
    "tasks": [
      {
        "id": "cbb0732a-c9ab-4855-b66f-786cd41a3cd1",
        "title": "Read a book",
        "description": "Spend an hour reading a book for pleasure",
        "createdAt": "2023-03-24T19:30:00Z",
        "status": "TODO"
      },
      {
        "id": "119a8c45-3f3d-41da-88bb-423c5367b81a",
        "title": "Exercise",
        "description": "Go for a run or do a workout at home",
        "createdAt": "2023-03-25T09:00:00Z",
        "status": "TODO"
      },
      {
        "id": "119a8c45-3f3d-41da-88bb-423c5367b81a",
        "title": "Exercise",
        "description": "Go for a run or do a workout at home",
        "createdAt": "2023-03-25T09:00:00Z",
        "status": "TODO"
      },
      {
        "id": "119a8c45-3f3d-41da-88bb-423c5367b81a",
        "title": "Exercise",
        "description": "Go for a run or do a workout at home",
        "createdAt": "2023-03-25T09:00:00Z",
        "status": "TODO"
      },
      {
        "id": "119a8c45-3f3d-41da-88bb-423c5367b81a",
        "title": "Exercise",
        "description": "Go for a run or do a workout at home",
        "createdAt": "2023-03-25T09:00:00Z",
        "status": "TODO"
      },
    ],
    "pageNumber": 0,
    "totalPages": 16
  };

  List tasks = [
    {
      "id": "cbb0732a-c9ab-4855-b66f-786cd41a3cd1",
      "title": "Read a book",
      "description": "Spend an hour reading a book for pleasure",
      "createdAt": "2023-03-24T19:30:00Z",
      "status": "TODO"
    },
    {
      "id": "cbb0732a-c9ab-4855-b66f-786cd41a3cd1",
      "title": "Read a book2",
      "description": "Spend an hour reading a book for pleasure Spend an hour reading a book for pleasure",
      "createdAt": "2023-03-24T19:40:00Z",
      "status": "TODO"
    },
    {
      "id": "cbb0732a-c9ab-4855-b66f-786cd41a3cd1",
      "title": "Read a book3",
      "description": "Spend an hour reading a book for pleasure Spend an hour reading a book for pleasure",
      "createdAt": "2023-03-24T19:35:00Z",
      "status": "TODO"
    },
    {
      "id": "119a8c45-3f3d-41da-88bb-423c5367b81a",
      "title": "Exercise1",
      "description": "Go for a run or do a workout at home",
      "createdAt": "2023-03-25T09:00:01Z",
      "status": "TODO"
    },
    {
      "id": "119a8c45-3f3d-41da-88bb-423c5367b81a",
      "title": "Exercise3",
      "description": "Go for a run or do a workout at home",
      "createdAt": "2023-03-25T09:00:01Z",
      "status": "TODO"
    },
    {
      "id": "119a8c45-3f3d-41da-88bb-423c5367b81a",
      "title": "Exercise2",
      "description": "Go for a run or do a workout at home",
      "createdAt": "2023-03-25T09:00:01Z",
      "status": "TODO"
    },
    {
      "id": "119a8c45-3f3d-41da-88bb-423c5367b81a",
      "title": "Exercise4",
      "description": "Go for a run or do a workout at home",
      "createdAt": "2023-03-25T09:01:01Z",
      "status": "TODO"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: AppColors.primary,
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: UserAvatar(),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: WelcomeText(),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Obx(
                    () => Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 25,
                          ),
                          height: 48,
                          decoration: const BoxDecoration(
                            color: AppColors.whiteSmoke,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.titaniumWhite, //New
                                blurRadius: 5,
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          //TODO: Will separate to new widget
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TaskTab(
                                  tabKey: _mainController.tabKey.value,
                                  tabName: TabKey.todo,
                                  onTab: () => _mainController.onTabTask(TabKey.todo),
                                ),
                                TaskTab(
                                  tabKey: _mainController.tabKey.value,
                                  tabName: TabKey.doing,
                                  onTab: () => _mainController.onTabTask(TabKey.doing),
                                ),
                                TaskTab(
                                  tabKey: _mainController.tabKey.value,
                                  tabName: TabKey.done,
                                  onTab: () => _mainController.onTabTask(TabKey.done),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TaskList(
                            tasksData: tasks,
                            bg: _mainController.tabKey.value == TabKey.todo
                                ? AppColors.white
                                : _mainController.tabKey.value == TabKey.doing
                                    ? Colors.green
                                    : Colors.deepOrange),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
