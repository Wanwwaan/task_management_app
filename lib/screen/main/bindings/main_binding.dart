import 'package:get/get.dart';
import 'package:task_management_app/screen/main/controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
