import 'package:gajiku_dev/data/models/my_project_details_v2_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../api/api.dart';
import '../models/my_project_list_model.dart';
import '../models/my_project_details_model.dart';


class GaClientRepo {
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

  clientProjectDetails(String token, int projectId) async {
    try {
      Map data = {"project_id": projectId};
      String body = json.encode(data);
      var res = await http.post(
        Uri.parse(BaseUrl.urlClientProjectDetails),
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
        print(res.body);
        return MyProjectDetailsV2Model.fromJson(json.decode(res.body));
      }
    } on Exception catch(e) {
      return e;
    }
  }
}