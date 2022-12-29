import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login/shared/google_analytics.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  // DatabaseService db = DatabaseService();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxString databaslik = "".obs;
  RxString datayazar = "".obs;
  RxString dataicerik = "".obs;
  RxString id = "".obs;
  RxList<DocumentSnapshot> liste = <DocumentSnapshot>[].obs;
  AnalyticsService analyticsService = Get.find();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    liste.clear();
    await firestore.collection("blog").get().then(
          (value) => {
            value.docs.forEach((element) {
              liste.add(element);
            })
          },
        );

    update();
  }

  deleteItem(String id) async {
    await FirebaseFirestore.instance.collection("blog").doc(id).delete();
    update();
  }
}
