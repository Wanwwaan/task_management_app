import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management_app/routes/app_routes.dart';
import 'package:task_management_app/services/task_service.dart';

import 'routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (GetPlatform.isMobile) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
  app();
}

void app() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.light,
    theme: ThemeData(textTheme: GoogleFonts.kanitTextTheme()),
    defaultTransition: Transition.fade,
    initialRoute: AppRoutes.passCodeLock,
    getPages: AppPages.getPages,
    initialBinding: BindingsBuilder(() {
      Get.put(TaskService());
    }),
    locale: const Locale('en', 'US'),
    builder: (context, children) {
      return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: Get.textScaleFactor.clamp(0.8, 1.4)),
          child: children!);
    },
  ));
}
