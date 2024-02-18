import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';

class PasscodeLockController extends GetxController {
  final authService = Get.find<AuthService>();

  void inputCorrectPasscode() {
    authService.setIsAuth(true);
  }

  Future<void> navigateToNextScreen(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 150));
    Get.offNamed(AppRoutes.main);
  }
}
