import 'package:get_storage/get_storage.dart';

class Hostting {
  var storeg = GetStorage();
  static const String host = "https://beezar.arg-tr.com";
  static const String api = "$host/api";
  static const String image = "$host/public";
  //hrader
  Map<String, String> getHeader() {
    var token = storeg.read("token");
    if (token != null && token.toString().isNotEmpty) {
      return {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
    }
    return {
      'Accept': 'application/json',
    };
  }

  //api
  static Uri login = Uri.parse("$api/login");
  static Uri register = Uri.parse("$api/signup");
  static Uri checkTokenValidity = Uri.parse("$api/check-token-validity");
  static Uri getCategory = Uri.parse("$api/get_category");
}
