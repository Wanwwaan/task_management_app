import 'package:get/get.dart';
import 'package:task_management_app/constants/tab_key.dart';

class MainController extends GetxController {
  final RxString tabKey = TabKey.todo.obs;

  void onTabTask(String key) {
    tabKey.value = key;
  }
}
