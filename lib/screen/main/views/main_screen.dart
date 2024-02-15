import 'package:flutter/material.dart';
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
      }
    ],
    "pageNumber": 0,
    "totalPages": 16
  };

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
                        //TODO: Will separate to new widget
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
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return (const Text('Task item'));
                          },
                        ),
                      )
                    ],
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
