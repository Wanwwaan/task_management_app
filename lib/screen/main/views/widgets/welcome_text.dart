import 'package:flutter/material.dart';
import 'package:task_management_app/constants/app_colors.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi! User",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.cement,
          ),
        ),
        Text(
          "Let's manage your tasks :D ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.cement,
          ),
        ),
      ],
    );
  }
}
