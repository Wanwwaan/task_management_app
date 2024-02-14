import 'package:get/get.dart';
import 'package:task_management_app/routes/app_routes.dart';
import 'package:task_management_app/screen/main/bindings/main_binding.dart';
import 'package:task_management_app/screen/passcode_lock/bindings/passcode_lock_binding.dart';
import 'package:task_management_app/screen/passcode_lock/views/passcode_lock_screen.dart';

import '../screen/main/views/main_screen.dart';

class AppPages {
  static final getPages = [
    GetPage(
      name: AppRoutes.passCodeLock,
      page: () => const PasscodeLockScreen(),
      binding: PasscodeLockBinding(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
  ];
}
