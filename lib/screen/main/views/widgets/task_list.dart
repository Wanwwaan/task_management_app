import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:task_management_app/models/task.dart';
import 'package:task_management_app/screen/main/controllers/main_controller.dart';
import 'package:task_management_app/widgets/loading_indicator.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/image_path.dart';
import '../../../../utils/date_helper.dart';
import '../../../../widgets/no_data.dart';

class TaskList extends StatefulWidget {
  final String tabKey;
  final List<Task> tasksData;
  final bool isLoadMore;
  final bool isLoading;

  const TaskList({
    super.key,
    required this.tasksData,
    required this.isLoadMore,
    required this.isLoading,
    required this.tabKey,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    final mainController = Get.find<MainController>();

    return Expanded(
      child: !widget.isLoading
          ? widget.tasksData.isEmpty
              ? const NoData()
              : GroupedListView(
                  key: PageStorageKey(widget.tabKey),
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  controller: mainController.scrollController,
                  elements: widget.tasksData,
                  groupBy: ((element) => DateHelper.dateGroupSeparator(element.createdAt)),
                  order: GroupedListOrder.ASC,
                  groupSeparatorBuilder: (value) {
                    final groupDate = value;
                    final bool isHaveTask = widget.tasksData
                        .where((element) => DateHelper.dateGroupSeparator(element.createdAt) == groupDate)
                        .isNotEmpty;

                    return isHaveTask
                        ? Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
                            child: Text(
                              DateHelper.dateGroupFormat(groupDate),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.eclipse,
                              ),
                            ),
                          )
                        : const SizedBox();
                  },
                  itemComparator: (item1, item2) => item1.createdAt.compareTo(item2.createdAt),
                  itemBuilder: (context, task) {
                    final int taskIndex = widget.tasksData.indexOf(task);
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        setState(() {
                          widget.tasksData.removeAt(taskIndex);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Task deleted'),
                            ),
                          );
                        });
                      },
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 16),
                        color: AppColors.red,
                        child: Image.asset(
                          ImagePath.bin,
                          width: 32,
                          height: 32,
                        ),
                      ),
                      direction: DismissDirection.endToStart,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 10,
                            ),
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                              right: 10,
                            ),
                            decoration: const BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.all(Radius.circular(6)),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.lightGray,
                                    blurRadius: 10,
                                  ),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.topCenter,
                                  decoration: const BoxDecoration(
                                      color: AppColors.gradientLeft,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(2),
                                        bottomRight: Radius.circular(2),
                                      )),
                                  height: 24,
                                  width: 3,
                                ),
                                const SizedBox(
                                  width: 28,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        task.title,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.gray,
                                        ),
                                      ),
                                      Text(
                                        task.description,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: AppColors.darkGray,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Image.asset(
                                    ImagePath.menu,
                                    width: 20,
                                    height: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                          widget.isLoadMore && widget.tasksData.length - 1 == widget.tasksData.indexOf(task)
                              ? const LoadingIndicator()
                              : const SizedBox()
                        ],
                      ),
                    );
                  },
                )
          : const LoadingIndicator(),
    );
  }
}
