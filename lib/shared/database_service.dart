import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/customfullscreen.dart';
import '../widgets/customsnackbar.dart';

class DatabaseService extends GetxService {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference blog = FirebaseFirestore.instance.collection('blog');
  Future<DatabaseService> init() async {
    return this;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>?>? getBlog() async {
    return await db.collection("blog").doc("BCAqFBXSkFdrUz0iYUHp").get();
  }

  Future<void> addBlog(Title, content) async {
    return await blog
        .add({'title': Title, 'content': content})
        .then((value) => print("Blog Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> deleteData(String docId) async {
    CustomFullScreenDialog.showDialog();
    blog.doc(docId).delete().whenComplete(() {
      CustomFullScreenDialog.cancelDialog();
      Get.back();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Blog Post Deleted",
          message: "Blog post deleted successfully",
          backgroundColor: Colors.green);
    }).catchError((error) {
      CustomFullScreenDialog.cancelDialog();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Error",
          message: "Something went wrong",
          backgroundColor: Colors.red);
    });
  }
}
