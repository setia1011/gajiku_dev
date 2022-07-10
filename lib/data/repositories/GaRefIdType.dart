import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:gajiku_dev/data/api/api.dart';


class BackendService {
  static Future<List<Map<String, String>>> getSuggestions(String query) async {
    if (query.isEmpty && query.length < 3) {
      print('Query needs to be at least 3 chars');
      return Future.value([]);
    }

    var response = await http.get(Uri.parse(BaseUrl.urlFindIdType + query));
    List<Suggestion> suggestions = [];
    if (response.statusCode == 200) {
      Iterable json = convert.jsonDecode(response.body);
      suggestions = List<Suggestion>.from(json.map((model) => Suggestion.fromJson(model)));
      print('Number of suggestion: ${suggestions.length}.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return Future.value(suggestions
        .map((e) => {
          'id_description': e.idDescription,
          'id_type': e.idType,
          'id': e.id.toString()
        }).toList()
    );
  }
}

class Suggestion {
  final int id;
  final String idType;
  final String idDescription;

  Suggestion({
    required this.id,
    required this.idType,
    required this.idDescription,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
      idDescription: json['id_description'],
      idType: json['id_type'],
      id: json['id'],
    );
  }
}