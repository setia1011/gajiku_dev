import 'package:http/http.dart' as http;
import 'dart:convert';
import '../api/api.dart';


class GaPasswordRepo {
  changePassword(String token, String oldPassword, String newPassword, String confirmNewPassword) async {
    try {
      Map data = {
        "old_password": oldPassword,
        "new_password": newPassword,
        "confirm_new_password": confirmNewPassword
      };
      String body = json.encode(data);
      var res = await http.patch(
          Uri.parse(BaseUrl.urlChangePassword),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          },
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