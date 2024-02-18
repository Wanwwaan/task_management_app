import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/constants/app_colors.dart';
import 'package:task_management_app/constants/image_path.dart';
import 'package:task_management_app/constants/tab_key.dart';
import 'package:task_management_app/screen/main/controllers/main_controller.dart';
import 'package:task_management_app/screen/main/views/widgets/task_tab.dart';
import 'package:task_management_app/screen/main/views/widgets/welcome_text.dart';

import '../../../widgets/error_modal.dart';
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
          child: Stack(
            children: [
              Padding(
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
                                        tab: TabKey.todoTab,
                                        onTab: () => _mainController.onTabTask(TabKey.todoTab.key),
                                      ),
                                      TaskTab(
                                        currentTab: _mainController.currentTab.value,
                                        tab: TabKey.doingTab,
                                        onTab: () => _mainController.onTabTask(TabKey.doingTab.key),
                                      ),
                                      TaskTab(
                                        currentTab: _mainController.currentTab.value,
                                        tab: TabKey.doneTab,
                                        onTab: () => _mainController.onTabTask(TabKey.doneTab.key),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Obx(
                                () => TaskList(
                                    tabKey: _mainController.currentTab.value,
                                    isLoading: _mainController.isLoading.value,
                                    isLoadMore: _mainController.isLoadmore.value,
                                    tasksData: _mainController.currentTab.value == TabKey.todoTab.key
                                        ? _mainController.todoData.value != null
                                            ? _mainController.todoData.value!.tasks
                                            : []
                                        : _mainController.currentTab.value == TabKey.doingTab.key
                                            ? _mainController.doingData.value != null
                                                ? _mainController.doingData.value!.tasks
                                                : []
                                            : _mainController.doneData.value != null
                                                ? _mainController.doneData.value!.tasks
                                                : []),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() => _mainController.isError.value
                  ? ErrorModal(
                      onPressed: () => _mainController.closeErrorModal(),
                    )
                  : const SizedBox())
            ],
          ),
        ),
      ),
    );
  }
}
