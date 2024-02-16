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
                                  currentTab: _mainController.currentTab.value,
                                  tab: TabKey.todo,
                                  onTab: () => _mainController.onTabTask(TabKey.todo.key),
                                ),
                                TaskTab(
                                  currentTab: _mainController.currentTab.value,
                                  tab: TabKey.doing,
                                  onTab: () => _mainController.onTabTask(TabKey.doing.key),
                                ),
                                TaskTab(
                                  currentTab: _mainController.currentTab.value,
                                  tab: TabKey.done,
                                  onTab: () => _mainController.onTabTask(TabKey.done.key),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Obx(
                          () => TaskList(
                              tasksData: _mainController.todoList.value,
                              isLoadMore: _mainController.isLoadmore.value,
                              bg: _mainController.currentTab.value == TabKey.todo.key
                                  ? AppColors.white
                                  : _mainController.currentTab.value == TabKey.doing.key
                                      ? Colors.green
                                      : Colors.deepOrange),
                        ),
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
