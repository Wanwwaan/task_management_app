import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class TaskTab extends StatelessWidget {
  final String tabKey;
  final String tabName;
  final Function() onTab;

  const TaskTab({
    super.key,
    required this.tabKey,
    required this.tabName, 
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    var isTab =  tabKey == tabName;

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
          tabName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: isTab ? AppColors.white : AppColors.silver,
            // color: AppColors.silver, //inactive
          ),
        ),
      ),
    );
  }
}
