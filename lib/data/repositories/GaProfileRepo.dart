import 'package:http/http.dart' as http;
import 'dart:convert';
import '../api/api.dart';


class GaProfileRepo {
  update(String token, String email, String name, int idType, int idNumber, String phone, String address) async {
    try {
      Map data = {
        "email": email,
        "name": name,
        "id_type": idType,
        "id_number": idNumber,
        "phone": phone,
        "address": address
      };
      // print(data);
      String body = json.encode(data);
      var res = await http.put(
          Uri.parse(BaseUrl.urlUpdateProfile),
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