import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class PasscodeLockController extends GetxController {
  Future<void> navigateToNextScreen(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 150));
    Get.offNamed(AppRoutes.main);
  }
}
