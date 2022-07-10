import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gajiku_dev/data/api/api.dart';

class GaActiRepo {
  activate(String acticode) async {
    try {
      Map data = {"acticode": acticode};
      String body = json.encode(data);
      var res = await http.post(
          Uri.parse(BaseUrl.urlActivation),
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