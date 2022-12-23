import 'package:firebase_login/shared/auth_service.dart';

import 'package:get/get.dart';

class RegisterController extends GetxController {
  String email = "";
  String password = " ";
  AuthService authService = AuthService();
}
