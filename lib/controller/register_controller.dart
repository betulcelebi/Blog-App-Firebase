import 'package:firebase_login/shared/auth_service.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  AuthService authService = AuthService();
  String email = "";
  String password = "";
}
