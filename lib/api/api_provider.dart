import 'package:firebase_login/api/base_provider.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class ApiProvider extends BaseProvider {
  Future<Response> urlPost(String path, Object data) async {
    return post(path, data); // post işlemi Getconnect'den geliyor
  }

  Future<Response> urlGet(String path) async {
    return get(path); // get işlemi Getconnect'den geliyor
  }
}
