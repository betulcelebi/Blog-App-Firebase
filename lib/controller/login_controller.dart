import 'package:firebase_login/shared/auth_service.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
  AuthService authService = AuthService();
  String email = "";
  String password = "";
}
