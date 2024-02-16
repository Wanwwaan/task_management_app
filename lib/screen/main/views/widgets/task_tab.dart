import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../models/tab_task.dart';

class TaskTab extends StatelessWidget {
  final String currentTab;
  final TabTask tab;
  final Function() onTab;

  const TaskTab({
    super.key,
    required this.currentTab,
    required this.tab, 
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    var isTab =  currentTab == tab.key;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteSmoke,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        boxShadow: isTab
            ? [
                const BoxShadow(
                  color: AppColors.coolGray, //New
                  blurRadius: 5,
                  offset: Offset(0, 3),
                )
              ]
            : [],
        gradient: isTab
            ? const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  AppColors.gradientRight,
                  AppColors.gradientLeft,
                ],
              )
            : null,
      ),
      child: GestureDetector(
        onTap: onTab,
        child: Text(
          tab.value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: isTab ? AppColors.white : AppColors.silver,
          ),
        ),
      ),
    );
  }
}
