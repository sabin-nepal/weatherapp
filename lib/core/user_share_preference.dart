import 'package:shared_preferences/shared_preferences.dart';

class UserSharePreference {
  static Future<void> setSkip() async {
    final ref = await SharedPreferences.getInstance();
    ref.setBool("isSkip", true);
  }

  static Future isSkip() async {
    final ref = await SharedPreferences.getInstance();
    return ref.getBool("isSkip") ?? false;
  }

  static Future<void> setLocation(String location) async {
    final ref = await SharedPreferences.getInstance();
    ref.setString("location", location);
  }

  static Future getLocation() async {
    final ref = await SharedPreferences.getInstance();
    return ref.getString("location") ?? "";
  }
}
