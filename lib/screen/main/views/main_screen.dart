import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/constants/app_colors.dart';
import 'package:task_management_app/constants/tab_key.dart';
import 'package:task_management_app/screen/main/views/widgets/task_tab.dart';
import 'package:task_management_app/screen/main/views/widgets/welcome_text.dart';

import 'widgets/user_avatar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var tabKey = 'To-do';

  void _onTabTask(String txt) {
    setState(() {
      tabKey = txt;
    });
  }

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
              Container(
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Column(
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TaskTab(
                              tabKey: tabKey,
                              tabName: TabKey.todo,
                              onTab: () => _onTabTask(TabKey.todo),
                            ),
                            TaskTab(
                              tabKey: tabKey,
                              tabName: TabKey.doing,
                              onTab: () => _onTabTask(TabKey.doing),
                            ),
                            TaskTab(
                              tabKey: tabKey,
                              tabName: TabKey.done,
                              onTab: () => _onTabTask(TabKey.done),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
