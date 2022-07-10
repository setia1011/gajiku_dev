import 'package:http/http.dart' as http;
import 'dart:convert';
import '../api/api.dart';


class GaRegRepo {
  register(String name, String username, String password, String email) async {
    try {
      Map data = {"name": name, "username": username, "password": password, "email": email};
      String body = json.encode(data);
      var res = await http.post(
          Uri.parse(BaseUrl.urlRegister),
          headers: {"Content-Type": "application/json"},
          body: body
      );

      if (res.statusCode == 500) {
        return jsonEncode({"detail": "Terjadi kesalahan"});
      } else {
        return res.body;
      }
    } on Exception catch(e) {
      return e;
    }
  }
}