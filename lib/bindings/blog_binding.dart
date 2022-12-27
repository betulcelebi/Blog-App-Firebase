import 'package:firebase_login/controller/blog_controller.dart';
import 'package:get/get.dart';

class BlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      BlogController(),
    );
  }
}
