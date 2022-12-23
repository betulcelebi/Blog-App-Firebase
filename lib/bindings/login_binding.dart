import 'package:firebase_login/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put((LoginController));
  }
}
