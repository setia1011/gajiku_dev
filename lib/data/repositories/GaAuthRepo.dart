import 'package:http/http.dart' as http;
import 'dart:convert';
import '../api/api.dart';
import '../models/my_project_list_model.dart';


class GaAuthRepo {
  login(String username, String password) async {
    try {
      Map data = {"username": username, "password": password};
      String body = json.encode(data);
      var res = await http.post(
          Uri.parse(BaseUrl.urlLogin),
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

  clientProjectsList(String token) async {
    try {
      var res = await http.get(
          Uri.parse(BaseUrl.urlClientProjectsList),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          },
      );
      if (res.statusCode == 500) {
        return jsonEncode({"detail": "Terjadi kesalahan"});
      } else {
        Iterable iterableData = json.decode(res.body);
        List<MyProjectsListModel> listData = List<MyProjectsListModel>.from(iterableData.map((e) => MyProjectsListModel.fromJson(e)));
        return listData;
      }
    } on Exception catch(e) {
      return e;
    }
  }
}