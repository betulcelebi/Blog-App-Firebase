import 'package:firebase_login/api/api_repository.dart';
import 'package:firebase_login/shared/auth_service.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
  LoginController({required this.apiRepository});
  final ApiRepository apiRepository;

  AuthService authService = AuthService();
  String email = "";
  String password = "";
  login() {
    apiRepository.login(email, password);
  }
}
