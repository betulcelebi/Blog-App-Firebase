import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/response/response.dart';

//Burada bütün hata kodlarını yanıt olarak döndürübiliriz. (Satus Code)
Future<dynamic> responseInterceptor(Request request, Response response) async {
  if (response.statusCode != 200) {
    handleErrorStatus(response);
  }
  return response;
}

void handleErrorStatus(Response response) {
  switch (response.statusCode) {
    case 400:
      break;
    default:
  }
  return;
}
