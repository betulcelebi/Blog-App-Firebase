import 'package:firebase_login/api/api_provider.dart';

class ApiRepository {
  final ApiProvider apiProvider;

  ApiRepository({required this.apiProvider});
  Future<dynamic> login(String email, String password) async { //dynamic olan kısımda model çağırılacak
    final res = await apiProvider
        .urlPost("api/login", {"email": email, "password": password});
    if (res.statusCode == 200) {
      return res.body;
    }
  }
}
