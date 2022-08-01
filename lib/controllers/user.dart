import 'package:get/get.dart';

class UserController extends GetxController {
  final RxString _username = "myUserName".obs;

  String get username => _username.value;

  void setUsername(String s) {
    _username.value = s;
    update();
  }
}
