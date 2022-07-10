import 'package:http/http.dart' as http;
import 'dart:convert';
import '../api/api.dart';


class GaUserInfoRepo {
  detail(String token) async {
    var res = await http.get(
        Uri.parse(BaseUrl.urlUserDetail),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        }
    );

    if (res.statusCode == 200) {
      return json.decode(res.body);
    } else {
      return "Auth problem";
    }
  }
}