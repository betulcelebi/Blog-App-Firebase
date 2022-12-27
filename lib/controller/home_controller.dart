import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login/shared/database_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  DatabaseService db = DatabaseService();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxString databaslik = "".obs;
  RxString datayazar = "".obs;
  RxString dataicerik = "".obs;

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
    datayazar.value = data["Author"];
    dataicerik.value = data["content"];
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

  displayDeleteDialog(String docId) {
    Get.defaultDialog(
      title: "Delete Employee",
      titleStyle: const TextStyle(fontSize: 20),
      middleText: 'Are you sure to delete employee ?',
      textCancel: "Cancel",
      textConfirm: "Confirm",
      confirmTextColor: Colors.black,
      onCancel: () {},
      onConfirm: () {
        db.deleteData(docId);
      },
    );
  }
}
