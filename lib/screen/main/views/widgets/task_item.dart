import 'package:flutter/widgets.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/image_path.dart';
import '../../../../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 10,
          ),
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 8,
            right: 8,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                    //title
                    Text(
                      task.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.gray,
                      ),
                    ),
                    //description
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
              Image.asset(
                ImagePath.menu,
                width: 20,
                height: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
