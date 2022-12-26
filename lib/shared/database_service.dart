import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DatabaseService extends GetxService {
  Future<DatabaseService> init() async {
    return this;
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  addBlog() async {

    var data=firestore
    .collection('blog')
    .doc("TN7dSbHkGNdfE35QAIXo")
    .get()
    .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
      }
    });
    print(data);
  }
}
