import 'package:get/get.dart';

class AuthService extends GetxService {
  final isAuthed = false.obs;

  void setIsAuth(bool value) {
    isAuthed.value = value;
  }
}
