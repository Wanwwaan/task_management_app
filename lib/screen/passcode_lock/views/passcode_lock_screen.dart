import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:get/get.dart';
import 'package:task_management_app/constants/app_colors.dart';
import 'package:task_management_app/constants/app_constants.dart';

import '../controllers/passcode_lock_controller.dart';

class PasscodeLockScreen extends StatefulWidget {
  const PasscodeLockScreen({super.key});

  @override
  State<PasscodeLockScreen> createState() => _PasscodeLockScreenState();
}

class _PasscodeLockScreenState extends State<PasscodeLockScreen> {
  final _passcodeLockController = Get.find<PasscodeLockController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        color: AppColors.primary,
        child: ScreenLock(
          correctString: AppConstants.passcode,
          onUnlocked: () {
            _passcodeLockController.inputCorrectPasscode();
            _passcodeLockController.navigateToNextScreen(context);
          },
        ),
      ),
    );
  }
}
