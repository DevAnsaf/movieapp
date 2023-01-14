import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/Data.dart';

class Helper{
  static String userData = 'USERDATA';

  SharedPreferences? prefs;
  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Write DATA
  static Future<bool> saveUserData(Data data) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //Map decode_options = jsonDecode(data.toJson().toString());
    String useData = jsonEncode(data);
    return await sharedPreferences.setString(userData, useData);
  }

  // get is data available
  static Future<String> isUserAvailable() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userData) ?? '';
  }
// Read Data
  static Future<Data?> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? jsonString = sharedPreferences.getString(userData) ?? '';
      Map userMap = jsonDecode(jsonString);
      var user = Data.fromJson(userMap);
      return user;

  }

  static Future<bool> removeAllPref() async {
    final pref = await SharedPreferences.getInstance();
    return await pref.clear();
  }
}