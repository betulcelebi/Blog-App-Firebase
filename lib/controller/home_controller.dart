import 'package:firebase_login/shared/database_service.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  DatabaseService db = DatabaseService();
  @override
  void onInit() {
    db.addBlog();
    super.onInit();
  }
}
