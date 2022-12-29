import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login/controller/home_controller.dart';
import 'package:firebase_login/shared/database_service.dart';
import 'package:get/get.dart';

class BlogController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;
  DatabaseService auth = DatabaseService();
  HomeController homecontroller = Get.find();

  String title = "";
  String author = "";
  String content = "";
}
