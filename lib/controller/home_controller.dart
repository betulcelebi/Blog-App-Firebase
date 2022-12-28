import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login/shared/database_service.dart';
import 'package:firebase_login/shared/google_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  AnalyticsService analyticsService = Get.find();
  DatabaseService db = DatabaseService();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxString databaslik = "".obs;
  RxString datayazar = "".obs;
  RxString dataicerik = "".obs;
  RxString id = "".obs;

  RxList<dynamic> liste = [].obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  var data;

  getData() async {
    firestore.collection("blog").snapshots().listen((event) {
      for (var element in event.docs) {
        print("bbbbbbbb+$element");
        liste.add(element);
      }
      print(liste.length);
      print("aaaaaaaaaaaaaa ${liste}");
    });

    update();
  }

  deleteItem(id) {
    FirebaseFirestore.instance.collection("blog").doc(id).delete();
  }
}
