import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/image_path.dart';
import '../../../../utils/date_helper.dart';

class TaskList extends StatelessWidget {
  final List tasksData;
  final Color bg;

  const TaskList({
    super.key,
    required this.tasksData,
    required this.bg, //TODO: this will remove after add tabs screen for each tab
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: bg,
        child: GroupedListView(
          shrinkWrap: true,
          elements: tasksData,
          groupBy: ((element) => DateHelper.dateGroupSeparator(element['createdAt'])),
          order: GroupedListOrder.ASC,
          groupSeparatorBuilder: (value) {
            return Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.eclipse,
                ),
              ),
            );
          },
          itemComparator: (item1, item2) => item1['createdAt'].compareTo(item2['createdAt']),
          itemBuilder: (context, task) {
            return Container(
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
                          task['title'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.gray,
                          ),
                        ),
                        Text(
                          task['description'],
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
            );
          },
        ),
      ),
    );
  }
}
