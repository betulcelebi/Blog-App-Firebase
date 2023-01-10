import 'package:firebase_login/api/api_constant.dart';
import 'package:firebase_login/api/interceptors/request_interceptor.dart';
import 'package:firebase_login/api/interceptors/response_interceptor.dart';
import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiConstant.baseUrl;
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }
}
