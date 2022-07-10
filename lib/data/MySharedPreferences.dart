import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  String name = "";

  MySharedPreferences() {
    loadSharedPreferences();
  }

  loadSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name").toString();
  }
}