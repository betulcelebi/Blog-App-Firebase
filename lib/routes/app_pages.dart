import 'package:firebase_login/bindings/home_binding.dart';
import 'package:firebase_login/bindings/login_binding.dart';
import 'package:firebase_login/bindings/register_binding.dart';
import 'package:firebase_login/pages/home.dart';
import 'package:firebase_login/pages/login.dart';
import 'package:firebase_login/pages/register.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: Routes.REGISTER,
        page: () => RegisterPage(),
        binding: RegisterBinding()),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
  ];
}
