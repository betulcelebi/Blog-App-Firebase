import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DatabaseService extends GetxService {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference blog = FirebaseFirestore.instance.collection('blog');
  Future<DatabaseService> init() async {
    return this;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>?>? getBlog() async {
    return await db.collection("blog").doc().get();
  }

  
  Future<void> addBlog(Title, content) async{
    return blog
        .add({'title': Title, 'content': content})
        .then((value) => print("Blog Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
