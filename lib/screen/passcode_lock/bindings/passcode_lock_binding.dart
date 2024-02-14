import 'package:get/get.dart';
import 'package:task_management_app/screen/passcode_lock/controllers/passcode_lock_controller.dart';

class PasscodeLockBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PasscodeLockController());
  }
}
