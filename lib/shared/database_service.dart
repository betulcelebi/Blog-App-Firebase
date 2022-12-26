import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DatabaseService extends GetxService {
 FirebaseFirestore db = FirebaseFirestore.instance;
  Future<DatabaseService> init() async {
    return this;
  }

  // DocumentSnapshot<Map<String, dynamic>>? data;
  Future<DocumentSnapshot<Map<String, dynamic>>?>? getBlog() async {
    return await db.collection("blog").doc("TN7dSbHkGNdfE35QAIXo").get();

    //update();
  }
}
