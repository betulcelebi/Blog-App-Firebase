import 'dart:async';


import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<Request> requestInterceptor(request) async {
  request.headers["Authorization"] = ""; //tokeni yazıcaz
  //request.headers["Content Type"] = "asfgsfsghs";
  return request;
}
