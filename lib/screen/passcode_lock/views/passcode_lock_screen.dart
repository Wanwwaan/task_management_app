import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:get/get.dart';
import 'package:task_management_app/constants/app_colors.dart';
import 'package:task_management_app/constants/app_constants.dart';

import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';

class PasscodeLockScreen extends StatefulWidget {
  const PasscodeLockScreen({super.key});

  @override
  State<PasscodeLockScreen> createState() => _PasscodeLockScreenState();
}

class _PasscodeLockScreenState extends State<PasscodeLockScreen> {
  final _authService = Get.find<AuthService>();

  void inputCorrectPasscode() {
    _authService.setIsAuth(true);
  }

  Future<void> navigateToNextScreen(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 150));
    Get.offNamed(AppRoutes.main);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        color: AppColors.primary,
        child: ScreenLock(
          correctString: AppConstants.passcode,
          onUnlocked: () => {
            setState(() {
              
            inputCorrectPasscode();
            navigateToNextScreen(context);
            })
          },
        ),
      ),
    );
  }
}
