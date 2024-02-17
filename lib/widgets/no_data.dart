import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/image_path.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Image.asset(
            ImagePath.empty,
            width: 100,
            height: 100,
          ),
        ),
        const Text(
          'No Task',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.cement,
          ),
        )
      ],
    );
  }
}
