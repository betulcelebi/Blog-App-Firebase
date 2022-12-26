import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login/shared/database_service.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  DatabaseService db = DatabaseService();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxString databaslik = "".obs;
  String? dataicerik;
  RxList<dynamic> liste = [].obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  var data;

  getData() async {
    data = await db.getBlog();
    print(data);
    print(data["Title"]);

    databaslik.value = data["Title"];
    firestore.collection("blog").snapshots().listen((event) {
      for (var element in event.docs) {
        liste.add(element);
      }
      print("aaaaaaaaaaaaaa ${liste}");
    });
    // data = await db.collection("yazilar").doc("yazi1").get();
    update();
    // update();
  }
}
